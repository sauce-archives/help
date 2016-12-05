---
title: Automated Testing
layout: en
permalink: docs/tools/automated-testing/overview/
---

Running an automated test for your mobile apps – native, hybrid or web Application is sometimes better than a manual test, since it doesn't rely on human resources in order to be run, hence it is cheaper, more reliable and more accurate than the manual testing.
Your are able to continuously execute a broad set of continuous tests using a CI server to obtain an immediate feedback on the business risks associated with your software release.

Here is a list of the open source test automation frameworks we support:

###[Appium](/docs/tools/appium/introduction/)
<a href="http://appium.io/" target"blank">Appium</a> is an open-source test-automation framework for mobile apps – native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver JSON wire protocol. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium will definitely be easy to get started with. Accessing the source code of the tested app is not required at all for using Appium. [Start testing now.](/docs/tools/appium/setups/)

###[Espresso](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://google.github.io/android-testing-support-library/docs/espresso/index.html" target"blank">Espresso</a> is a test automation framework for Android applications developed by Google. It enables you to run automatic black-box UI tests. Therefore it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html" target="_blank">Android instrumentation</a> to inspect and interact with the activities you are testing. To locate the UI elements it draws back on <a href="https://github.com/hamcrest" target="_blank">hamcrest matchers</a>. Accessing the source code of the tested app is required to use Espresso. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

###[Robotium](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://github.com/robotiumtech/robotium" target"blank">Robotium</a> is an open-source test automation framework for automatic UI-tests. Created as an extension of the Android test framework it only supports native and hybrid Android apps. Robotium allows you to write a variety of test scenarios and it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html">Android instrumentation</a> to inspect and interact with the activities in your app. Accessing the source code of the tested app is necessary to use this framework. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

***
***
***
***
***
***
***
