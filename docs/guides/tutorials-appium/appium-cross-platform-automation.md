---
title: Setting Up Your Appium Project for Cross-Platform Automation
layout: en
permalink: docs/guides/appium-cross-platform-automation/
---

One of Appium's most exciting features is the possibility to write a single test script that will run on both Android and iOS. This tutorial will show you how you can build your test setup so that it will take advantage of this possibility. Even though this guide is at least partially based on TestObject's architecture, it is easily adaptable to different scenarios.

<h3 id="page_object">Writing a PageObject setup</h3>

First of all, open up an editor of your choice, create a new project, then write your test setup by following the [PageObject design pattern](#page_object). This will allow us to leverage the power of the appium annotations, which will be fundamental for our purposes.
Firstly, we will begin with the PageObject design pattern, which is basically a way of organising your code to make your setup more compact, more readable and to make the user interaction flow more evident.

For more information about PageObject, see our [Appium setup with PageObject](/docs/guides/appium-advanced-setup/) guide.

<h3 id="appium_anno">Appium annotations</h3>
We are going to use <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> Appium annotations to fetch UI elements in apps using different locators (id, xpath or text, ...). Here we are using only one annotation per element to grab it from the UI using its <strong>id</strong>:

{% highlight java %}
@AndroidFindBy(id = "signup_button")
MobileElement signUpButton;
{% endhighlight %}

In the case of a cross-platform project, we use both of <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> to find element(s):

{% highlight java %}
@AndroidFindBy(id = "signup_button")
@iOSFindBy(xpath = "//UIAButton[1]")
MobileElement signUpButton;
{% endhighlight %}

If we use two annotations, one on top of the other as shown here, the relevant one will be selected based on which kind of AppiumDriver we have instantiated (AndroidDriver or IOSDriver).

<h3 id="test_setup">Cross-platform test setup</h3>
The aim of using a cross-platform setup is to make the process of selecting a platform (Android or iOS) dynamic. We will be covering two possible solutions: one based on environment variables and one based on cloud device descriptors.

<h4 id="simple_setup">Determining the platform through environment variables</h4>
If you have a PageObject-based setup, you probably have a class which takes care of instantiating your AppiumDriver. Our first solution is to instantiate the right kind of driver depending on the value of the environment variable we will be reading. This is what our class could look like:

{% highlight java %}
public class AppiumDriverBuilder {

    private TestObjectTestResultWatcher resultWatcher;

    public AppiumDriverBuilder withTestResultWatcher(TestObjectTestResultWatcher resultWatcher) {
        this.resultWatcher = resultWatcher;
        return this;
    }

    public AppiumDriver build() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("testobject_api_key", resultWatcher.getApiKey());
        capabilities.setCapability("testobject_test_report_id", resultWatcher.getTestReportId());

        // This capability is only needed for local testing.
        capabilities.setCapability("deviceName", "testDevice");

        // Getting the platform from the environment variable.
        String platform = System.getenv("PLATFORM");

        // Selecting the test platform depending on the "PLATFORM" environment variable.
        if (platform.equals("ios")) {
            return new IOSDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else if (platform.equals("android")) {
            return new AndroidDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else {
            throw new Exception("Unable to read device platform.");
        }
    }
}
{% endhighlight %}

Have a look at this Appium cross-platform <a href="https://github.com/testobject/appium-cross-platform-example" target="blank">example</a> to have an overview of the whole setup.

<h4 id="advanced_setup">Determining the platform through device descriptors</h4>
This is an alternative, slightly more advanced way to set up your tests to conveniently run on both platforms. The special thing about this setup is that we look up our device's OS directly through its descriptor, which we can get from TestObject. This not only saves us the step of having to configure an environment variable to determine the platform we are running our tests on, but also allows us to do this on a per-test basis.

{% highlight java %}
public class AppiumDriverBuilder {

    private DesiredCapabilities capabilities;
    private Device device;
    private TestObjectTestResultWatcher resultWatcher;

    public AppiumDriver build(Device testDevice, TestObjectTestResultWatcher watcher) throws Exception {

        capabilities = new DesiredCapabilities();
        device = testDevice;
        resultWatcher = watcher;

        // TestObject's basic mandatory capabilities for a JUnit suite setup.
        capabilities.setCapability("testobject_api_key", resultWatcher.getApiKey());
        capabilities.setCapability("testobject_test_report_id", resultWatcher.getTestReportId());

        // Configure for the cloud.
        device.initWithCloudDeviceInformation(resultWatcher.getTestDeviceId());

        // Provide needed platform version-specific capabilities and instantiate platform-specific AppiumDriver.
        if (device.platform.equals(DeviceDescriptor.OS.IOS)) {
            return new IOSDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else if (device.platform.equals(DeviceDescriptor.OS.ANDROID)) {
            return new AndroidDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else {
            throw new Exception("Was unable to read device platform.");
        }
    }
}
{% endhighlight %}

The Device class connects to TestObject using your TestObject username and password, then gets a list of the available devices, after that it determines which platform will be used.

{% highlight java %}
public class Device {

    public DeviceDescriptor.OS platform;
    public String deviceId;

    public void initWithCloudDeviceInformation(String watcherDeviceId) {

        deviceId = watcherDeviceId;

        // Establish a connection with TestObject using your username and password.
        TestObjectClient client = TestObjectClient.Factory.create();
        client.login(System.getenv("TESTOBJECT_USERNAME"), System.getenv("TESTOBJECT_PASSWORD"));

        // Get the device descriptor list from TestObject.
        List<DeviceDescriptor> descriptorList = client.listDevices();

        // Find the device descriptor corresponding to our chosen device and get its platform.
        for (DeviceDescriptor descriptor : descriptorList) {
            if (descriptor.id.equals(watcherDeviceId)) {
                this.platform = descriptor.os;
            }
        }
    }
}
{% endhighlight %}

Have a look at this Appium cross-platform Advanced Setup <a href="https://github.com/testobject/appium-cross-platform-example/tree/advanced-setup" target="blank">example</a> to have an overview of the whole setup.

Make sure to use the latest version of our [Appium Java API](/docs/tools/appium/appium-api/).

<h3 id="run">Run your test!</h3>
After setting up your project as we just explained, you have the possibility to run your tests either locally on your machine, or in the cloud using a CI server. This last way of doing things is similar to what we did in [Appium Jenkins tutorial](/docs/tools/appium/continuous-integration/jenkins-gradle/). The following environment variables will be needed to run the test:

For the [environment variable based setup](#simple_setup):

+ <strong>TESTOBJECT_API_KEY</strong> and it must be equal to "your TestObject api key".
+ <strong>PLATFORM</strong> it must be either "ios" or "android".

For the [device descriptor based setup](#advanced_setup):

+ <strong>TESTOBJECT_API_KEY</strong> it must be equal to "your TestObject api key".
+ <strong>TESTOBJECT_USERNAME</strong> your TestObject username.
+ <strong>TESTOBJECT_PASSWORD</strong> your TestObject password.

After adding them, click the "Run" button, or click "Build with parameters" button for the CI Server to run the test. Give it some time to be run. As soon as it is done, you will be able to see what the outcome of the test you just ran was.

---
---
---
---
