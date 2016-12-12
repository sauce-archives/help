---
title: Automated Testing
layout: en
permalink: docs/tools/automated-testing/overview/
---

TestObject allows you to leverage the power of open source automation frameworks like Appium, Robotium and Espresso. These tools allow you to run automated tests for your application, a fundamental prerequisite for continuous deployment and continuous delivery. Thanks to the wide array of supported setups, frameworks and CI tools, you will be able to continuously execute a broad set of automated functional tests and obtain immediate feedback on the business risks associated with your software release.

Here is a list of the open source automation frameworks we support:

###[Appium](/docs/tools/appium/introduction/)
<a href="http://appium.io/" target"blank">Appium</a> is an open-source test automation framework for mobile apps – native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver protocol, which Selenium is also using. If you are familiar with Selenium for web testing, you will find yourself at home with Appium. Access to the source code of the app under test is not required. [Learn more](/docs/tools/appium/setups/)

###[Espresso](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://google.github.io/android-testing-support-library/docs/espresso/index.html" target"blank">Espresso</a> is an open-source test automation framework for Android applications developed by Google. It enables you to run automated black-box UI tests. Therefore it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html" target="_blank">Android instrumentation</a> to inspect and interact with the activities you are testing. To locate the UI elements it makes use of <a href="https://github.com/hamcrest" target="_blank">hamcrest matchers</a>. Accessing the source code of the app under test is required to use Espresso. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

###[Robotium](/docs/testing-tools/robotium-espresso/setup/)
<a href="https://github.com/robotiumtech/robotium" target"blank">Robotium</a> is an open-source test automation framework for automated UI-tests. Created as an extension of the Android test framework it only supports native and hybrid Android apps. Robotium allows you to write a variety of test scenarios and it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html">Android instrumentation</a> to inspect and interact with the activities in your app. Accessing the source code of the tested app is necessary to use this framework. [Learn more](/docs/testing-tools/robotium-espresso/setup/)

***
***
***
***
***
***
***
