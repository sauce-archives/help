---
title: Basic Setup on TestObject using TestNG
layout: en
permalink: docs/tools/appium/setups/testng/basic/
---

<h4 id="basic-setup">Basic Setup</h4>
The basic setup is the quickest way to get testing on TestObject. Here is what it looks like with testNG.

{% highlight java %}
public class BasicTestSetup {

    private AppiumDriver driver;

    @BeforeMethod
    public void setUp() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();

        /* These are the capabilities we must provide to run our test on TestObject */
        capabilities.setCapability("testobject_api_key", "YOUR_API_KEY");
        capabilities.setCapability("testobject_app_id", "1");
        capabilities.setCapability("testobject_device", "YOUR_DEVICE");

        /* The driver will take care of establishing the connection, so we must provide
        * it with the correct endpoint and the requested capabilities. */
        driver = new AndroidDriver(new URL("https://app.testobject.com:443/api/appium/wd/hub"), capabilities);

    }

    @Test
    public void testMethod() {
        /* Your test. */
    }

    /* We disable the driver after EACH test has been executed. */
    @AfterMethod
    public void tearDown(){
        driver.quit();
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
      testCompile 'io.appium:java-client:3.3.0'
      testCompile 'org.seleniumhq.selenium:selenium-server:2.50.1'
  }
{% endhighlight %}

Depending on your environment, you may also need to import TestNG as a dependency itself, and a testng.xml file to run your tests.

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

With this kind of barebones setup you will be able to run tests on the TestObject platform, but you will not be using it to its fullest potential. Your tests will run on the device you have chosen, and you will be able to access a number of information regarding them, but the results of the tests won't be registered in the test reports on the platform.