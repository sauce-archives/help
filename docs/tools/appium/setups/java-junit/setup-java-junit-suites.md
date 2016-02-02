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

<h5 id="how-it-works">How the setup works</h5>

1. A new Suite Report including Test Reports for each individual test run is created via REST API. You will be able to monitor the progress of the Suite Report in the UI.
2. For each test run your client-side code establishes a connection to our Appium server (https://app.testobject.com:443/api/appium/wd/hub)
3. The client session is authenticated with your API key specified in the "testobject_api_key" capability
4. TestObject identifies the testing device and the test report for this specific test run using the "testobject_report_id" capability
5. The test is executed from your client machine through the API session, connecting to our Appium server using the standard Selenium WebDriver JSON Wire Protocol. When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
6. With a final REST call the status (passed or failed) is set for the test run. You can now view the completed Test Report.