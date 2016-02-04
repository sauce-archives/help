---
title: Watcher Setup on TestObject using TestNG
layout: en
permalink: docs/tools/appium/setups/testng/watcher/
---

<h4 id="watcher-setup">Intermediate Setup</h4>
This problem can be easily fixed by upgrading to a more powerful setup:

{% highlight java %}
@Listeners({ TestObjectTestNGResultWatcher.class })
public class IntermediateSetupTestTestNG implements AppiumDriverProvider {

    private AppiumDriver driver;

    @BeforeMethod
    public void beforeTest() throws MalformedURLException {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        capabilities.setCapability("testobject_api_key", "YOUR_API_KEY");
        capabilities.setCapability("testobject_app_id", "1");
        capabilities.setCapability("testobject_device", "YOUR_DEVICE");

        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

    }

    @Test
    public void testMethod() {
        /* Your test. */
    }

    @AfterMethod
    public void tearDown() {
        driver.quit();
    }

    @Override
    public AppiumDriver getAppiumDriver() {
        return this.driver;
    }
}
{% endhighlight %}

This setup will also need the latest [TestObject Appium Java Api](/docs/tools/appium/appium-java-api/), so you will have to add this line to your build.gradle file:

{% highlight bash %}
  compile 'org.testobject.extras.appium:appium-java-api:0.0.13'
{% endhighlight %}

and this repository in the "repository" section:

{% highlight bash %}
  maven {
    url "http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/"
  }
{% endhighlight %}

This setup allows you to register your test results on TestObject.