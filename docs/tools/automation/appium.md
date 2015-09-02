---
title: Appium
layout: en
permalink: docs/testing-tools/automation/appium/
---

<!--links will go to tutorials-->
<li><a href="#introduction">Introduction</a></li>
<li><a href="#reporting">Reporting</a></li>
<li><a href="#getting-started">Getting Started</a></li>

<li><a href="#run-with-java">Run with Java</a></li>
<li><a href="#java-api-client">Java API Client</a></li>
<li><a href="#java-test-setup">Java Test Setup</a></li>

<li><a href="#run-with-any-language">Run with Any Language</a></li>
<li><a href="#rest-api">REST API</a></li>
<li><a href="#general-test-setup">General Test Setup</a></li>
<li><a href="#example-tests">Complete Example Tests</a></li>

<li><a href="#live-view-and-report-urls">Live-View and Report URLs</a></li>
<li><a href="#automated-file-upload">Automated File Upload</a></li>



Looking for the old version? Check out the <a href="/docs/testing-tools/automation/appium-deprecated">documentation for deprecated usage</a>.



<h3 id="introduction">Introduction</h3>

Appium is an open-source test automation framework for mobile apps &ndash; native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver <a href="https://code.google.com/p/selenium/wiki/JsonWireProtocol" target="_blank">JSON wire protocol</a>. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium should be easy to get started with.<br>
If not have a look at our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>, where we help you to set up Appium on your system.


<h3 id="reporting">Reporting</h3>

You will get detailed reports for each of your test runs which are structured as follows:

* <strong>Suite Report</strong>: Gives you an overview of all the results when executing a suite.
* <strong>Test Report</strong>: Presents all the details of an individual test run including logs, screenshots, etc.

Read more about our <a href="/docs/testing-tools/automation/reporting">reporting for automated tests</a>.


<h3 id="getting-started">Getting Started</h3>

Your existing Appium tests will run on the TestObject platform with just some small changes. Enjoy our special <a href="#run-with-java">goodies for Java</a> or get started in <a href="run-with-any-language">any language</a>.


<h4>Requirements</h4>

Steps for you to get started:

1. Create a <a href="https://app.testobject.com/signup" target="_blank">TestObject account</a>
2. Log into your account and add a new app (native, hybrid or web). This is where you first upload your app file or enter the URL to your website. You can change them later.
3. Go to Automated Testing -> Appium and create a new Appium Suite. This is where you first choose the devices you want to test on. You can change them later. A Suite holds all the preferences for your test executions: app version, testing devices, etc.


<h4>Test Execution Process</h4>

How the test execution works:

1. A new Suite Report including Test Reports for each individual test run is created via REST API. You will be able to monitor the progress of the Suite Report in the UI.
2. For each test run your client-side code establishes a connection to our Appium server (https://app.testobject.com:443/api/appium/wd/hub)
3. The client session is authenticated with your API key specified in the "testobject_api_key" capability
4. TestObject identifies the testing device and the test report for this specific test run using the "testobject_report_id" capability
5. The test is executed from your client machine through the API session, connecting to our Appium server using the standard Selenium WebDriver JSON Wire Protocol. When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
6. With a final REST call the status (passed or failed) is set for the test run. You can now view the completed Test Report.



<h3 id="run-with-java">Run with Java</h3>

Make use of our <a href="#java-api-client">Java API client</a> and <a href="#java-test-setup">setup your test</a> by adding just a few extra lines of code.



<h3 id="java-api-client">Java API Client</h3>

For your convenience when running your Appium tests on the TestObject cloud we wrote these utilities for you:<br>
<a href="https://github.com/testobject/testobject-appium-java-api" target="_blank">https://github.com/testobject/testobject-appium-java-api</a>

To get the utilities as a Maven dependency, just add the following to your pom.xml:

{% highlight xml %}
<dependencies>
    <dependency>
        <groupId>org.testobject.extras.appium</groupId>
        <artifactId>appium-java-api</artifactId>
        <version>0.0.6</version>
    </dependency>
</dependencies>

<repositories>
    <repository>
        <id>testobject</id>
        <url>http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/</url>
    </repository>
</repositories>
{% endhighlight %}



<h3 id="java-test-setup">Java Test Setup</h3>

With the API client from above the setup with Java is extra simple.

Add the following to your existing Appium Test:

1. Add @TestObject and @RunWith class annotations
2. Add the TestObjectTestResultWatcher annotated with @Rule 
3. Set TESTOBJECT_API_KEY and TESTOBJECT_TEST_REPORT_ID capabilities
4. Pass the Appium driver to the watcher using setAppiumDriver

The watcher will also quit your Appium driver instance when the test has finished. Do not close it in the tear-down method.

This is an example of how your test could look like:

{% highlight java %}
@TestObject(testObjectApiKey = "E8DD63C22A3841FD90ED87DCB6D31127", testObjectSuiteId = 1)
@RunWith(TestObjectAppiumSuite.class)
public class CalculatorTest {

	@Rule
	public TestObjectTestResultWatcher watcher = new TestObjectTestResultWatcher();

	private AndroidDriver driver;

	@Before
	public void setup() throws MalformedURLException {
		DesiredCapabilities capabilities = new DesiredCapabilities();

		...

		capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_API_KEY, watcher.getApiKey());
		capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_TEST_REPORT_ID, watcher.getTestReportId());

		driver = new AndroidDriver(TestObjectCapabilities.TESTOBJECT_APPIUM_ENDPOINT, capabilities);
		watcher.setAppiumDriver(driver);
	}

	@After
	public void tearDown() {
		// Do not quit the driver here. The watcher will take care of it.
	}

	@Test
	public void yourTestCase() {
		...
	}

}
{% endhighlight %}

