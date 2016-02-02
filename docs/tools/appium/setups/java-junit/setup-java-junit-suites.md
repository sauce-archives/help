---
title: Suites Setup on TestObject using JUnit
layout: en
permalink: docs/tools/appium/setups/junit/suites/
---

<h4 id="suite-setup">The Suites Setup</h4>
To make sure you can distinguish and access your test results more efficiently, it is highly recommended that you use test suites. It doesn't take much to upgrade your setup to be able to run these:

{% highlight java %}
/* You must add these two annotations on top of your test class. */
@TestObject(testObjectApiKey = "YOUR_API_KEY", testObjectSuiteId = YOUR_SUITE_NUMBER)
@RunWith(TestObjectAppiumSuite.class)
public class CompleteTestSetup {

    private AppiumDriver driver;

    @Rule
    public TestName testName = new TestName();

    @Rule
    public TestObjectTestResultWatcher resultWatcher = new TestObjectTestResultWatcher();

    @Before
    public void setUp() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        capabilities.setCapability("testobject_api_key", resultWatcher.getApiKey());
        capabilities.setCapability("testobject_test_report_id", resultWatcher.getTestReportId());

        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

        resultWatcher.setAppiumDriver(driver);

    }

    @Test
    public void testMethod() {
        /* Your test. */
    }

}
{% endhighlight %}

One of the advantages of using test suites on TestObject is that the number of capabilities you need to send over is reduced, as you will now be able to specify things like the Appium version you want to run your tests with and the version of the app you want to test directly from the suite's UI. The same is also true for the devices, which get selected through our device picker. This means that the "testobject_app_id", "testobject_device", "testobject_test_name", "testobject_suite_name" and "testobject_appium_version" capabilities will be ignored in the context of this setup.

When you feel comfortable writing tests using this last setup, it would probably make sense for you to have a look at our [PageObject setup](/docs/tools/appium/advanced), which is basically just a way to write better structured, more readable and more easily maintanable tests.

<h4 id="parallelized-setup">Appendix: Parallelized Setup (watcher and multiple devices without suites)</h4>
If you want to run your tests on multiple devices, but for some reason cannot take advantage of the Suite setup, then you can still achieve a similar result with parameterized tests. The downside to this approach is that, when testing on TestObject, your test results won't be aggregated in suites. This is because you are basically just running several "single" tests without providing any way for the system to tell they are part of a single group. you can find an example of advanced setup that uses this approach [here](https://github.com/testobject/calculator-test-gradle/tree/parallelized_setup).