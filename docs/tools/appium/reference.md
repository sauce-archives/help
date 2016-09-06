---
title: Reference
layout: en
permalink: docs/tools/appium/reference/
---

<ul>
	<li><a href="#appium-capabilities">Appium Capabilities</a></li>
	<li><a href="#run-with-any-language">Run with Any Language</a></li>
	<li><a href="#live-view-and-report-urls">Live-View and Report URLs</a></li>	
	<li><a href="#device-caching">Device Caching</a></li>
  	<li><a href="#accessing-testobject-via-proxy">Accessing TestObject Via Proxy</a></li>
</ul>

<h3 id="appium-capabilities">Appium Capabilities</h3>
When you are running an Appium test on TestObject, the Appium server on TestObject's side receives all the capabilities you set on the client side. This means you can theoretically set all the capabilities allowed by the Appium version you are running against. Due to the nature of our service though, setting some capabilities may produce a different outcome than you would expect from just running an Appium server locally. For example:

- all the emulator-only capabilities will not work on TestObject, as we only provide access to real devices;
- the 'app' capability is always overwritten to point the server to the app file you uploaded to our system;
- the 'platformName' capability is overwritten because we select the platform your test will run on based on the kind of project you are pointing to with your API key;
- the 'noReset' capability only works if [testobject_cache_device](#device-caching) is set to true. By default, 'noReset' will be set to true.
- for test suite runs, the 'testobject_suite_name' and "testobject_test_name' capabilities are ignored;
- the 'deviceName' capability is always overwritten.

Different setups might have slightly different ways of handling capabilities and/or different requirements. Please make sure you also check the guide relative to your <a href="/docs/tools/appium/setups/junit/suites">specific setup</a> to make sure you are providing everything that is required.

<h3 id="run-with-any-language">Run with Any Language</h3>

Run your Appium tests on TestObject no matter what language you're using. Just add some extra <a href="#general-test-setup">capabilities</a> to your test. For more control you can optionally connect to our <a href="/docs/api/appium">REST API</a>.

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

	AppiumDriver driver = new AppiumDriver(new URL("http://appium.testobject.com/wd/hub"), capabilities);
	driver.getCapabilities().getCapability("testobject_test_report_url");
	driver.getCapabilities().getCapability("testobject_test_live_view_url");

	...
}
{% endhighlight %}

<h3 id="device-caching">Device Caching</h3>

By default, the TestObject platform uninstalls the application, performs device cleaning, and de-allocates the device between every Appium session. This means that if you have multiple test methods, you will by default wait for this cleaning process between every test method.

To speed up test execution, you can set the desired capability `testobject_cache_device` to `"true"`. This will leave the device allocated to you for a short time after each Appium session. If you start another test on the device, you won't need to wait for the allocation and device cleaning process to be repeated.  

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