<h4>Java Test Setup with Continuous Integration</h4>

Running test suites with TestObject from your CI platform is easy. Our Java client allows you to define the values of the parameters you have to provide the TestObject platform through environment variables. Specifically, you can provide the following environment variables:

* {% highlight java %}TESTOBJECT_API_ENDPOINT{% endhighlight %}, which is by default https://app.testobject.com:443/api, so pointing to our platform;
* {% highlight java %}TESTOBJECT_API_KEY{% endhighlight %}, which you always have to provide as it identifies the app you want to run your tests on;
* {% highlight java %}TESTOBJECT_SUITE_ID{% endhighlight %}, which is also mandatory as it tells our platform in which suite it should store the test results;
* {% highlight java %}TESTOBJECT_DEVICE_IDS{% endhighlight %}, which can be used to override the device selection you usually do through our web UI;
* {% highlight java %}TESTOBJECT_TIMEOUT{% endhighlight %}, which controls the maximum duration of the test suite.

You can set the value of these environment variables through your CI server (<a href="/docs/guides/continuous/appium-jenkins-gradle">for example Jenkins</a>) and have a better, more flexible Appium testing experience!

<h4>Running tests locally</h4>
If you need to quickly switch to testing on a local device, just set the "testLocally" flag to true through the TestObject annotation, or set the environment variable "TESTOBJECT_TEST_LOCALLY" to true.



<h4>Java Test Setup with Continuous Integration</h4>

Running test suites with TestObject from your CI platform is easy. Our Java client allows you to define the values of the parameters you have to provide the TestObject platform through environment variables. Specifically, you can provide the following environment variables:

* {% highlight java %}TESTOBJECT_API_ENDPOINT{% endhighlight %}, which is by default https://app.testobject.com:443/api, so pointing to our platform;
* {% highlight java %}TESTOBJECT_API_KEY{% endhighlight %}, which you always have to provide as it identifies the app you want to run your tests on;
* {% highlight java %}TESTOBJECT_SUITE_ID{% endhighlight %}, which is also mandatory as it tells our platform in which suite it should store the test results;
* {% highlight java %}TESTOBJECT_DEVICE_IDS{% endhighlight %}, which can be used to override the device selection you usually do through our web UI;
* {% highlight java %}TESTOBJECT_TIMEOUT{% endhighlight %}, which controls the maximum duration of the test suite.

You can set the value of these environment variables through your CI server (<a href="/docs/guides/continuous/appium-jenkins-gradle">for example Jenkins</a>) and have a better, more flexible Appium testing experience!

<h4>Running tests locally</h4>
If you need to quickly switch to testing on a local device, just set the "testLocally" flag to true through the TestObject annotation, or set the environment variable "TESTOBJECT_TEST_LOCALLY" to true.



<h3 id="run-with-any-language">Run with Any Language</h3>

Run your Appium tests on TestObject no matter what language you're using. Just connect to our <a href="#rest-api">REST API</a> and add <a href="#general-test-setup">two extra capabilities</a> to your test.



<h3 id="rest-api">REST API</h3>

Writing your own client to organize your test results is easy. Simply make a couple of a REST calls to our API:

Please note: The requests must be sent while the Appium session is still running, that is, before quitting the Appium driver.


<h4>Authentication</h4>

All requests should be made with basic authentication where the username is your TestObject API key and the password is empty:

{% highlight javascript %}
username=your_api_key
password=
{% endhighlight %}


<h4>Read Devices</h4>

Use this method to read the IDs of the devices which you had selected for the specified suite.

{% highlight javascript %}
GET https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/devices
{% endhighlight %}

Response:

{% highlight javascript %}
[
	"Fairphone_real"
]
{% endhighlight %}


<h4>Start Suite Report</h4>

Use this method to create a new suite report including its test reports.

{% highlight javascript %}
POST https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/start
{% endhighlight %}

Request body:

{% highlight javascript %}
[{
	"className": "com.myapp.mytestclass",
	"methodName": "myTestMethod",
	"deviceId": "Fairphone_real"
}]
{% endhighlight %}

Response:

