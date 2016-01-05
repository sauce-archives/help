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
	<li><a href="#accessing-testobject-via-proxy">Accessing TestObject Via Proxy</a></li>
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

Run your Appium tests on TestObject no matter what language you're using. Just add some extra <a href="#general-test-setup">capabilities</a> to your test. For more control you can optionally connect to our <a href="/docs/api/appium">REST API</a>.


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

Test suites allow you to group your tests and manage their configuration through our UI. Once you have them set up you don't have to modify your CI configuration when you want to change the app, the devices on which tests will be run or the Appium version &ndash; you can do it via UI.

It works in the following way:

1. Request list of devices configured for your test suite using suite ID.
2. Create a matrix of devices-x-tests you are about to execute.
3. Send the matrix of tests you are about to execute to our <a href="/docs/api/appium">Appium API</a> &ndash; we will create a suite report and test reports for each test.
4. Each test report already has all the information needed to execute a test (app ID, Appium version, device ID), so once you create an Appium session the only capability you have to set is `testobject_test_report_id`, the rest is already on our server.
5. After each test is finished send us its result (whether it's passed or not).


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

In order to organize your test results in suites, you will need to make a couple of calls to our <a href="/docs/api/appium">Appium REST API</a>.


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

Prefer to be flexible? Just write your own client to organize your test results. Simply make a couple of calls to our <a href="/docs/api/appium">Appium API</a>.


<h3 id="automated-file-upload">Automated File Upload</h3>

You can upload via UI or use our <a href="/docs/api/storage">Storage API</a> to automate your file uploads.


<h3 id="accessing-testobject-via-proxy">Accessing TestObject Via Proxy</h3>

If you're running your tests in a network that requires a proxy to communicate with TestObject, there is some configuration
necessary if you're using the [TestObject Appium API](https://github.com/testobject/testobject-appium-java-api).

<h4>Proxy Configuration</h4>

To communicate with your proxy, you must provide the address and credentials (if necessary) for it. This can be done using
the following system properties:

* `https.proxyHost` - e.g. www.example.com
* `https.proxyPort` - e.g. 8888; default is 8080
* `https.proxyUser`
* `https.proxyPassword`

If your proxy has no authentication, you don't need to set `proxyUser` and `proxyPassword`.

<h4>Setting System Properties</h4>

[System properties](https://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html) can be set in code, or
passed in via the command line.

To set properties in code, use `System.getProperties().put()` such as this:

* `System.getProperties().put("http.proxyHost", proxyHost);`

Or, to set them via the command line, which may be more useful if you are triggering your tests via a CI such as Jenkins,
prepend the system property with -D, for example:

* `-Dhttps.proxyHost=www.example.com -Dhttps.proxyPort=8888`