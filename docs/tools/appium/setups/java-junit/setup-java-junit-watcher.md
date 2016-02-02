---
title: Watcher Setup on TestObject using JUnit
layout: en
permalink: docs/tools/appium/setups/junit/watcher/
---

<h4 id="watcher-setup">The Watcher Setup</h4>
This problem can be easily fixed by upgrading to a more powerful setup:

{% highlight java %}
public class WatcherTestSetup {

    /* This is the key piece of our test, since it allows us to
   * connect to the device we will be running the app onto.*/
    private AppiumDriver driver;

    /* Sets the test name to the name of the test method. */
    @Rule
    public TestName testName = new TestName();

    /* Takes care of sending the result of the tests over to TestObject. */
    @Rule
    public TestObjectTestResultWatcher resultWatcher = new TestObjectTestResultWatcher();

    /* This is the setup that will be run before the test. */
    @Before
    public void setUp() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        capabilities.setCapability("testobject_api_key", "YOUR_API_KEY");
        capabilities.setCapability("testobject_app_id", "1");
        capabilities.setCapability("testobject_device", "Motorola_Moto_G_2nd_gen_real");

        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

        /* IMPORTANT! We need to provide the Watcher with our initialized AppiumDriver */
        resultWatcher.setAppiumDriver(driver);

    }

    /* IMPORTANT! driver.quit() is not called anymore, as the Watcher is now
       taking care of this. You can get rid of the tearDown method. */

    @Test
    public void testMethod() {
        /* Your test. */
    }

}
{% endhighlight %}

This setup will also need the latest [TestObject Appium Java Api](https://github.com/testobject/testobject-appium-java-api), so you will have to add this line to your build.gradle file:

{% highlight bash %}
  compile 'org.testobject.extras.appium:appium-java-api:0.0.13'
{% endhighlight %}

and this repository in the "repository" section:

{% highlight bash %}
  maven {
    url "http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/"
  }
{% endhighlight %}

This setup allows you to register your test results on TestObject. If you are running many tests, it would probably make sense to organize them in suites. This can be achieved using the <a href="/docs/tools/appium/setups/junit/suites/">Suites Setup</a>.