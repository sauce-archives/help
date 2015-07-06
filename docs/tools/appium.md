---
title: Appium
layout: en
permalink: docs/testing-tools/automation/appium/
---


<li><a href="#introduction">Introduction</a></li>
<li><a href="#getting-started">Getting Started</a></li>
<li><a href="#capabilities">Desired Capabilities</a></li>
<li><a href="#test-result-watcher">Test Result Watcher</a></li>
<li><a href="#test-result-api">Test Result API</a></li>
<li><a href="#live-view-and-report-urls">Live-View and Report URLs</a></li>
<li><a href="#automated-file-upload">Automated File Upload</a></li>
<li><a href="#java-utilities">Java Utilities</a></li>
<li><a href="#example-tests">Complete Example Tests</a></li>

Related topic: <a href="/docs/guides/appium-maven/">Running Appium with Maven</a>  
Related topic: <a href="/docs/guides/creating-ipa/">Creating IPA file for Appium tests</a>

<h3 id="introduction">Introduction</h3>

Appium is an open-source test automation framework for mobile apps &ndash; native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver <a href="https://code.google.com/p/selenium/wiki/JsonWireProtocol" target="_blank">JSON wire protocol</a>. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium should be easy to get started with.


<h3 id="getting-started">Getting Started</h3>

Your existing Appium tests will run on the TestObject platform with just some small changes. You just need to modify the <a href="#capabilities">desired capabilities</a>.


<h4>Requirements</h4>

Steps to get started:

1. Create a <a href="https://app.testobject.com/signup" target="_blank">TestObject account</a>
2. Add a new app (web or native) to your account
3. Upload your app either via web UI or via <a href="#automated-file-upload">command line</a>


<h4>Test Execution Process</h4>

The following steps will be executed to run your Appium test:

1. Your client-side code establishes a connection to our Appium server (https://app.testobject.com:443/api/appium/wd/hub)
2. The client session is authenticated with your API key specified in the "testobject_api_key" capability
3. TestObject identifies the test device using the "testobject_device" capability
4. The test is executed from your client machine through the API session, connecting to our Appium server using the standard Selenium Web Driver JSON Protocol

When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.

Please remember to call driver.quit() at the end of your test. Otherwise the device will remain allocated for another 60 seconds before timing out.

{% highlight java %}
private AndroidDriver driver;

...

@After
public void tearDown() {
	if(driver!=null){
		driver.quit();
	}
}	
{% endhighlight %}


<h3 id="capabilities">Capabilities</h3>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.

For convenience you may use our <a href="https://github.com/testobject/testobject-appium-java-api/blob/master/src/main/java/org/testobject/appium/common/TestObjectCapabilities.java">Java utility class</a>.


<img src="/img/tools/automation/capabilities.png" alt="Appium Capabilities">


{% highlight java %}

private AndroidDriver driver;

@Before
public void setup() throws MalformedURLException {
	DesiredCapabilities capabilities = new DesiredCapabilities();

	...

	capabilities.setCapability("testobject_api_key", "B50CB4047BCB49DDB750B6CB52B137F8");
	capabilities.setCapability("testobject_app_id", "1");
	capabilities.setCapability("testobject_device", "LG_Nexus_5_real");

	driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
}		
{% endhighlight %}


<h4>Appium Server URL</h4>

Set the following URL as the remote address of your Appium driver:

https://app.testobject.com:443/api/appium/wd/hub


<h4>testobject_api_key</h4>

*Required*

With this key the TestObject platform authenticates you.


<h4>testobject_app_id</h4>

*Required*

ID of the app version under test. If you are uploading an app via API, the response of the upload command will be the ID of the newly uploaded app. Use it to populate the 'testobject_app_id' capability.


<h4>testobject_device</h4>

*Required*

Specifies the device to run the test on. Devices can be chosen on the Appium Instructions page.


<h4>testobject_appium_version</h4>

*Optional*

Appium version to be used. Default is the latest Appium version. Available versions can be found on the Appium Instructions page.


<h4>testobject_suite_name</h4>

*Optional*

You can set this to a name of your choice so that you can search for the test results more easily later.


<h4>testobject_test_name</h4>

*Optional*

You can set this to a name of your choice so that you can search for the test results more easily later.


<h3 id="test-result-watcher">Test Result Watcher</h3>

TestObject generates detailed reports for your Appium tests run on our real devices in the cloud. These include logs, screenshots and a video capturing the device screen during the test execution. 

With our <a href="https://github.com/testobject/testobject-appium-java-api/blob/master/src/main/java/org/testobject/appium/junit/TestObjectTestResultWatcher.java">test result watcher</a> your reports can be marked as successful or failed. With only two extra lines of code and the <a href="#java-utilities">Maven dependency</a> you're set.

{% highlight java %}
@Rule
public TestObjectTestResultWatcher watcher = new TestObjectTestResultWatcher();

private AndroidDriver driver;

@Before
public void setup() throws MalformedURLException {
	...

	watcher.setAppiumDriver(driver);
}
{% endhighlight %}

The TestObjectTestResultWatcher will also quit your Appium driver instance when the test has finished. So you no longer need to close it in the tear-down method.

To get the result watcher via Maven, just add our <a href="#java-utilities">API utilities</a> to your pom.xml.


<h3 id="test-result-api">Test Result API</h3>

Writing your own client to set the test results is also easy. Simply make a REST call as follows:

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/session/{appium_session_id}/test
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	"passed": true|false
}
{% endhighlight %}

