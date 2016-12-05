---
title: Suite Setup on TestObject using JUnit
layout: en
permalink: docs/tools/appium/setups/suite-setup/junit/
---

To run your tests simultaneously on multiple devices, it is recommended that you [create a suite](#create-a-suite) in your project on TestObject to choose the devices you want your tests to run on and also to distinguish and access your test results more efficiently.
It doesn't take much to upgrade your setup to be able to run these:

{% highlight java %}
/* You must add these two annotations on top of your test class. */
@TestObject(testLocally = false, testObjectApiKey = "YOUR_API_KEY", testObjectSuiteId = YOUR_SUITE_NUMBER)
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

        driver = new AndroidDriver(new URL("http://appium.testobject.com/wd/hub"), capabilities);

        resultWatcher.setAppiumDriver(driver);

    }

    @Test
    public void testMethod() {
        /* Your test. */
    }

}
{% endhighlight %}

<h3>Dependencies</h3>
This setup needs the latest [TestObject Appium Java Api](/docs/tools/appium/appium-api/), so you will have to add the instruction to compile our dependency to your `build.gradle` file:
{% highlight bash %}
  testCompile 'org.testobject:testobject-appium-java-api:0.0.24'
{% endhighlight %}
For the Maven projects without the build.gradle file, you need instead to add the [TestObject Appium Java Api](/docs/tools/appium/appium-api/) to your `pom.xml` file as:
{% highlight bash %}
<dependencies>
    <dependency>
        <groupId>org.testobject</groupId>
        <artifactId>testobject-appium-java-api</artifactId>
        <version>0.0.24</version>
    </dependency>
</dependencies>
{% endhighlight %}

<h3>Environment variables</h3>
You can overwrite the following parameters in your setup through environment variables:

* **TESTOBJECT_API_ENDPOINT**, which is by default https://app.testobject.com:443/api, so pointing to our platform;
* **TESTOBJECT_API_KEY**, which you always have to provide as it identifies the app you want to run your tests on;
* **TESTOBJECT_SUITE_ID**, which is also mandatory as it tells our platform in which suite it should store the test results;
* **TESTOBJECT_DEVICE_IDS**, which can be only used to override the device selection you usually do through our web UI;
* **TESTOBJECT_APP_ID**, which can be used to override the app version you have selected through your suite UI;
* **TESTOBJECT_TIMEOUT**, which controls the maximum duration of the test suite.

You can set the value of these environment variables through your CI server (for example Jenkins) and have a better, more flexible Appium testing experience!

If you need to quickly switch to testing on a local device, just set the "**testLocally**" flag to *true* through the TestObject annotation in the setup class, or set the environment variable **TESTOBJECT_TEST_LOCALLY** to true.

<h3>Why use it</h3>
One of the advantages of using test suites on TestObject is that the number of capabilities you need to send over is reduced, as you will now be able to specify things like the Appium version you want to run your tests with and the version of the app you want to test directly from the suite's UI. The same is also true for the devices, which get selected through our device picker. This means that the "**testobject_device**", "**testobject_test_name**", "**testobject_suite_name**" and "**testobject_appium_version**" capabilities will be ignored in the context of this setup.

When you feel comfortable writing tests using this last setup, it would probably make sense for you to have a look at our [PageObject setup](/docs/guides/appium-advanced-setup/), which is basically just a way to write better structured, more readable and more easily maintanable tests.

<h3 id="how-it-works">How it works</h3>

1. A new Suite Report including Test Reports for each individual test run is created via REST API. You will be able to monitor the progress of the Suite Report in the UI.
2. For each test run your client-side code establishes a connection to our Appium server (http://appium.testobject.com/wd/hub)
3. The client session is authenticated with your API key specified in the "**testobject_api_key**" capability
4. TestObject identifies the testing device and the test report for this specific test run using the "**testobject_report_id**" capability
5. The test is executed from your client machine through the API session, connecting to our Appium server using the standard Selenium WebDriver JSON Wire Protocol. When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
6. With a final REST call the status (passed or failed) is set for the test run. You can now view the completed Test Report.

<h3 id="create-a-suite">How to create and use a Suite?</h3>

1. [Create an account](/docs/general-reference/creating-an-account/) or [login to TestObject](https://app.testobject.com/#/login).
2. Open the app project you want to test it (if you don't have a project yet, [see how](/docs/general-reference/managing-your-apps/) to create one).
3. Click on the blue Automated Testing button and select Appium.
4. Choose the *Test Suites* tab and click on the *New Suite* button.
5. Now, you can give the suite a name and choose the devices you want your tests to run on and then, click on the *Save* button.
6. After the saving, you will be able to see a list of your suites, to use one, get simply the suite id (e.g. 7) and use it in your setup.

<image src="/img/tools/setups/suites_overview.png">

***
***
***
***
***
***
***
***
***
