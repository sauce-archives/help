---
title: Setting up your Tests
layout: en
permalink: docs/tools/appium/setup/
---

<ul>
  <li><a href="#java">Java</a><ul>
    <li><a href="#junit">JUnit</a><ul>
      <li><a href="#basic-setup">Basic Setup</a></li>
      <li><a href="#intermediate-setup">Intermediate Setup</a></li>
      <li><a href="#suite-setup">Suite Setup</a></li>
      <li><a href="#parallelized-setup">Appendix: Parallelized Setup</a></li>
    </ul></li>
    <li><a href="#testng">TestNG</a><ul>
      <li><a href="#testng-basic-setup">Basic Setup</a></li>
    </ul></li>
  </ul></li>
  <li><a href="#ruby">Ruby</a><ul>
    <li><a href="#test-unit">Test-Unit</a><ul>
      <li><a href="#ruby-basic-setup">Basic Setup</a></li>
    </ul></li>
  </ul></li>
</ul>

<h3 id="#java">Running your Appium tests on TestObject with Java</h3>

There are several ways of running your Appium tests on our platform. Here we go through them in increasing order of complexity and refinement.

<h3 id="junit">JUnit</h3>
<h4 id="basic-setup">The basic, 5-minutes setup</h4>

Whether you are starting from scratch or you have an already existing Appium test written, adapting it to run on TestObject is a matter of minutes. A first basic setup for testing a simple calculator app could look like this:

{% highlight java %}
public class BasicTestSetup {

    private AppiumDriver driver;

    @Before
    public void setUp() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        /* These are the capabilities we must provide to run our test on TestObject */
        capabilities.setCapability("testobject_api_key", "YOUR_API_KEY");
        capabilities.setCapability("testobject_app_id", "1");
        capabilities.setCapability("testobject_device", "Motorola_Moto_G_2nd_gen_real");

        /* The driver will take care of establishing the connection, so we must provide
        * it with the correct endpoint and the requested capabilities. */
        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

    }

    /* We disable the driver after EACH test has been executed. */
    @After
    public void tearDown(){
        driver.quit();
    }

    @Test
    public void twoPlusTwoOperation() {
        /* Your test. */
    }

}
{% endhighlight %}

Along with the mandatory capabilities we have specified, you can send over some optional ones to customize your test runs:

* testobject_appium_version, if you want to run your tests against an Appium version other than the default one (1.3.5)
* testobject_test_name, if you want to specify a name for your test that will be displayed in place of the default one
* testobject_suite_name, if you want to apply a label to your tests so that they are easier to group / find later on

