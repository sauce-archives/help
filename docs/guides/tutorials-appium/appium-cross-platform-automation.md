---
title: Appium cross-platform automation
layout: en
permalink: docs/guides/appium-cross-platform-automation/
---

You have the same application on both platforms iOS and Android, and needs to be tested. The old way to do that is to write two separated scripts for each platform, one for Android and one for iOS. But it is unfortunatelly not a good idea at all, because in this way the script will be repeated twice and the maintenance of the code will be so complicated. But with Appium There is no need to duplicate a ton of code by creating two separate and almost identical test scripts! You will be able to write a single script and execute it on both Android and iOS for automation testing. Keep on reading to find out how.

###Steps
1. Open up an editor of your choice, create a new project, then write your [Test Setup](#test_setup) and your testing script by following the [PageObject design pattern](#page_object) way and using [Appium annotations](#appium_anno).
2. Open <a href="https://app.testobject.com" target="blank">TestObject</a> website, login and create two projects: the first project will be for your Android app and will contain your apk file, and the second project will be for your iOS app and will contain your ipa file.
3. Create a suite in each project, and don't forget to add some devices to each suite (at least one).
4. [Run](#run) your test.
5. <a href="#example" target="blank">Example</a>.


<h3 id="page_object">PageObject design pattern</h3>
Firstly, we will begin with the PageObject design pattern, which is basically a way of organising your code to make your setup more compact, more readable and to make the user interaction flow more evident using encapsulation.

For more information about PageObject, see our [Appium setup with PageObject](/docs/guides/appium-advanced-setup/) guide.

<h3 id="appium_anno">Appium annotations</h3>
It is not convenient to use the old way of finding elements for a cross-platform project. So what we are going to do is to use <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> Appium annotations to fetch UI elements in apps using (id, xpath or text, ...) of the elements. Here we are using only one annotation per element to grab it from the UI using its <strong>id</strong>:

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

Which annotation is going to be used? When we use Android and iOS annotations together, it doesn't at all mean that both of them are going to be used at the same time, only one of them will be, and it depends on the platform we use. So if we are testing on the Android platform and instantiating an Android Appium Driver in our setup method, then the Android annotation will be used. But if we have instantiated an iOS driver, the iOS annotation will be used.

<h3 id="test_setup">Cross-platform Test Setup</h3>
The aim of uaing a cross-platform setup is to make the process of selecting a platform (Android or iOS) dynamic. In this tutorial, we will cover two different setups. Feel free to use the one you want.

<h4 id="simple_setup">Simple Setup</h4>
This is a cross-platform test setup which shows you how to set your test up in the easiest way. The first class we need to create is "AbstractTest" which uses the TestObjectTestResultWatcher to register your result on TestObject, and also the AppiumDriverBuilder to establish the connection with TestObject.

{% highlight java %}
public class AbstractTest {

    @Rule
    public TestObjectTestResultWatcher resultWatcher = new TestObjectTestResultWatcher();

    private AppiumDriver driver;
    protected Komoot app;

    @Before
    public void connect() throws Exception {
        this.driver = new AppiumDriverBuilder()
                .withTestResultWatcher(resultWatcher)
                .build();

        resultWatcher.setAppiumDriver(driver);
        app = new Komoot(driver);
    }
}
{% endhighlight %}

The AppiumDriverBuilder class is a helper class where we set our capabilities to connect to the Appium server, and also we instantiate an Appium driver depending on the "PLATFORM" environment variable:

{% highlight java %}
public class AppiumDriverBuilder {
    // To resgister your tests results on TestObject
    private TestObjectTestResultWatcher resultWatcher;

    public AppiumDriverBuilder withTestResultWatcher(TestObjectTestResultWatcher resultWatcher) {
        this.resultWatcher = resultWatcher;
        return this;
    }

    public AppiumDriver build() throws Exception {

        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("testobject_api_key", resultWatcher.getApiKey());
        capabilities.setCapability("testobject_test_report_id", resultWatcher.getTestReportId());
        // This capabilitiy is only needed for local testing.
        capabilities.setCapability("deviceName", "testDevice");

        // Getting the platform from the environment variable.
        String platform = System.getenv("PLATFORM");

        // Selecting the test platform depending on the "PLATFORM" environment variable.
        if (platform.equalsIgnoreCase("ios")) {
            return new IOSDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else if (platform.equalsIgnoreCase("android")) {
            return new AndroidDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else {
            throw new Exception("Unable to read device platform.");
        }
    }
}
{% endhighlight %}

Have a look at this Appium cross-platform [example](https://github.com/testobject/appium-cross-platform-example).

<h4 id="advanced_setup">Advanced setup</h4>
This is an alternative and advanced way to set up your tests. The special thing in this setup is that we use the device descriptors to select the suitable platform automatically instead of supplying it manually through the environment variables. The "AbstractTest" class here is exactly the same as it is in the [Simple setup](#simple_setup) except that we use the "Device" class to determine the platform we use.

{% highlight java %}
public class AbstractTest {

    @Rule
    public TestObjectTestResultWatcher resultWatcher = new TestObjectTestResultWatcher();

    private AppiumDriver driver;
    protected App app;

    @Before
    public void connect() throws Exception {
        AppiumDriverBuilder driverBuilder = new AppiumDriverBuilder();
        Device device = new Device();

        this.driver = driverBuilder.build(device, resultWatcher);
        resultWatcher.setAppiumDriver(driver);
        app = new App(driver, device);
    }
}
{% endhighlight %}

The "AppiumDriverBuilder" class is consisting of only one method "build", and in this method we supply some mandatory capabilities to establish the connection with TestObject, then Configure the connection for the cloud by using the "Device" class and after that we return the suitable platform depending on the device descriptor result.

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

The "Device" class connects to TestObject using your TestObject username and password, then gets a list of the available devices, after that it determines which platform will be used.

{% highlight java %}
public class Device {

    public DeviceDescriptor.OS platform;
    public String deviceId;

    public void initWithCloudDeviceInformation(String watcherDeviceId) {

        deviceId = watcherDeviceId;

        // Create a connection with TestObject using the your username and password
        TestObjectClient client = TestObjectClient.Factory.create();
        client.login(System.getenv("TESTOBJECT_USERNAME"), System.getenv("TESTOBJECT_PASSWORD"));

        // Get a list of TestObject devices.
        List<DeviceDescriptor> descriptorList = client.listDevices();

        for (DeviceDescriptor descriptor : descriptorList) {
            if (descriptor.id.equals(watcherDeviceId)) {
                this.platform = descriptor.os;
            }
        }
    }
}
{% endhighlight %}

Make sure to use the latest version of our [Appium Java API]("/docs/tools/appium/appium-api/").

<h3 id="run">Run your test!</h3>
After creating the project in the [PageObject](#page_object) way and writing your test methods, you just need to select "Build with parameters" from the menu and add the following environment variables if you use the [Simple setup](#simple_setup):

+ <strong>TESTOBJECT_API_KEY</strong> and it must be equal to "your TestObject api key".
+ <strong>PLATFORM</strong> and it must be equal to "ios" or to "android".

But if you use the [Advanced setup](#advanced_setup), then you need to add the following environment variables:

+ <strong>TESTOBJECT_USERNAME</strong>
+ <strong>TESTOBJECT_PASSWORD</strong>
+ <strong>TESTOBJECT_API_KEY</strong>

Then launch the build. Give the test some time to be run. As soon as it is done the build status icon will stop blinking and you will be able to access the "test results" section to see what the outcome of the test you just ran was.

<h3 id="example">Example</h3>
You can have a look at our [Appium cross-platform example](https://github.com/testobject/appium-cross-platform-example).

---
---
---
---
