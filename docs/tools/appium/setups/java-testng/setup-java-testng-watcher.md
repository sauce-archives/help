---
title: Watcher Setup on TestObject using TestNG
layout: en
permalink: docs/tools/appium/setups/testng/watcher/
---

If you want to register your test result on TestObject, you will need to use our result watcher. This is what a simple Watcher setup with testNG looks like:

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

<h4>Dependencies</h4>
This setup needs the latest [TestObject Appium Java Api](/docs/tools/appium/appium-java-api/), so you will have to add two things to your build.gradle file:

...the instruction to compile our dependency:
{% highlight bash %}
  compile 'org.testobject.extras.appium:appium-java-api:0.0.13'
{% endhighlight %}

...and a link to our repository in the "repository" section:
{% highlight bash %}
  maven {
    url "http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/"
  }
{% endhighlight %}
