---
title: Basic Setup on TestObject using C#
layout: en
permalink: docs/tools/appium/setups/basic-setup/nunit/
---

Appium tests can be written in C# and conveniently run on TestObject. In this example, we will be using [NUnit](http://.nunit.org/), the most popular testing framework for C#. Currently, only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible from the test report on TestObject.

A first basic test setup with C# and NUnit could look like this:

{% highlight C# %}

using NUnit.Framework;
using System;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Remote;
using OpenQA.Selenium.Appium;

namespace AppiumBasicSetup
{
	[TestFixture()]
	public class BasicTest
	{
		AndroidDriver<AppiumWebElement> driver;
	
		[SetUp()]
		public void SetUp()
		{
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.SetCapability("testobject_api_key", "YOUR API KEY");
			capabilities.SetCapability("testobject_device", "Samsung_Galaxy_S6_real");
			Uri server = new Uri("http://appium.testobject.com/wd/hub");
			
			driver = new AndroidDriver<AppiumWebElement>(server, capabilities);
		}
		
		[Test()]
		public void FirstTest()
		{
			driver.GetScreenshot();
		}
		
		[TearDown()]
		public void TearDown()
		{
			driver.Quit();
		}
	}
}
{% endhighlight %}

The only dependencies for running such a test would be the [Appium Webdriver](http://nuget.org/packages/Appium.WebDriver/) and [NUnit](http://nuget.org/packages/NUnit/). You can manage these dependencies with [Nuget](http://nuget.org/) using the following packages.config file:

{% highlight bash %}
<?xml version="1.0" encoding="utf-8"?>
<packages>
	<package id="Appium.WebDriver" version="2.0.1.1" targetFramework="net45" />
    <package id="Castle.Core" version="3.3.3" targetFramework="net45" />
	<package id="Newtonsoft.Json" version="9.0.1" targetFramework="net45" />
	<package id="NUnit" version="2.6.4" targetFramework="net45" />
	<package id="Selenium.Support" version="2.53.1" targetFramework="net45" />
	<package id="Selenium.WebDriver" version="2.53.1" targetFramework="net45" />
</packages>
{% endhighlight %}

You can also view the full sample code on the [TestObject Github Page](http://github.com/testobject/appium-c-sharp).
