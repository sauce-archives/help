---
title: Appium
layout: en
permalink: docs/testing-tools/automation/appium/
---

<li><a href="#introduction">Introduction</a></li>
<li><a href="#getting-started">Getting Started</a></li>
<li><a href="#capabilities">Desired Capabilities</a></li>
<li><a href="#capability-java">Capability Example</a></li>
<li><a href="/docs/guides/appium-maven/">Run Appium with Maven</a></li>

<h3 id="introduction">Introduction</h3>
Appium is an open source test automation framework for use with native, hybrid  mobile and web apps. It drives iOS and Android apps using the WebDriver <a href="https://code.google.com/p/selenium/wiki/JsonWireProtocol" target="_blank">JSON wire protocol</a>. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium should be familiar too.

<h3 id="getting-started">Getting Started</h3>
Your existing Appium tests will run at the TestObject platform with just some small changes. You just need to modify the desired capabilities.

<h4>Requirements</h4>
To get started you need:

1. An TestObject Account (<a href="https://app.testobject.com/" target="_blank">Signup here</a>).
2. Create a new app (web or native) in your account.
3. Upload your app either via web-ui or via our api.


<h4>The Test Process</h4>
Appium tests will run

1. Client-side code establishes a connection with our Appium Server. (https://app.testobject.com:443/api/appium/wd/hub)
2. Client session is authenticated with the API Key included in the desired capabilities section. ("testobject_api_key")
3. TestObject identifies the test device using the "testobject_device" capability in the desired capabilities section.
4. Test executes over the API session from your client machine to our Appium Server using the standard Selenium Web Driver JSON Protocol.

When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
Please remember to call driver.quit() at the end of your test. Otherwise the device will remain allocated for another 60 seconds before timing out.

<h3 id="capabilities">Capabilities</h3>

We will automatically set the capabilities platformName, deviceName and automationName. In case your test contains either of them, they will be ignored on our system.

<img src="/img/tools/automation/capabilities.png" alt="Appium Capabilities">

<h4>Appium Server URL</h4>
Set the following URL as the remote address of your Appium driver: https://app.testobject.com:443/api/appium/wd/hub

<h4>testobject_api_key</h4>
With this key the TestObject platform authenticates you.

<h4>testobject_project</h4>
Thats your app name at the TestObject platform.

<h4>testobject_app_id</h4>
Thats the id of the app version which is under test. If you are uploading an app via API the response of the upload command will be the ID of the newly uploaded app. Use it to populate the 'testobject_app_id' capability.

<h4>testobject_device</h4>
This capability specifies the device. You are able to switch the device via our device chooser.

<h3 id="capability-java">Capability Example</h3>

{% highlight java %}
		DesiredCapabilities capabilities = new DesiredCapabilities();
		capabilities.setCapability("testobject_api_key", "B50CB4047BCB49DDB750B6CB52B137F8");
		capabilities.setCapability("testobject_project", "sixt");
		capabilities.setCapability("testobject_app_id", "1");
		capabilities.setCapability("testobject_device", "LG_Nexus_4_E960_real");

		driver = new AppiumDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);
{% endhighlight %}