The only needed dependencies for running such a test would be the [Appium Java Client](https://github.com/appium/java-client) and the [Selenium Standalone Server](http://www.seleniumhq.org/download/). In case you are building your project with Gradle, your dependencies in your build.gradle file should look something like this:

{% highlight bash %}
  dependencies {
      testCompile group: 'junit', name: 'junit', version: '4.11'

      testCompile 'io.appium:java-client:3.2.0'
      testCompile 'org.seleniumhq.selenium:selenium-server:2.25.0'

  }
{% endhighlight %}

With this kind of barebones setup you will be able to run tests on the TestObject platform, but you will not be using it to its fullest potential. Your tests will run on the device you have chosen, and you will be able to access a number of information regarding them, but the results of the tests won't be registered in the test reports on the platform.

<h4 id="intermediate-setup">The intermediate setup (watcher without suites)</h4>
This problem can be easily fixed by upgrading to a more powerful setup:

{% highlight java %}
public class IntermediateTestSetup {

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
    public void twoPlusTwoOperation() {
        /* Your test. */
    }

}
{% endhighlight %}

This setup will also need the latest [TestObject Appium Java Api](https://github.com/testobject/testobject-appium-java-api), so you will have to add this line to your build.gradle file:

{% highlight bash %}
  compile 'org.testobject.extras.appium:appium-java-api:0.0.11'
{% endhighlight %}

and this repository in the "repository" section:

{% highlight bash %}
  maven {
    url "http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/"
  }
{% endhighlight %}

This setup allows you to register your test results on TestObject. If you are running many tests, it would probably make sense to organize them in suites. Read on to find out how.

<h4 id="suite-setup">The complete setup (watcher and suites)</h4>
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
    public void twoPlusTwoOperation() {
        /* Your test. */
    }

}
{% endhighlight %}

One of the advantages of using test suites on TestObject is that the number of capabilities you need to send over is reduced, as you will now be able to specify things like the Appium version you want to run your tests with and the version of the app you want to test directly from the suite's UI. The same is also true for the devices, which get selected through our device picker. This means that the "testobject_app_id", "testobject_device" and "appiumVersion" capabilities will be ignored in the context of this setup.

When you feel comfortable writing tests using this last setup, it would probably make sense for you to have a look at our [PageObject setup](/docs/tools/appium/advanced), which is basically just a way to write better structured, more readable and more easily maintanable tests.

<h4 id="parallelized-setup">Appendix: Parallelized Setup (watcher and multiple devices without suites)</h4>
If you want to run your tests on multiple devices, but for some reason cannot take advantage of the Suite setup, then you can still achieve a similar result with parameterized tests. The downside to this approach is that, when testing on TestObject, your test results won't be aggregated in suites. This is because you are basically just running several "single" tests without providing any way for the system to tell they are part of a single group. you can find an example of advanced setup that uses this approach [here](https://github.com/testobject/calculator-test-gradle/tree/parallelized_setup).

<h3 id="testng">TestNG</h3>
<h4 id="testng-basic-setup">Basic Setup</h4>
It is also possible to use TestNG to run Appium tests on our platform. A basic setup for testing with TestNG could look like this:
{% highlight java %}
public class BasicTestSetup {

    private AppiumDriver driver;

    @BeforeMethod
    public void setUp() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        /* These are the capabilities we must provide to run our test on TestObject */
        capabilities.setCapability("testobject_api_key", "YOUR_API_KEY");
        capabilities.setCapability("testobject_app_id", "1");
        capabilities.setCapability("testobject_device", "Motorola_Moto_G_2nd_gen_real");

        /* The driver will take care of establishing the connection, so we must provide
        * it with the correct endpoint and the requested capabilities. */
        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

    }

    /* We disable the driver after EACH test has been executed. */
    @AfterMethod
    public void tearDown(){
        driver.quit();
    }

    @Test
    public void twoPlusTwoOperation() {
        /* Your test. */
    }

}
{% endhighlight %}

The only dependencies for this setup are on Appium Java Client and the Selenium Standalone Server. If you are building your project with Gradle, your build.gradle file should look something like this:

{% highlight bash %}
  dependencies {
      testCompile 'io.appium:java-client:3.2.0'
      testCompile 'org.seleniumhq.selenium:selenium-server:2.25.0'
  }
{% endhighlight %}

Depending on your environment, you may also need a testng.xml file to run your tests.

{% highlight xml %}
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="Suite1" verbose="1" >
    <test name="Test1" >
        <classes>
            <class name="BasicTestSetup" />
        </classes>
    </test>
</suite>
{% endhighlight %}

<h3 id="ruby">Running your Appium tests on TestObject with Ruby</h3>
Appium supports a wide number of languages, allowing you to automate testing with the language you prefer. Here we go through how to run your Appium tests on our platform using Ruby.
<h3 id="test-unit">Test-Unit</h3>
<h4 id="ruby-basic-setup">Basic Setup</h4>
To begin testing on our platform with Ruby, you need to install the ruby library supporting Appium and also test-unit, a testing framework for Ruby. Install the dependencies by running:
{% highlight bash %}
gem install appium_lib
gem install test-unit
{% endhighlight %}

With the dependencies installed, you can begin testing on TestObject with the following setup:
{% highlight ruby %}
require 'appium_lib'
require 'test/unit'

class BasicTestSetup < Test::Unit::TestCase
  def setup
    desired_capabilities = {
        caps:       {
            testobject_api_key: 'YOUR_API_KEY',
            testobject_app_id: '1',
            testobject_device: 'Motorola_Moto_G_2nd_gen_real'
        },
        appium_lib: {
            server_url: 'https://app.testobject.com:443/api/appium/wd/hub',
            wait: 10
        }
    }

    # Start the driver
    @driver = Appium::Driver.new(desired_capabilities).start_driver
  end

  # test method names must start with "test_"
  # to be recognized by the test-unit framework
  def test_login
    # Your test
  end

  def teardown
    @driver.quit
  end
end
{% endhighlight %}
