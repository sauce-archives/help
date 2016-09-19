---
title: Appium cross-platform automation
layout: en
permalink: docs/guides/appium-cross-platform-automation/
---

Cross-platform testing means that you create one project, one script and one setup for two applications (Android and iOS), and that means also that the proccess will be faster because you write the script only one time for both platforms instead of two, in this case, updating the code will be certainly much easier and faster. This Tutorial explains how to write and run a cross-platform test using PageObject design pattern and Appium Annotations on TestObject.


###Steps
1. Open your code Editor, create a project and write your [Test Setup](#test_setup) and your testing code using the [PageObject design pattern](#page_object) way and using [Appium annotations](#appium_anno).
2. Open <a href="https://app.testobject.com" target="blank">TestObject</a> website, login and create two projects: the first project will be for your Android app and will contain your apk file, and the second project will be for your iOS app and will contain your ipa file.
3. Create a suite in each project, and don't forget to add some devices to each suite (at least one).
4. [Run](#run) your cross-platform test.
5. <a href="#example" target="blank">Example</a>.


<h3 id="page_object">PageObject design pattern</h3>
Firstly we will start with PageObject design pattern which is a way of organizing the code you write in a certain structure. That means your code will be shorter, more readable and the user interaction flow will be evident. This way of coding encapsulates your code to make the proccess clearer and easier.

A good example for using PageObject design pattern will be transformaing this test method from the normal way:

{% highlight java %}
@Test
public void twoPlusTwoOperation() {
    // Get elements from your app screen.
    MobileElement buttonTwo = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/digit2")));
    MobileElement buttonPlus = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/plus")));
    MobileElement buttonEquals = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/equal")));
    MobileElement resultField = (MobileElement)(driver.findElement(By.xpath("//android.widget.EditText[1]")));

    // Add two and two ( 2 + 2 ).
    buttonTwo.click();
    buttonPlus.click();
    buttonTwo.click();
    buttonEquals.click();

    // Check if within given time the correct result appears in the designated field ( check if 2 + 2 = 4 ).
    new WebDriverWait(driver, 30).until(ExpectedConditions.textToBePresentInElement(resultField, 4));
}
{% endhighlight %}

To the PageObject design pattern way:

{% highlight java %}
@Test
public void twoPlusTwoOperation() {
    app.calculatorScreen().addTwoAndTwo();
    assertTrue(app.calculatorScreen().isResultCorrect("4"));
}
{% endhighlight %}

For more information about PageObject, see our [Appium setup with PageObject](/docs/guides/appium-advanced-setup/) guide.

<h3 id="appium_anno">Appium annotations</h3>
It is hard to use the old way of finding elements for a cross-platform project, so we will use <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> Appium annotations to fetch UI elements in our app, using (id, xpath or text, ...). Here in the folowing example we are tring to find an element using its Id on Android:

{% highlight java %}
@AndroidFindBy(id = "signup_button")
MobileElement signUpButton;
{% endhighlight %}

And here we are using the xpath to find an element in an iOS applicatoion:

{% highlight java %}
@iOSFindBy(xpath = "//UIAButton[1]")
MobileElement signUpButton;
{% endhighlight %}

In the case of cross-platform project, we use both of <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> to find element(s):

{% highlight java %}
@AndroidFindBy(id = "signup_button")
@iOSFindBy(xpath = "//UIAButton[1]")
MobileElement signUpButton;
{% endhighlight %}

Which annotation is going to be used? When we use Android and iOS annotations together, it doesn't at all mean that both of them are going to be used at the same time, only one of them will be, and it depends on the platform we use. So if we are testing on Android platform and instantiating an Android Appium Driver in our setup method, then the Android annotation will be used, and the iOS annotation will be also used if we instantiated an iOS Appium Driver.

<h3 id="test_setup">Test setup</h3>
Cross-platform Test Setup must be different from the normal setup, because the process of selecting a platform  must be dynamic. This is a good example for a cross-platform setup:

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
        // Some Desired Capabilities
        DesiredCapabilities capabilities = new DesiredCapabilities();

        capabilities.setCapability("testobject_api_key", resultWatcher.getApiKey());
        capabilities.setCapability("testobject_test_report_id", resultWatcher.getTestReportId());

        capabilities.setCapability("deviceName", "testDevice");

        // Get the platform ("android" or "ios") we use from the environment variables.
        String platform = System.getenv("PLATFORM");

        // Here we determine if the Test will be running on Android or on iOS
        if (platform.equalsIgnoreCase("ios")) {
            capabilities.setCapability("autoDismissAlerts", true);
            return new IOSDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else if (platform.equalsIgnoreCase("android")) {
            return new AndroidDriver(resultWatcher.getTestObjectOrLocalAppiumEndpointURL(), capabilities);
        } else {
            throw new Exception("Unable to read device platform.");
        }
    }
}
{% endhighlight %}

AppiumDriverBuilder is basically a helper class that helps you to connect to TestObject. So you have TestObject Test Result Watcher which sending your results to TestObject and some other capabilities to establish the connection, also you have the  "if else" statement which determines on which platform ("android" or "ios") you are going to run your test.

<h3 id="run">Run your cross-platform test</h3>
After creating the project in the [PageObject](#page_object) way and writing your tests, you need to add the following environment variables:

+ <strong>TESTOBJECT_API_KEY</strong> and it must be equal to "your TestObject api key".
+ <strong>PLATFORM</strong> and it must be equal to "ios" or to "android".

After that, you can press the Run button and enjoy testing.

<h3 id="example">Example</h3>
You can have a look at our [Appium cross-platform example](https://github.com/testobject/appium-cross-platform-example).

---
---
---
---