The request should be made with basic authentication where the username is your TestObject Appium API key and the password is empty:

{% highlight javascript %}
username=your_api_key
password=
{% endhighlight %}

The request must be sent while the Appium session is still running, that is, before quitting the Appium driver.


<h3 id="live-view-and-report-urls">Live-View and Report URLs</h3>

When starting an Appium session we enhance the default capabilities returned by the session by two properties:


<h4>testobject_test_live_view_url</h4>

The URL to the live-view your test execution (available only while the Appium session is ongoing)


<h4>testobject_test_report_url</h4>

The URL to the final Appium report (available after the test when the test finished executing)



{% highlight java %}

private AndroidDriver driver;

@Before
public void setup() throws MalformedURLException {
	...

	AppiumDriver driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
	driver.driver.getCapabilities().getCapability("testobject_test_report_url");
	driver.driver.getCapabilities().getCapability("testobject_test_live_view_url");

	...
}
{% endhighlight %}


<h3 id="automated-file-upload">Automated File Upload</h3>

Use the following command to upload your app file. Alternatively, you can upload via UI.

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" --data-binary @your_app.apk
{% endhighlight %}

The response of the curl upload command will be the ID of the newly uploaded app. Use it to populate the "testobject_app_id" capability.


Optionally, you can send the following header parameters:

<h4>App-Identifier</h4>

*Optional*

Your custom unique identifier for your app


<h4>App-DisplayName</h4>

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


<h3 id="java-utilities">Java Utilities</h3>

Java utility classes to provide a better experience when running Appium tests in the TestObject cloud:<br>
<a href="https://github.com/testobject/testobject-appium-java-api" target="_blank">https://github.com/testobject/testobject-appium-java-api</a>

To get the utilities as a Maven dependency, just add the follwoing to your pom.xml:

{% highlight xml %}
<dependencies>
    <dependency>
        <groupId>org.testobject.extras.appium</groupId>
        <artifactId>appium-java-api</artifactId>
        <version>0.0.5</version>
    </dependency>
</dependencies>

<repositories>
    <repository>
        <id>testobject</id>
        <url>http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/</url>
    </repository>
</repositories>
{% endhighlight %}


<h3 id="example-tests">Complete Example Tests</h3>

Example Appium tests for native apps and web apps:<br>
<a href="https://github.com/testobject/appium-java-example" target="_blank">https://github.com/testobject/appium-java-example</a>
