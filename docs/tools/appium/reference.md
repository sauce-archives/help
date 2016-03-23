---
title: Reference
layout: en
permalink: docs/tools/appium/reference/
---

<ul>
	<li><a href="#run-with-any-language">Run with Any Language</a></li>
	<li><a href="#suite-setup">Complete Test Setup &mdash; Organize your Results in Suites</a></li>
	<li><a href="#live-view-and-report-urls">Live-View and Report URLs</a></li>
	<li><a href="#rest-api">REST API</a></li>
	<li><a href="#automated-file-upload">Automated File Upload</a></li>
	<li><a href="#accessing-testobject-via-proxy">Accessing TestObject Via Proxy</a></li>
</ul>

<h3 id="run-with-any-language">Run with Any Language</h3>

Run your Appium tests on TestObject no matter what language you're using. Just add some extra <a href="#general-test-setup">capabilities</a> to your test. For more control you can optionally connect to our <a href="/docs/api/appium">REST API</a>.

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