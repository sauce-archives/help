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

<h3 id="test_setup">Test setup</h3>
A cross-platform test setup must be different from the normal setup, because the process of selecting a platform must be dynamic. Here is a simple cross-platform setup class:

{% highlight java %}
public class AbstractTest {

    @Rule
    public TestName testName = new TestName();

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

And the Appium Driver Builder will be:

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

        // Getting the platform from the environment variables.
        String platform = System.getenv("PLATFORM");

        // Selecting the test platform recording to the "PLATFORM" environment variable.
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

AppiumDriverBuilder is basically a helper class that helps you to connect to TestObject. It contains "TestObject Test Result Watcher" which is sending your test results to TestObject. You can see also some other mandatory capabilities to establish the connection, and the "if else" statement comes to determine on which platform ("android" or "ios") the test is going to be run. See Appium cross-platform [example](https://github.com/testobject/appium-cross-platform-example).

####Alternative setup
There is an alternative advanced way to determine the platform you are testing on by using device descriptors instead of environment variables, in this case your setup class will be:

{% highlight java %}
public class AbstractTest {

    protected static Logger log = Logger.getLogger(AbstractTest.class);
    private final int timeout = 25;

    @Rule
    public TestName testName = new TestName();
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

    driver.manage().timeouts().implicitlyWait(timeout, TimeUnit.SECONDS);

    app = new App(driver, device);

        log.info("[TEST] " + testName.getMethodName() + " live view: "
                + driver.getCapabilities().getCapability("testobject_test_live_view_url"));
    }

    @After
    public void tearDown(){
		log.info("[TEST] " + testName.getMethodName() + " report: "
			+ driver.getCapabilities().getCapability("testobject_test_report_url"));
		log.info("Page source on last screen: " + driver.getPageSource());
    }

	public boolean isIOS() {
		return driver instanceof IOSDriver;
	}

	public boolean isAndroid() {
		return driver instanceof AndroidDriver;
	}
{% endhighlight %}

And the Appium Driver Builder class will be:

{% highlight java %}
ublic class AppiumDriverBuilder {

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

		Boolean testLocally = Boolean.parseBoolean(System.getenv("TESTOBJECT_TEST_LOCALLY"));

		// Device object gets initialised differently depending on whether this is a local or cloud test run.
		if (testLocally) {
			configureForLocal();
		} else {
			configureForCloud();
		}

		// Provide needed platform version-specific capabilities and instantiate platform-specific AppiumDriver.
		if (device.platform.equals(DeviceDescriptor.OS.IOS)) {
			return getIosDriver();
		} else if (device.platform.equals(DeviceDescriptor.OS.ANDROID)) {
			return getAndroidDriver();
		} else {
			throw new Exception("Was unable to read device platform.");
		}

	}

	private void configureForLocal() {
		String deviceId = System.getenv("LOCAL_DEVICE");
		capabilities.setCapability("deviceName", deviceId);
		device.initWithLocalDeviceInformation();
	}

	private void configureForCloud() {
		device.initWithCloudDeviceInformation(resultWatcher.getTestDeviceId());

		// In case of execution from CI, provides a link to the build which generated the test report.
		capabilities.setCapability("build_url", System.getenv("BUILD_URL"));
	}

	private AppiumDriver getAndroidDriver() throws MalformedURLException {
		if (device.apiLevel <= 17) {
			capabilities.setCapability("automationName", "Selendroid");
			capabilities.setCapability("appWaitActivity", device.getAndroidStartingActivity());
		}
		return new AndroidDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
	}

	private AppiumDriver getIosDriver() throws MalformedURLException {
		return new IOSDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
	}
}
{% endhighlight %}

Appium Driver Builder here is a class which takes care of initialising the correct AppiumDriver depending on a series of parameters. It supports both local and cloud (TestObject) Appium test runs. Needs different sets of environment variables
based on whether it is used for local or cloud testing.

The Device class is to get information about the device itself:

{% highlight java %}
public class Device {

	private final static String ANDROID_STARTING_ACTIVITY = "ANDROID_STARTING_ACTIVITY";
	private final static String ANDROID_STARTING_PACKAGE = "ANDROID_STARTING_PACKAGE";
	private final static String LOCAL_PLATFORM = "LOCAL_PLATFORM";
	private final static String LOCAL_DEVICE = "LOCAL_DEVICE";

	public DeviceDescriptor.OS platform;
	public String deviceId;

	public void initWithCloudDeviceInformation(String watcherDeviceId) {

		deviceId = watcherDeviceId;

		TestObjectClient client = TestObjectClient.Factory.create();
		client.login(System.getenv("TESTOBJECT_USERNAME"), System.getenv("TESTOBJECT_PASSWORD"));

		List<DeviceDescriptor> descriptorList = client.listDevices();

		for (DeviceDescriptor descriptor : descriptorList) {
			if (descriptor.id.equals(watcherDeviceId)) {
				this.platform = descriptor.os;
			}
		}

	}

	public void initWithLocalDeviceInformation() {

		deviceId = System.getenv(LOCAL_DEVICE);

		if (System.getenv(LOCAL_PLATFORM).equals("iOS")) {
			platform = DeviceDescriptor.OS.IOS;
		} else if (System.getenv(LOCAL_PLATFORM).equals("Android")) {
			platform = DeviceDescriptor.OS.ANDROID;
		}
	}

	public String getAndroidStartingPackage() {
		String property = deviceId + "_package";
		return getEnvOrProperty(ANDROID_STARTING_PACKAGE, property);
	}

	public String getAndroidStartingActivity() {
		String property = deviceId + "_activity";
		return getEnvOrProperty(ANDROID_STARTING_ACTIVITY, property);
	}

	private String getEnvOrProperty(String envVariable, String property) {
		String capability = System.getenv(envVariable);
		if (capability == null) {
			return PropertyHelper.getProperty("android-starting-packages.properties", property);
		} else {
			return capability;
		}
	}
}
{% endhighlight %}

<h3 id="run">Run your test!</h3>
After creating the project in the [PageObject](#page_object) way and writing your test methods, you just need to select "Build with parameters" from the menu and add the following environment variables:

+ <strong>TESTOBJECT_API_KEY</strong> and it must be equal to "your TestObject api key".
+ <strong>PLATFORM</strong> and it must be equal to "ios" or to "android".

then launch the build. Give the test some time to be run. As soon as it is done the build status icon will stop blinking and you will be able to access the "test results" section to see what the outcome of the test you just ran was.

<h3 id="example">Example</h3>
You can have a look at our [Appium cross-platform example](https://github.com/testobject/appium-cross-platform-example).

---
---
---
---
