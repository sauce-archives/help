---
title: Watcher Setup on TestObject using JUnit
layout: en
permalink: docs/tools/appium/setups/junit/watcher/
alias: /docs/tools/appium/setup/
---

If you want to register your test result on TestObject, you will need to use our result watcher. This is what a simple Watcher setup with JUnit looks like:

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

<h4>Dependencies</h4>
This setup needs the latest [TestObject Appium Java Api](/docs/tools/appium/appium-java-api/), so you will have to add the instruction to compile our dependency to your build.gradle file:
{% highlight bash %}
  testCompile 'org.testobject:testobject-appium-java-api:0.0.19'
{% endhighlight %}

<h4>Why use it</h4>
This setup allows you to register your test results on TestObject. If you are running many tests, it would probably make sense to organize them in suites. This can be achieved using the <a href="/docs/tools/appium/setups/junit/suites/">Suites Setup</a>.

<h4 id="parallelized-setup">Running the Watcher Setup on Multiple Devices in Parallel</h4>
If you want to run your tests on multiple devices, but for some reason cannot take advantage of the <a href="/docs/tools/appium/setups/junit/suites/">Suites Setup</a>, then you can still achieve a similar result with parameterized tests. The downside to this approach is that, when testing on TestObject, your test results won't be aggregated in suites. This is because you are basically just running several "single" tests without providing any way for the system to tell they are part of a single group. You can find an example of advanced setup that uses this approach [here](https://github.com/testobject/calculator-test-gradle/tree/parallelized_setup).