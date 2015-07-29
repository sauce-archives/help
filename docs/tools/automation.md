---
title: Automated Testing
layout: en
permalink: docs/testing-tools/automation/
---


<li><a href="#Introduction">Introduction</a></li>
<li><a href="#frameworks">Test Automation Frameworks</a></li>
<li><a href="#scripts">Execute test scripts</a></li>
<li><a href="#reporting">Execution Reports</a></li>
<li><a href="#continuous-integration">Continuous Integration</a></li>

<h3 id="Introduction">Introduction</h3>

Test automation allows you to run the same tests repeatedly and execute them in parallel on the <a href="docs/general-reference/devices/">real devices</a> in the TestObject cloud.<br>
To start your automated testing you will need to write a test, which defines the exact steps and its predicted outcomes. The test interacts with the UI elements of your app, simulating a user interaction. To write the test you refer to the UI elements and define its predicted behavior<br>
The automation framework is an integrated system that provides the basis of test automation and simplifies the automation effort.<br>

There are a number of frameworks available on the market for this purpose. To execute your tests on the TestObject device cloud you can choose between several open-source frameworks. 
 

<h3 id="frameworks">Test Automation Frameworks</h3>


At the moment the following frameworks are supported:

* <a href="/docs/testing-tools/automation/appium/">Appium</a>
* Robotium
* Espresso

All of these frameworks are open-source and you can use them without additional costs.
<br> To write tests for native Android applications, you can use any of these three frameworks.
<br> Appium is a cross-platform framework, which allows you to test native Android and iOS applications, as well as hybrid or web apps.

To set up Appium on your system check out our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>.

<img src="/img/tools/automation/Automation_Frameworks.png"  alt="Automation Frame work Button">

<h3 id="scripts">Execute test scripts</h3>

If you have created tests for one of the supported frameworks you will be able to use them on the TestObject devices. 
For Espresso and Robotium you upload your test apk to our platform and execute your test suite from there. Your test apk will be installed together with the app you want to test and your tests are executed on your selected devices.<br>

For Appium it works a bit differently. Therefor you will have to <a href="/docs/testing-tools/automation/appium/">set some capabalities</a> in your Appium driver first to be able to execute them on our devices.<br>


<br>
<img class="center shadow" src="/img/tools/automation/Upload_Robotium_test.png" alt="Upload Robotium Test">
<br>



<h3 id="reporting">Execution Reports</h3>

For every test run you will get a detailed report, including all logs, a video of the test run and screenshots.
Share the report with your colleagues, create issues and send it to your issue tracker.

<img src="/img/tools/automation/Appium_Execution_Report.png"  alt="Appium Execution Report">


<h3 id="continuous-integration">Continuous Integration</h3>

Automated testing is a perfect match for your continuous integration process. To ensure the basic functionality of your app automate your most important test cases and run tests regularly. The test runs are triggered right from your CI-Server.<br>
Use our tutorials to <a href="/docs/guides/continuous-integration/">set up your Continuous Integration</a> </li> with TestObject:

+ <a href="/docs/guides/appium-travisci/">Run Appium Tests with Travis CI</a>
+ <a href="/docs/guides/jenkins-ant-task/">Ant: Jenkins Integration with Ant</a>
+ <a href="/docs/guides/jenkins-gradle-task/">Gradle: Jenkins Integration with Gradle</a>
+ <a href="/docs/guides/ant-task">Automated Test Execution with Ant</a>
