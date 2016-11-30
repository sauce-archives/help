---
title: Introduction
layout: en
permalink: docs/tools/appium/introduction/
alias: /docs/testing-tools/automation/appium/
---

<h3 id="about-appium">About Appium</h3>

Appium is an open-source test-automation framework for mobile apps &ndash; native, hybrid and web apps are supported. It drives iOS and Android apps using a standardized protocol. Selenium uses the same protocol and design so if you are familiar with Selenium for web testing, Appium will definitely be easy to get started with.

One of the advantages of Appium is it's flexibility. Appium allows you to begin writing tests in several popular languages. You can write tests using Java, Javascript, Ruby, PHP, C#, and Python. This makes it signficantly easier to begin writing tests since you don't need to learn a new programming language to get started. You can write your tests using whichever language you are most comfortable with.

If you have any doubts, or want to get a first taste of what it is like to automate tests using Appium, have a look at our <a href="/docs/guides/tutorials-appium/">Appium Tutorial Series</a>, where we help you set up Appium on your system and run your first test.


<h3 id="testing">Running Appium Tests on TestObject</h3>

Running tests on TestObject with Appium is easy! Just check out our variety of <a href="/docs/tools/appium/setups/">pre-written test setups</a>, find out which one suits you best, and start testing either by running Appium scripts on your machine or through a CI server! We provide our own <a href="/docs/tools/appium/appium-api/">convenience library</a> to allow our customers to record their test results on our platform, and in some cases even organize them in suites. We try to support as many languages and testing frameworks as possible, with the intention of covering all the major combinations Appium itself supports.


<h3 id="reporting">Reporting</h3>

When running Appium tests on TestObject, you will be able to browse your test results one by one or by conveniently organizing them in suites:

* <strong>Test Report</strong>: Presents all the details of an individual test run including logs, screenshots and video.
* <strong>Suite Report</strong>: Gives you an overview of all the results when executing a suite.

Read more about our <a href="/docs/general-reference/automation/reporting">reporting for automated tests</a>.


<h3 id="getting-started">Getting Started</h3>

Your existing Appium tests will run on the TestObject platform with just some small changes.

<h4>How to get up and running in 10 minutes</h4>

1. Create and activate a <a href="https://app.testobject.com/#/signup" target="_blank">TestObject account</a>;
2. Log into your account and upload the app you want to test. You can do this by providing the app file (.apk for Android, <a href="/docs/guides/creating-ipa/">.ipa for iOS</a>), or by providing a URL if you are trying to test a mobile website;
3. Check out one of our [Basic setups](/docs/tools/appium/setups/basic-setups) (depending on which language / testing framework you are using) to see how to quickly run a test on our platform;
4. Navigate to Automated Testing -> Appium -> Setup Instructions -> Change Devices to select the device you want to test on, then paste the id in the appropriate capability in you test setup;
5. Run the tests on your machine and see them being recorded on our platform in the project you have just created.

When you are done, don't forget to check out <a href="/docs/tools/appium/setups/">more advanced setups</a> to have an even better testing experience on TestObject!
