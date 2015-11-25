---
title: Advanced Appium test setup
layout: en
permalink: docs/tools/appium/introduction/
alias: /docs/testing-tools/automation/appium/
---

A good test setup is not just a working setup, it must be a tidy setup. Sure, nothing prevents you from [writing all your code in a single class](/docs/tools/appium/setup). Your tests will still run, but maintaining the existing ones and adding new ones will become a pain very quickly! To prevent unnecessary headaches and enable you to write your tests more efficiently, we suggest you follow the PageObject pattern.

<h3 id="pageobject-pattern">The PageObject pattern</h3>
Following the PageObejct pattern means organizing the code you write in a certain way. This would involve transforming our older "twoPlusTwoOperation" method from this:

{% highlight java %}
/* A simple addition, it expects the correct result to appear in the result field. */
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
        (new WebDriverWait(driver, 30)).until(ExpectedConditions.textToBePresentInElement(resultField, EXPECTED_RESULT_FOUR));

    }
{% endhighlight %}

To something that looks more like this:

{% highlight java %}
/* A simple addition, it expects the correct result to appear in the result field. */
    @Test
    public void twoPlusTwoOperation() {

        app.calculatorScreen().tapDigitTwo("2");
        app.calculatorScreen().tapSymbol("+");
        app.calculatorScreen().tapDigit("2");
        app.calculatorScreen().tapSymbol("=");

        assertTrue(app.calculatorScreen().isResultCorrect("4"));

    }
{% endhighlight %}

The first, most immediate change we notice is in the length of the test method. Test methods written using the PageObject pattern will almost always be shorter than the original, low-level method (way shorter for longer tests).

What about readability? You be the judge. Go through the two methods again and ask yourself in which case it is easier to understand what is going on. Also, notice how we don't really need comments in the second method because the methods that specify the interactions we are having with the Page Object have significant names.

By wrapping the low-level operations in dedicated methods, we now have test methods that do not directly reference any WebDriver API. When writing your first PageObject tests, use the lack of import statements referencing low level API as an indicator that you are doing things according to the pattern.

That's neat, but this approach is giving us one further advantage that is not to be underestimated: by hiding the technical complexity of the single utility methods, the PageObject pattern makes the flow of the user interaction evident. This is especially useful in the case of longer, more complicated tests, and kind of transforms the whole way we write tests. Once you have implemented the basic interactions for the screens of your application, writing a test method is basically just reproducing the use case by calling methods that do exactly what their name says. This is why you should make an effort to choose the best possible names for them.

<h3 id="project-structure">The project structure</h3>

How should you structure your project? As with everything, you should explore different solutions to find the one that is best suited to what you are actually doing. For the purpose of this tutorial we will be giving you a sneak peek of how we do things at TestObject, in particular how we write Appium tests for our customers.

<h4 id="abstract-test">AbstractTest</h4>
At the center of the project lies the AbstractTest class. Here we define our setup method, which will be executed before every test is run. Here we do three things:

* we take care of initializing the driver responsible for the connection to the Appium server;
* we instantiate the App class which will allow us to access the single screens of the application we want to test;
* we set the TestObjectResultWatcher for the driver we just initialized.

{% highlight java %}
	public abstract class AbstractTest {

		  /* Grab the test name. */
		  @Rule
		  public TestName testName = new TestName();

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


[code]

<h4 id="application-class">Application class</h4>
Another central class in your test will be the Application class (we simply name it with the name of the application we are testing). The function of this class is to provide the screens (as we were saying before, the Page objects) to the methods that will need to access their functionalities (our test methods).

[show code]

<h4 id="abstract-screen">AstractScreen class</h4>
Your AbstractScreen class will contain all the methods that are shared between your Screen objects. These may be general purpose methods that perform gestures needed to interact with your app in multiple points (swiping, scrolling), wrappers that hide some more convoluted code to increase the readability of your test methods, synchronization methods and more.

[code, point at PageFactory.initElements]

<h4 id="screen">Screen classes</h4>
Your screen classes represent the screens of your app. Here you will fetch the UI elements and interact with them in methods that represent possible interactions with the user interface, like opening a menu and selecting an item, filling in some fields and pressing a submit button, scrolling down a list and selecting the right element etc. This way your test methods will be just a sequence of user interactions on different screens. This will keep your tests easily maintenable and extendable.

[code]

<h4 id="test">Test class</h4>


