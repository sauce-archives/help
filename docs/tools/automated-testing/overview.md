---
title: Automated Testing
layout: en
permalink: docs/tools/automated-testing/overview/
---

Running an automated test for your mobile apps – native, hybrid or web Application is better than a manual test in some cases, since it doesn't rely on human resources in order to be run, hence it is cheaper, more relaiable and more accurate than the manual testing.
Automated testing can be run using many testing platforms (e.g. [JUnit](http://junit.org/junit4/), [TestNG](http://testng.org/doc/index.html), [WebDriverIO](http://webdriver.io/) ...) in many programming languages such as Java, Ruby, Javascript, PHP, Python and more. This basically means that it is easy to anyone to write an automated test.

Here is a list of the test automation frameworks we support:

###[Appium](/docs/tools/appium/introduction/)
<a href="http://appium.io/" target"blank">Appium</a> is an open-source test-automation framework for mobile apps – native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver JSON wire protocol. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium will definitely be easy to get started with. Accessing the source code of the tested app is not required at all for using Appium. [Start testing now.](#ten_minutes)

###[Espresso](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://google.github.io/android-testing-support-library/docs/espresso/index.html" target"blank">Espresso</a> is a test automation framework for Android applications developed by Google. It enables you to do automatic black-box UI tests. Therefor it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html" target="_blank">Android instrumentation</a> to inspect and interact with the activities you are testing. To locate the UI elements it draws back on <a href="https://github.com/hamcrest" target="_blank">hamcrest matchers</a>. Accessing the source code of the tested app is required to use Espresso. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

###[Robotium](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://github.com/robotiumtech/robotium" target"blank">Robotium</a> is an open-source test automation framework for automatic black-box UI-tests. Created as an extension of the Android test framework it only supports native and hybrid Android apps. Robotium allows you two write function, system and acceptance test scenarios and define them across Android activities. Robotium uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html">Android instrumentation</a> to inspect and interact with the activities in your app. Accessing the source code of the tested app is necessary to use this framework. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

###Getting Started

<h4 id="ten_minutes">How to run an automated test in 10 minutes on TestObject?</h4>
Your existing Appium tests will run on the TestObject platform with just some small changes.

**1.** Create and activate a <a href="/docs/general-reference/creating-an-account/" target="_blank">TestObject account</a>;<br>
**2.** Log into your account, <a href="/docs/general-reference/managing-your-apps/" target="blank">create a new project</a> and upload the app you want to test or provide a URL if you want to test a web app;<br>
**3.** Write your test setup by checking out one of our Appium pre-written [basic setups](/docs/tools/appium/setups/basic-setups) (depending on which language / testing framework you are using) to see how to quickly run a test on our platform;<br>
**4.** Select a device to test on by navigating to Automated Testing -> Appium -> Setup Instructions -> Change Devices to select the device you want to test on, then paste the id in the appropriate capability in you test setup;<br>
**5.** Run the tests on your machine and see them being recorded on our platform in the project you have just created.

When you are done, don't forget to check out <a href="/docs/tools/appium/setups/">more advanced setups</a> to have an even better testing experience on TestObject!

***
***
***
***
***
***
***
