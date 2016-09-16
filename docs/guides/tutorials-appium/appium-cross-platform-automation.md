---
title: Appium cross-platform automation
layout: en
permalink: docs/guides/appium-cross-platform-automation/
---

Cross-platform testing means that you create one project, one script and one setup for two applications (Android and iOS), and that means also that the proccess will be faster because you write the script only one time for both platforms instead of two, in this case, updating the code will be certainly much easier and faster. This Tutorial explains how to write and run a cross-platform test using PageObject design pattern and Appium Annotations on TestObject.


###Steps
1. Open your code Editor and write your testing code using the [PageObject design pattern](#page_object) way and using [Appium annotations](#appium_anno).
2. Open <a href="https://app.testobject.com" target="_blank">TestObject</a> website, login and create two projects: the first project will be for your Android app and will contain your apk file, and the second project will be for your iOS app and will contain your ipa file.
3. Create a suite in each project, and don't forget to add some devices to each suite (at least one).
4. Use information from suite <strong>Setup Instructions</strong> to set your environment variables values (<strong>TESTOBJECT_API_KEY</strong>, <strong>APPIUM_URL</strong>, <strong>TESTOBJECT_SUITE_ID</strong>) in your project. Notice that thies environment variables are determining if the tests are going to be run on iOS or on Android.
4. Finally, run your cross-platform test.


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
We use <strong>@AndroidFindBy()</strong> and <strong>@iOSFindBy()</strong> Appium annotations to fetch UI elements in our app, using their (id, xpath or text, ...). Here in the folowing example we are tring to find an element using its Id on Android:

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

Finally you can have a look at our [Appium cross-platform example](https://github.com/testobject/appium-cross-platform-example).

---
---
---
---
