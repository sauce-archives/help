---
title: Advanced Appium test setup
layout: en
permalink: docs/tools/appium/advanced/
---

* [The PageObject pattern](#pageobject-pattern)
* [Project structure](#project-structure)
	- [AbstractTest](#abstract-test)
	- [AppiumDriverBuilder](#driver-builder)
	- [the Application class](#application-class)
	- [AbstractScreen](#abstract-screen)
	- [the Screen classes](#screen)
	- [the Test classes](#test)

A good test setup is not just a working setup, it must be a tidy setup. Sure, nothing prevents you from [writing all your code in a single class](/docs/tools/appium/setup). Your tests will still run, but maintaining the existing ones and adding new ones will become a pain very quickly! To prevent unnecessary headaches and enable you to write your tests more efficiently, we suggest you write your tests using a more advanced setup based on the PageObject pattern. This tutorial will guide your through the creation of such a setup.

<h3 id="pageobject-pattern">The PageObject pattern</h3>
Following the PageObject pattern means organizing the code you write in a certain way. This would involve transforming our older "twoPlusTwoOperation" method from this:

{% highlight java %}
@Test
public void twoPlusTwoOperation() {

    /* Get the elements. */
    MobileElement buttonTwo = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/digit2")));
    MobileElement buttonPlus = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/plus")));
    MobileElement buttonEquals = (MobileElement)(driver.findElement(By.id("net.ludeke.calculator:id/equal")));
    MobileElement resultField = (MobileElement)(driver.findElement(By.xpath("//android.widget.EditText[1]")));

    /* Add two and two. */
    buttonTwo.click();
    buttonPlus.click();
    buttonTwo.click();
    buttonEquals.click();

    /* Check if within given time the correct result appears in the designated field. */
    new WebDriverWait(driver, 30).until(ExpectedConditions.textToBePresentInElement(resultField, EXPECTED_RESULT_FOUR));

}
{% endhighlight %}

To something that looks more like this:

{% highlight java %}
@Test
public void twoPlusTwoOperation() {

    app.calculatorScreen().addTwoAndTwo();
    assertTrue(app.calculatorScreen().isResultCorrect("4"));

}
{% endhighlight %}

The first, most immediate change we notice is in the length of the test method. Test methods written using the PageObject pattern will almost always be shorter than the original, low-level method (way shorter for longer tests). If you keep reading, you will notice that this is not only because we wrapped all the button-taps in the addTwoAndTwo method.

What about readability? You be the judge. Go through the two methods again and ask yourself in which case it is easier to understand what is going on. Also, notice how we don't really need comments in the second method because the methods that specify the interactions we are having with the Page Object have significant names.

By wrapping the low-level operations in dedicated methods, we now have test methods that do not directly reference any WebDriver API. When writing your first PageObject test methods, use the lack of import statements referencing low level API as an indicator that you are doing things according to the pattern.

This approach is giving us one further advantage that is not to be underestimated: by hiding the technical complexity of the single utility methods, the PageObject pattern makes the flow of the user interaction evident. This is especially useful in the case of longer, more complicated tests, and kind of transforms the whole way we write tests. Once you have implemented the basic interactions for the screens of your application, writing a test method is basically just reproducing the use case by calling methods that do exactly what their name says. This is why you should make an effort to choose the best possible names for them.

<h3 id="project-structure">Project structure</h3>

How should you structure your project? As with everything, you should explore different solutions to find the one that is best suited to what you are actually doing. For the purpose of this tutorial we will be giving you a sneak peek of how we do things at TestObject, in particular how we structure Appium test suites for our customers. The core components of the setup will be the following classes:

* [AbstractTest](#abstract-test), in which we take care of the setup phase;
* [AppiumDriverBuilder](#driver-builder), which sets the needed capabilitis and instantiates the driver;
* [the Application class](#application-class), which we invoke to access our Screen objects;
* [AbstractScreen](#abstract-screen), containing all the shared methods between your Screen objects;
* [the Screen classes](#screen), which contain methods representing user interactions with the app being tested;
* [the Test classes](#test), which contain one or more tests written as a sequence of screen method calls.

<h4 id="abstract-test">AbstractTest</h4>
At the center of the project lies the AbstractTest class. Here we define our setup method, which will be executed before every test is run. Here we do three very important things:

* we take care of initializing the driver responsible for the connection to the Appium server;
* we instantiate the App class which will allow us to access the single screens of the application we want to test;
* we set the TestObjectResultWatcher for the driver we just initialized.

{% highlight java %}
public abstract class AbstractTest {

	  /* Set the test result watcher to send test results to TestObject. */
	  @Rule
	  public TestObjectTestResultWatcher resultWatcher = new TestObjectTestResultWatcher();

	  private AppiumDriver driver;
	  protected Calculator app;

	  /* Establish a connection to TestObject, or to a local device test is local. */
	  @Before
	  public void connect() throws MalformedURLException {

	      this.driver = AppiumDriverBuilder.forAndroid()
	                  .withApiKey(resultWatcher.getApiKey())
	                  .withTestReportId(resultWatcher.getTestReportId())
	                  .withEndpoint(resultWatcher.getTestObjectOrLocalAppiumEndpointURL())
	                  .build();

	      resultWatcher.setAppiumDriver(driver);
	      app = new Calculator(driver);

	  }

}
{% endhighlight %}

<h4 id="driver-builder">AppiumDriverBuilder</h4>
Our AppiumDriverBuilder does what the name says: it is basically a support class that takes care of configuring and istantiating the Appium driver.

{% highlight java %}
public abstract class AppiumDriverBuilder<SELF, DRIVER extends AppiumDriver> {

	protected String apiKey;
	protected String testReportId;

	public static AndroidDriverBuilder forAndroid() {
		return new AndroidDriverBuilder();
	}

	public static class AndroidDriverBuilder extends AppiumDriverBuilder<AndroidDriverBuilder, AndroidDriver> {

		DesiredCapabilities capabilities = new DesiredCapabilities();

		public AndroidDriver build() {

			capabilities.setCapability(TESTOBJECT_API_KEY, apiKey);
			capabilities.setCapability(TESTOBJECT_TEST_REPORT_ID, testReportId);

			capabilities.setCapability("deviceName", "testDevice");

			return new AndroidDriver(endpoint, capabilities);

		}

	}

	protected URL endpoint;

	public SELF withEndpoint(URL endpoint) {
		this.endpoint = endpoint;

		return (SELF) this;
	}

	public SELF withApiKey(String apiKey) {
		this.apiKey = apiKey;

		return (SELF) this;
	}

	public SELF withTestReportId(String testReportId) {
		this.testReportId = testReportId;

		return (SELF) this;
	}

	public abstract DRIVER build();

}
{% endhighlight %}

If we were testing on both Android and iOS, we would simply add a new nested class, IOSDriverBuilder, like so:

{% highlight java %}
public static class IOSDriverBuilder extends AppiumDriverBuilder<IOSDriverBuilder, IOSDriver> {

		DesiredCapabilities capabilities = new DesiredCapabilities();

    public IOSDriver build() {
    
			capabilities.setCapability(TESTOBJECT_API_KEY, apiKey);
			capabilities.setCapability(TESTOBJECT_TEST_REPORT_ID, testReportId);

			capabilities.setCapability("deviceName", "testDevice");

      return new IOSDriver(toURL(endpoint), capabilities);

		}

}
{% endhighlight %}

Along with the needed forIOS method:

{% highlight java %}
public static IOSDriverBuilder forIOS() {
		return new IOSDriverBuilder();
}
{% endhighlight %}

You will be able to change the platform on which you are running your tests by just switching the forAndroid method call in AbstractTest with the forIOS one. Having to modify the test code every time you change platform is not ideal though, so using environment variables to determine the target OS would probably be a better solution, especially if tests are run through a CI platform.

<h4 id="application-class">Application class</h4>
Another central class in your test will be the Application class (we simply name it with the name of the application we are testing). The function of this class is to provide the screens (as we were saying before, the Page objects) to the methods that will need to access their functionalities (our test methods).

{% highlight java %}
public class Calculator {

		private final AppiumDriver driver;

		public Calculator(AppiumDriver driver) {
		    this.driver = driver;
		}

		public CalculatorScreen calculatorScreen() { return new CalculatorScreen(driver); }

}
{% endhighlight %}

<h4 id="abstract-screen">AstractScreen class</h4>
Your AbstractScreen class will contain all the methods that are shared between your Screen objects. These may be general purpose methods that perform gestures needed to interact with your app in multiple points (swiping, scrolling), wrappers that hide some more convoluted code to increase the readability of your test methods, synchronization methods and more.

{% highlight java %}
public abstract class AbstractScreen {

    protected final AppiumDriver driver;

    public AbstractScreen(AppiumDriver driver) {
        this.driver = driver;

        PageFactory.initElements(new AppiumFieldDecorator(driver), this);
    }

    public MobileElement findElementWithTimeout(By by, int timeOutInSeconds) {
        return (MobileElement)(new WebDriverWait(driver, timeOutInSeconds)).until(ExpectedConditions.presenceOfElementLocated(by));
    }

    protected void takeScreenShot(){
        driver.getScreenshotAs(OutputType.BASE64);
    }

}
{% endhighlight %}

Notice the {% highlight java %}PageFactory.initElements(new AppiumFieldDecorator(driver), this);{% endhighlight %} instruction. This is what allows you to use annotations to grab UI elements, so don't forget to include it in your setup!

<h4 id="screen">Screen classes</h4>
Your screen classes represent the screens of your app. Here you will fetch the UI elements and interact with them in methods that represent possible interactions with the user interface, like opening a menu and selecting an item, filling in some fields and pressing a submit button, scrolling down a list and selecting the right element etc. This way your test methods will be just a sequence of user interactions on different screens. This will keep your tests easily maintenable and extendable.

{% highlight java %}
public class CalculatorScreen extends AbstractScreen {

		@AndroidFindBy(id = "net.ludeke.calculator:id/digit2")
		private MobileElement buttonTwo;

		@AndroidFindBy(id = "net.ludeke.calculator:id/plus")
		private MobileElement buttonPlus;

		@AndroidFindBy(id = "net.ludeke.calculator:id/equal")
		private MobileElement buttonEquals;

		@AndroidFindBy(xpath = "//android.widget.EditText[1]")
		private MobileElement resultField;

		public CalculatorScreen(AppiumDriver driver) {
		    super(driver);
		}

		public void addTwoAndTwo() {

		    buttonTwo.click();
		    buttonPlus.click();
		    buttonTwo.click();
		    buttonEquals.click();

		}

		public boolean isResultCorrect(String result) {

		    try {

		        /* Check if within given time the correct result appears in the designated field. */
		        (new WebDriverWait(driver, 30)).until(ExpectedConditions.textToBePresentInElement(resultField, result));
		        return true;

		    } catch (TimeoutException e) {

		        return false;

		    }

		}

}
{% endhighlight %}

Apart from the obvious "main screen" of the application that we have just described, in this case we could create another one representing the "advanced panel" of the calculator app, which is basically its own screen. The UI elements referenced in this screen would be the symbols/functions of the calculator.

How closely you device to adhere to the pattern is up to you. You can create a Screen object for every single screen of the application, or you can decide to only do so for the screens that really matter. Both approaches have their pros and cons, just keep in mind that there can be applications with way too many screens to handle and that, on the other hand, abstracting too many screens in one Screen object may lead to confusion down the road.

<h4 id="test">Test classes</h4>
Your tests are grouped in classes that extends AbstractTest. This allows you to grab any screen of the app and interact with it through the methods you have written.

{% highlight java %}
@TestObject(testLocally = true, testObjectApiKey = "YOUR_API_KEY", testObjectSuiteId = 123)
@RunWith(TestObjectAppiumSuite.class)
public class OperationTests extends AbstractTest {

    public OperationTests() {}

    /* A simple addition, it expects the correct result to appear in the result field. */
    @Test
    public void twoPlusTwoOperation() {

        app.calculatorScreen().addTwoAndTwo();
        assertTrue(app.calculatorScreen().isResultCorrect("4"));

    }

}
{% endhighlight %}

On the top of the class signature you can see that in this case the tests are being run using the TestObject runner, and are annotated with the cusotm TestObject annotation. This is because we are using what is called the TestObject Suite setup.

What you see here is a very simple application of the PageObject pattern. It might seem like a lot of work for very little gain, so let's set the calculator example aside for a moment, and jump into a real-world example:

{% highlight java %}
@TestObject(testObjectApiKey = TestObjectConfig.API_KEY, testObjectSuiteId = TestObjectConfig.DOCUMENTATION_SUGGESTIONS_SUITE_ID)
@RunWith(TestObjectAppiumSuite.class)
public class ChatTest extends AbstractTest {

		@Test
		public void sendMessageAndCheckHistoryTest() {

		    login(Credentials.VALID_USER_CREDENTIALS);

		    app.mainScreen().startChatWithUser(TEST_USERNAME);

		    app.chatScreen().sendChatMessage(TEST_MESSAGE);
		    app.chatScreen().navigateToHistoryScreen();
		    
		    assertTrue(app.historyScreen().containsMessage(TEST_MESSAGE));

		}


		@Test
		public void sendAndDeleteMessageThenCheckHistoryTest() {

			...
		
		}		
		
			.
			.
			.
		
}
{% endhighlight %}

As you can see, when multiple screens are involved the purpose of this pattern becomes clear, as does its conveniency. We are now navigating through a series of screens we have never seen, and yet we can already get a general idea of what is going on in our test. If we had a look at the implementation of the screen methods we are calling, we would get a even more precise idea of what's happening. The fact that we can already gather some information without doing so is one of the benefits of writing tests with PageObject.

Should a small change in the UI occur, we will probably not need to touch our test methods at all: the change is going to take place in one of our screen methods. In an agile environment, in which these kind of changes are frequent, this addition to the robustness of our test script is particularly welcome.

You can choose the level of complexity of your own screen methods. Having more, simpler screen methods will result in a longer, more detailed test method that exposes more of the complexity of the interaction. Following this approach, the above method would look more like this:

{% highlight java %}
@Test
public void sendMessageAndCheckHistoryTest() {

    login(Credentials.VALID_USER_CREDENTIALS);

    app.mainScreen().navigateToUserSelection();
    
    app.userSelectionScreen().selectUser(TEST_USERNAME);
    
    app.userProfileScreen().startChat();

    app.chatScreen().sendChatMessage(TEST_MESSAGE);
    app.chatScreen().navigateToMainScreen();
    
    app.mainScreen().navigateToHistoryScreen();
		
    assertTrue(app.historyScreen().containsMessage(TEST_MESSAGE));

}
{% endhighlight %}

While this approach shows you every transition between screens, it may easily become overwhelming, as in this exmaple:

{% highlight java %}
@TestObject(testObjectApiKey = "MY_API_KEY", testObjectSuiteId = 123)
@RunWith(TestObjectAppiumSuite.class)
public class CreateDocumentationWithSuggestionTest extends AbstractTest {

    @Test
    public void buildNewDocumentationWithSuggestions() {

        app.documentationScreen().navigateToSettings();

        app.settingsScreen().navigateToSuggestions();
        app.settingsScreen().activateSuggestions(SUGGESTIONS));
        app.settingsScreen().navigateToDocumentation();

        app.documentationScreen().createDocumentation();

        app.documentationCreationScreen().selectCultivation();

        app.documentationDetailsScreen().selectFields(TEST_CULTIVATION_1.getFields());
        app.documentationDetailsScreen().selectConsumables(TEST_CULTIVATION_1.getConsumables());
        app.documentationDetailsScreen().selectWorkers(TEST_CULTIVATION_1.getWorkers());
        app.documentationDetailsScreen().sendActivity();

        app.documentationScreen().createDocumentation();

        app.documentationCreationScreen().selectCultivation();

        Assert.assertTrue(app.documentationDetailsScreen().areSuggestedFieldsFilledOut(TEST_CULTIVATION_1));

    }

   	...

}
{% endhighlight %}

You should keep your test methods short enough so that you are able to tell what they do at a glance, while not packing everything into a single screen method, if possible. Finding the balance is the key to writing a good, maintanable test suite.

For reference, the complete code for our Calculator example is available [here](https://github.com/testobject/calculator-test-gradle/tree/calculator_simpler).
