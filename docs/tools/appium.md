---
title: Appium
layout: en
permalink: docs/testing-tools/automation/appium/
---


<li><a href="#introduction">Introduction</a></li>
<li><a href="#getting-started">Getting Started</a></li>
<li><a href="#capabilities">Desired Capabilities</a></li>
<li><a href="#capability-java">Capabilities Example</a></li>
<li><a href="#example-tests">Example Tests</a></li>
<li><a href="/docs/guides/appium-maven/">Run Appium with Maven</a></li>


<h3 id="introduction">Introduction</h3>

Appium is an open source test automation framework for use with native, hybrid  mobile and web apps. It drives iOS and Android apps using the WebDriver <a href="https://code.google.com/p/selenium/wiki/JsonWireProtocol" target="_blank">JSON wire protocol</a>. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium should be familiar too.


<h3 id="getting-started">Getting Started</h3>

Your existing Appium tests will run at the TestObject platform with just some small changes. You just need to modify the desired capabilities.


<h4>Requirements</h4>

To get started you need:

1. Create a TestObject account (<a href="https://app.testobject.com/" target="_blank">sign up here</a>)
2. Create a new app (web or native) in your account
3. Upload your app either via web UI or via command line with Curl


<h4>Test Process</h4>

The following steps will be executed to run your Appium test:

1. Client-side code establishes a connection to our Appium server (https://app.testobject.com:443/api/appium/wd/hub)
2. Client session is authenticated with the API key specified in the "testobject_api_key" capability
3. TestObject identifies the test device using the "testobject_device" capability
4. Test executes through the API session from your client machine, connecting to our Appium Server using the standard Selenium Web Driver JSON Protocol

When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
Please remember to call driver.quit() at the end of your test. Otherwise the device will remain allocated for another 60 seconds before timing out.


<h3 id="capabilities">Capabilities</h3>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.


<img src="/img/tools/automation/capabilities.png" alt="Appium Capabilities">

<h4>Appium Server URL</h4>
Set the following URL as the remote address of your Appium driver:
https://app.testobject.com:443/api/appium/wd/hub

<h4>testobject_api_key</h4>
With this key the TestObject platform authenticates you.

<h4>testobject_app_id</h4>
ID of the app version under test. If you are uploading an app via API, the response of the upload command will be the ID of the newly uploaded app. Use it to populate the 'testobject_app_id' capability.

<h4>testobject_device</h4>
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


<h3 id="capability-java">Capabilities Example</h3>

{% highlight java %}
		DesiredCapabilities capabilities = new DesiredCapabilities();
		capabilities.setCapability("testobject_api_key", "B50CB4047BCB49DDB750B6CB52B137F8");
		capabilities.setCapability("testobject_app_id", "1");
		capabilities.setCapability("testobject_device", "LG_Nexus_4_E960_real");

		driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
{% endhighlight %}


<h3 id="example-tests">Example Tests</h3>

We've set up some Appium tests for native apps and web apps. Both test cases are written in Java. You can find them in our Github repository:
<a href="https://github.com/testobject/appium-java-example" target="_blank">https://github.com/testobject/appium-java-example</a>
