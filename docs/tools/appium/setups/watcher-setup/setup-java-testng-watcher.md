---
title: Watcher Setup on TestObject using TestNG
layout: en
permalink: docs/tools/appium/setups/watcher-setup/testng/
---

If you want to register your test result on TestObject, you will need to use our result watcher. This is what a simple Watcher setup with testNG looks like:

{% highlight java %}
@Listeners({ TestObjectTestNGTestResultWatcher.class })
public class AppiumDriverCalculatorWatcherTestTestNG implements TestObjectWatcherProvider {

	private TestObjectListenerProvider provider = TestObjectListenerProvider.newInstance();

	@BeforeMethod
	public void beforeTest() throws MalformedURLException {

		DesiredCapabilities capabilities = new DesiredCapabilities();

		capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_API_KEY, "YOUR_API_KEY");
		capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_DEVICE, "TESTOBJECT_DEVICE_NAME");

		AppiumDriver appiumDriver = new AndroidDriver(new URL("http://appium.testobject.com/wd/hub"), capabilities);
		provider.setDriver(appiumDriver);
		provider.setLocalTest(false);
	}

	@Test
	public void testMethod() {
		/* Your test. */
	}

	@AfterMethod
	public void tearDown() {
		provider.getAppiumDriver().quit();
	}

	@Override
	public TestObjectListenerProvider getProvider() {
		return provider;
	}
}
{% endhighlight %}

Along with the mandatory capabilities we have specified, you can send over some optional ones to customize your test runs:

* <strong>testobject_app_id</strong>, if you want to use an app version other than the default one.
* <strong>testobject_appium_version</strong>, if you want to run your tests against an Appium version other than the default one.
* <strong>testobject_suite_name</strong>, if you want to apply a label to your tests so that they are easier to group / find later on.
* <strong>testobject_test_name</strong>, if you want to specify a name for your test that will be displayed in place of the default one.

<h4>Dependencies</h4>
This setup needs the latest [TestObject Appium Java Api](/docs/tools/appium/appium-api/), so you will have to add the instruction to compile our dependency to your build.gradle file:
{% highlight bash %}
  testCompile 'org.testobject:testobject-appium-java-api:0.0.26'
{% endhighlight %}
