---
title: Reference
layout: en
permalink: docs/tools/appium/reference/
---


<ul>
	<li><a href="#java-setup">Java Test Setup with Continuous Integration</a></li>
	<li><a href="#run-with-any-language">Run with Any Language</a></li>
	<li><a href="#basic-setup">Basic Test Setup</a></li>
	<li><a href="#suite-setup">Complete Test Setup &mdash; Organize your Results in Suites</a></li>
	<li><a href="#live-view-and-report-urls">Live-View and Report URLs</a></li>
	<li><a href="#rest-api">REST API</a></li>
	<li><a href="#automated-file-upload">Automated File Upload</a></li>
</ul>


<h3 id="java-setup">Java Test Setup with Continuous Integration</h3>

Running test suites with TestObject from your CI platform is easy. Our Java client allows you to define the values of the parameters you have to provide the TestObject platform through environment variables. Specifically, you can provide the following environment variables:

* TESTOBJECT_API_ENDPOINT, which is by default https://app.testobject.com:443/api, so pointing to our platform;
* TESTOBJECT_API_KEY, which you always have to provide as it identifies the app you want to run your tests on;
* TESTOBJECT_SUITE_ID, which is also mandatory as it tells our platform in which suite it should store the test results;
* TESTOBJECT_DEVICE_IDS, which can be used to override the device selection you usually do through our web UI;
* TESTOBJECT_TIMEOUT, which controls the maximum duration of the test suite.

You can set the value of these environment variables through your CI server (<a href="/docs/continuous-integration/appium-jenkins-gradle/">for example Jenkins</a>) and have a better, more flexible Appium testing experience!

<h4>Running tests locally</h4>
If you need to quickly switch to testing on a local device, just set the "testLocally" flag to true through the TestObject annotation, or set the environment variable "TESTOBJECT_TEST_LOCALLY" to true.


<h3 id="run-with-any-language">Run with Any Language</h3>

Run your Appium tests on TestObject no matter what language you're using. Just add some extra <a href="#general-test-setup">capabilities</a> to your test. For more control you can optionally connect to our <a href="#rest-api">REST API</a>.


<h3 id="basic-setup">Basic Test Setup</h3>

<h4>Capabilities</h4>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.


<h5>testobject_api_key</h5>

This is the key TestObject uses to authenticate you.


<h5>testobject_app_id</h5>

ID of the app version you want to run your test against.


<h5>testobject_device</h5>

ID of the testing device.


<h4>Remote Address</h4>

Set the following URL as the remote address of your Appium driver:<br>
https://app.testobject.com:443/api/appium/wd/hub


<h4>Quitting the Driver</h4>

If you're not using the <a href="/docs/tools/appium/setup">TestObjectResultWatcher</a>, please remember to call driver.quit() at the end of your test. Otherwise the device will remain allocated for another 60 seconds before timing out.


<h3 id="suite-setup">Complete Test Setup &mdash; Organize your Results in Suites</h3>

<h4>Capabilities</h4>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.


<h5>testobject_api_key</h5>

This is the key TestObject uses to authenticate you.


<h5>testobject_test_report_id</h5>

ID of the test report your results are to be associated with.


<h4>Remote Address</h4>

Set the following URL as the remote address of your Appium driver:<br>
https://app.testobject.com:443/api/appium/wd/hub


<h4>REST Calls</h4>

In order to organize your test results in suites, you will need to make a couple of calls to our <a href="#rest-api">REST API</a>.


<h3>Live-View and Report URLs</h3>

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


<h3 id="rest-api">REST API</h3>

Prefer to be flexible? Just write your own client to organize your test results. Simply make a couple of REST calls to our API.

Please note: The requests must be sent while the Appium session is still running, that is, before quitting the Appium driver.


<h4 id="authentication">Authentication</h4>

All requests should be made with basic authentication where the username is your TestObject API key and the password is empty:

{% highlight javascript %}
username=your_api_key
password=
{% endhighlight %}


<h4 id="read-devices">Read Devices</h4>

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


<h4 id="start-suite-report">Start Suite Report</h4>

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


<h4 id="finish-suite-report">Finish Suite Report</h4>

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


<h4 id="finish-test-report">Finish Test Report</h4>

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


<h4 id="update-suite">Update Suite</h4>

Use this method to update the properties of a suite.

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
