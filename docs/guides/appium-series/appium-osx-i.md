---
title: Appium Testing on Physical iOS devices
layout: en
permalink: docs/guides/appium-osx-ios/
---
This tutorial will help you set up Appium on OS X and run your first iOS test. Keep in mind that Appium supports iOS testing on OS X only.

## What you will need
* OS X 10.7 or higher;
* [Xcode](https://developer.apple.com/xcode/) 5.1 or higher along with the iOS SDK (usually included);
* The [IntelliJ IDEA IDE](https://www.jetbrains.com/idea/download/) (the free Community Edition is sufficient), or the [Eclipse IDE](https://www.eclipse.org/downloads/) (Java Developer Edition, also free) if you prefer;
* [Selenium Standalone Server](http://www.seleniumhq.org/download/) and [Appium Java Client](https://github.com/appium/java-client) JAR files;
* An iOS device connected and recognized by your machine, with [UI Automation enabled]() and [ready for testing](https://developer.apple.com/library/prerelease/ios/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html);
* [Appium itself](https://bitbucket.org/appium/appium.app/downloads/appium-1.4.0.dmg).

Once you run Appium, you should be confronted with a screen that looks more or less like this:

![Appium server screenshot](/img/guides/appium-osx-ios/screenshot1.png)

What you have in front of you is the Appium server. This piece of software will allow us to communicate with our device, be it local or remote (in our case the device is sitting right next to our machine).

### Testing on physical iOS devices
First of all, you need to navigate to the Appium iOS settings by clicking the <img style="display: inline-block" src="/img/guides/appium-osx-ios/icon_ios.png">
icon on the top. Don't be intimidated by the amount of options that pop up, you won't need to fill in all the forms. Remember to also check the round button just below the icon to make sure you are targeting the right platform.

![Appium server screenshot](/img/guides/appium-osx-ios/screenshot2.png)

The first thing you need to do is point the Appium server to the IPA file that you want to test. Simply check the "App Path" box and paste the path to the IPA file in the text field, or navigate to it by clicking on the <img style="display: inline-block" src="/img/guides/appium-osx-ios/button_choose.png"> button.

Next, move a little further down the screen until you find the "Force Device" field, under "Device Settings". Check the box and select the device you want to test on. Although in the end you can insert whatever text string you like, this step is mandatory.

Immediately below is the UDID field. Select the checkbox and open up Xcode. Navigate to Window -> Devices, the select your connected device from the sidebar on the left. You will need to copy the text in front of the "Identifier" row, go back to Appium and paste it in the UDID field.

Next up, you will need to check the "Full reset" box. This tells Appium to reset the state of the application we are testing every time we run a test.

Lastly, you will need to check if Appium knows the path to your Xcode application. Click on the "Advanced" tab and check that the path in the bottom field is correct. If there is none, just click the <img style="display: inline-block" src="/img/guides/appium-osx-ios/button_change.png"> button and navigate to Xcode's location.

![Appium server screenshot](/img/guides/appium-osx-ios/screenshot3.png)

You are now ready to start the server. Close the iOS settings screen and select the <img style="display: inline-block" src="/img/guides/appium-osx-ios/button_launch.png"> button. You should see some information being printed on the Appium terminal. After a couple of seconds you can click on the button with the <img style="display: inline-block" src="/img/guides/appium-osx-ios/icon_inspector.png"> icon, which will open up the Appium Inspector. At this point the app will be installed and launched on your device.

The purpose of the Inspector is to allow you to reference the UI elements of the app you are testing so that you can interact with them.

![Appium Inspector screenshot](/img/guides/appium-osx-ios/screenshot4.png)

For our example we will be using the Komoot app. You can use any other app and the testing process will follow the principles shown in this guide.

First we will click on the "Log in with email" button, and when the next screen pops up we will insert an invalid (uncorrectly formatted) email address in the email field, fill the password field with some random password and click the "Log in" button. What we will be expecting is an error message telling us the email address we have provided is invalid.

We start off in the Inspector by selecting and navigating through a series of layouts until we get to select our button. Every time you select an element the program will show you a series of attributes belonging to it. We can use some of these attributes to reference this element.

![Appium Inspector screenshot](/img/guides/appium-osx-ios/screenshot5.png)

In this case we will be referencing our "Log in with email" button by its name attribute. This way of targeting a UI element is not optimal: whenever possible, ids would be preferred, but grabbing them in iOS is a little more complicated and goes beyond the point of this tutorial. So for now just select the button, write down its name attribute and put it on the side for the moment, we will need it soon.

Next, open up your IDE and create a new project (can be either in [Eclipse](http://pages.cs.wisc.edu/~cs302/labs/EclipseTutorial/Step_02.html) or [IDEA](https://www.jetbrains.com/idea/help/creating-and-running-your-first-java-application.html#create_project) . In this project, create a new class (here's how to do it in [IDEA](https://www.jetbrains.com/idea/help/creating-and-running-your-first-java-application.html#create_class) and [Eclipse](http://help.eclipse.org/luna/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2FgettingStarted%2Fqs-9.htm)). This is where we will be writing our tests.

![IDEA IDE screenshot](/img/guides/appium-osx-ios/screenshot6.png)

Now you must import the jars we previously downloaded into the project. To do this

* in Eclipse, just right click on you project in the Package Explorer and select _Properties_, then select _Java Build Path_ and then click on _Add Eternal JARs_. Now select the Appium Java Client and the Selenium Server JARs and add them to the project;

* in IDEA, navigate to _File_ -> _Project Structure_, here you will find _Project Settings_ category, and under that  _Libraries_. Click the plus sign and select _Java_. Now browse to the folder where you downloaded the JARs, select the first one and add it, then repeat the procedure for the second one. Now click _OK_ and you are good to go.

![IDEA IDE screenshot](/img/guides/appium-osx-ios/screenshot7.png)

Once this is done, we have all we need to write the code that will run our tests. First, let's set up Appium and see it everything runs as expected. This is what a program that launches the Komoot app and clicks on the "Login with email" button looks like:

{% highlight java %}
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.ios.IOSDriver;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertEquals;

import java.net.URL;

/**
 * Created by grago on 22/06/15.
 */
public class MyKomootTest {

    /* This is the key piece of our test, since it allows us to
     * connect to the device we will be running the app onto. */
    private AppiumDriver driver;

    private String invalidEmail = "invalid_email";
    private String randomPassword = "123456789";

    private String expectedErrorMessage = "Email address invalid.";

    @Before
    public void setUp() throws Exception {

        /* Here we specify the capabilities required by the Appium server.
         * We have already manually specified most of these through the
         * Appium server interface (apk path etc.) */
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("deviceName","testDevice");

        /* We initialize the Appium driver that will connect us to the Android device with
         * the capabilities that we have just set. The URL we are providing is telling Appium we
         * are going to run the test locally. */
        driver = new IOSDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);

    }

    /* We disable the driver after the test has been executed. */
    @After
    public void tearDown() throws Exception {
        driver.quit();
    }


    /* This is... almost a test! */
    @Test
    public void clickLoginWithEmailButton() {

        /* We reference the UI element we are interested in using its id (we got this through the
         * Appium Inspector) and we perform a single click on it. */
        WebElement emailLoginButton = driver.findElement(By.name("Profile"));
        emailLoginButton.click();

    }

}
{% endhighlight %}

Save the project, open up the Appium server, click on the <img style="display: inline-block" src="/img/guides/appium-osx-ios/button_launch.png"> button. You should see some messages appear in the Appium server log confirming that the launch has been successful, and that the server is now on standby, ready to receive connections.

Our connection will come from the code we have just written. Go back to the IDE, run the project and wait for the magic to happen. If everything went as expected, you should see the app pop up on your device and the "Login with email" button being pressed.

While this is not a test per-se, we are already seeing some automation.

We can easily write a more complex method by adding some simple operations:

{% highlight java %}
/* This is our first test! */
    @Test
    public void logInWithInvalidEmail(){

        /* We reference the UI element we are interested in using its id (we got this through the
        * Appium Inspector) and we perform a single click on it. */
        WebElement emailLoginButton = driver.findElement(By.name("Log in with email"));
        emailLoginButton.click();

        /* We wait until the email field appears on screen and then input our invalid email. */
        WebElement emailTextField = (new WebDriverWait(driver, 60))
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath("//UIAStaticText[@name='Email']/following-sibling::UIATextField")));
        emailTextField.sendKeys(invalidEmail);

        /* We do the same for the password field... */
        WebElement passwordTextField = driver.findElement(By.xpath("//UIAStaticText[@name='Password']/following-sibling::UIASecureTextField"));
        passwordTextField.sendKeys(randomPassword);

        /* ...and finally we click the login button. */
        WebElement loginButton = driver.findElement(By.xpath("//UIAButton[@name='Log In']"));
        loginButton.click();

        /* Now we can just check if the error message that pops up is the one we are expecting.
        * If this is the case, the test completes successfully, otherwise it fails. */
        WebElement errorMessage = (new WebDriverWait(driver, 60))
                .until(ExpectedConditions.presenceOfElementLocated(By.name("Please check your email and password and try again.")));
        assertEquals(errorMessage.getText(), expectedErrorMessage);

    }

}
{% endhighlight %}

The IDs you see in this last snippet belong to UI elements which are not located in the first screen that our app is showing. To get these simply navigate your app from your device while the Inspector is open until the desired UI element is in view. Now go back to the Inspector, which will still be showing the initial screen, and click the _Refresh_ button. This will update the Inspector view loading the elements which are currently shown on the screen of the device, which you can now reference.

Rememeber to define a new constant in which you store the expected error message, in our case "Email address invalid." and to import org.junit.Assert.assertEquals

![IDEA IDE screenshot](/img/guides/appium-osx-ios/screenshot8.png)

Unless something went wrong along the way, our test should succeed and the IDE should report this by showing a green bar somewhere in its main window. If that is the case, congratulations! You have run your first automated test using Appium!
