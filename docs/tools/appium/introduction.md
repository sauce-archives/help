---
title: Introduction
layout: en
permalink: docs/tools/appium/introduction/
alias: /docs/testing-tools/automation/appium/
---


<h3 id="about-appium">About Appium</h3>

Appium is an open-source test-automation framework for mobile apps &ndash; native, hybrid and web apps are supported. It drives iOS and Android apps using the WebDriver <a href="https://code.google.com/p/selenium/wiki/JsonWireProtocol" target="_blank">JSON wire protocol</a>. Selenium also uses the JSON wire protocol. If you are familiar with Selenium for web testing, Appium will definitely be easy to get started with.<br>
If you have any doubts, have a look at our <a href="/docs/guides/tutorials-appium/">Appium Tutorial Series</a>, where we help you set up Appium on your system and run your first test.


<h3 id="reporting">Reporting</h3>

When running Appium tests on TestObject, you will be able to browse your test results one by one or by conveniently organizing them in suites:

* <strong>Test Report</strong>: Presents all the details of an individual test run including logs, screenshots and video.
* <strong>Suite Report</strong>: Gives you an overview of all the results when executing a suite.

Read more about our <a href="/docs/general-reference/automation/reporting">reporting for automated tests</a>.


<h3 id="getting-started">Getting Started</h3>

Your existing Appium tests will run on the TestObject platform with just some small changes.

<h4>How to get up and running in 10 minutes</h4>

1. Create and activate a <a href="https://app.testobject.com/signup" target="_blank">TestObject account</a>;
2. Log into your account and upload the app you want to test. You can do this by providing the app file (.apk for Android, <a href="/docs/guides/creating-ipa/">.ipa for iOS</a>), or by providing a URL if you are trying to test a mobile website;
3. Check out one of our <a href="/docs/tools/appium/setups/">basic setups</a> (depending on which language / testing framework you are using) to see how to quickly run a test on our platform;
4. Navigate to Automated Testing -> Appium -> Setup Instructions -> Change Devices to select the device you want to test on, then paste the id in the appropriate capability in you test setup;
5. Run the tests on your machine and see them being recorded on our platform in the project you have just created.

<h4>How the test execution works</h4>

<h5></h5>

<h5>Suites setup</h5>

1. A new Suite Report including Test Reports for each individual test run is created via REST API. You will be able to monitor the progress of the Suite Report in the UI.
2. For each test run your client-side code establishes a connection to our Appium server (https://app.testobject.com:443/api/appium/wd/hub)
3. The client session is authenticated with your API key specified in the "testobject_api_key" capability
4. TestObject identifies the testing device and the test report for this specific test run using the "testobject_report_id" capability
5. The test is executed from your client machine through the API session, connecting to our Appium server using the standard Selenium WebDriver JSON Wire Protocol. When the RemoteWebDriver/AppiumDriver is created we allocate the specified device for you. The allocation process waits for up to 15 minutes for a device to become available.
6. With a final REST call the status (passed or failed) is set for the test run. You can now view the completed Test Report.