{% highlight javascript %}
[{
	id: 1,
	testReports: {
		id: 1,
		test: {
			"className": "com.myapp.mytestclass",
			"methodName": "myTestMethod",
			"deviceId": "Fairphone_real"
		}
	}
}]
{% endhighlight %}


<h4>Finish Suite Report</h4>

Use this method to mark all test reports contained in this suite report as finished.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/{suite_report_id}/finish
{% endhighlight %}

Response:

{% highlight javascript %}
[{
	id: 1,
	testReports: {
		id: 1,
		test: {
			"className": "com.myapp.mytestclass",
			"methodName": "myTestMethod",
			"deviceId": "Fairphone_real"
		}
	}
}]
{% endhighlight %}


<h4>Finish Test Report</h4>

Use this method to set the status of a specific test report and mark it as finished.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/{suite_report_id}/results/{test_report_id}/finish
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	"passed": true|false
}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	id: 1,
	test: {
		"className": "com.myapp.mytestclass",
		"methodName": "myTestMethod",
		"deviceId": "Fairphone_real"
	}
}
{% endhighlight %}


<h4>Update Suite</h4>

Use this method to update the properties of a suite. Set frameworkVersion to "LATEST" if you want to use the latest available version.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	"id": 1,
	"title": "My new suite title",
	"appVersionId": 1,
	"frameworkVersion": "1.3.7",
	"deviceIds": [
		"Fairphone_real"
	]
}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	"id": 1,
	"title": "My new suite title",
	"appVersionId": 1,
	"frameworkVersion": "1.3.7",
	"deviceIds": [
		"Fairphone_real"
	]
}
{% endhighlight %}



<h3 id="general-test-setup">General Test Setup</h3>

<h4>Capabilities</h4>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.

<h5>testobject_api_key</h5>

With this key TestObject authenticates you.


<h5>testobject_test_report_id</h5>

ID of the test report your result are to be associated with.


<h4>Remote Address</h4>

Set the following URL as the remote address of your Appium driver:<br>
https://app.testobject.com:443/api/appium/wd/hub


<h4>Quitting the Driver</h4>

If you're not using the <a href="#java-test-setup">TestObjectResultWatcher</a>, please remember to call driver.quit() at the end of your test. Otherwise the device will remain allocated for another 60 seconds before timing out.

This is an example of how your test could look like:

{% highlight java %}

private AndroidDriver driver;

@Before
public void setup() throws MalformedURLException {
	DesiredCapabilities capabilities = new DesiredCapabilities();

	...

	capabilities.setCapability("testobject_api_key", "B50CB4047BCB49DDB750B6CB52B137F8");
	capabilities.setCapability("testobject_test_report_id", "1");

	driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
}

@After
public void tearDown() {
	if (driver != null){
		driver.quit();
	}
}

@Test
public void yourTestCase() {
	...
}
{% endhighlight %}



<h3 id="example-tests">Complete Example Tests</h3>

Example Appium tests for native apps and web apps:<br>
<a href="https://github.com/testobject/appium-java-example" target="_blank">https://github.com/testobject/appium-java-example</a>



<h3 id="live-view-and-report-urls">Live-View and Report URLs</h3>

When starting an Appium session we enhance the default capabilities returned by the session by two properties:


<h5>testobject_test_live_view_url</h5>

The URL to the live-view your test execution (available only while the Appium session is ongoing)


<h5>testobject_test_report_url</h5>

The URL to the final Appium Test Report (available after the test has finished executing)


This is an example of how to access the capabilities:

{% highlight java %}

private AndroidDriver driver;

@Before
public void setup() throws MalformedURLException {
	...

	AppiumDriver driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
	driver.getCapabilities().getCapability("testobject_test_report_url");
	driver.getCapabilities().getCapability("testobject_test_live_view_url");

	...
}
{% endhighlight %}



<h3 id="automated-file-upload">Automated File Upload</h3>

Use the following command to upload your app file. Alternatively, you can upload via UI.

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" --data-binary @your_app.apk
{% endhighlight %}

The response of the curl upload command will be the ID of the newly uploaded app. Use it to <a href="#rest-api">update the appVersionId</a> of your suite.


Optionally, you can send the following header parameters:

<h5>App-Identifier</h5>

*Optional*

Your custom unique identifier for your app


<h5>App-DisplayName</h5>

*Optional*

Your custom display name


{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" -H "App-DisplayName: yourCustomDisplayName" --data-binary @your_app.apk
{% endhighlight %}


By providing a custom identifier you can also check if an app was already uploaded and prevent duplicate uploads.

First, get all apps for a given MD5:  

{% highlight bash %}
curl -u "your_username:your_api_key" -X GET https://app.testobject.com:443/api/storage/app?appIdentifier=MD5_hash_of_your_app
{% endhighlight %}

Only if the call returns an empty JSON array, start uploading the file:  

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" -H "App-Identifier: MD5_hash_of_your_app" --data-binary @your_app.apk
{% endhighlight %}
