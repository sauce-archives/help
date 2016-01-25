---
title: Automated Testing
layout: en
permalink: docs/general-reference/automation/
---


<li><a href="#introduction">Introduction</a></li>
<li><a href="#frameworks">Test Automation Frameworks</a></li>
<li><a href="#scripts">Executing Test Scripts</a></li>
<li><a href="#reporting">Execution Reports</a></li>
<li><a href="#continuous-integration">Continuous Integration</a></li>
<ul>    <li><a href="/docs/guides/appium-travisci/">Run Appium Tests with Travis CI</a></li>
        <li><a href="/docs/guides/robotium-espresso-jenkins-ant/">Running Robotium and Espresso through Jenkins with Ant</a></li>
        <li><a href="/docs/guides/appium-jenkins-gradle/">Running Appium tests through Jenkins</a></li>
        <li><a href="docs/guides/gradle-plugin/">Execute your tests with Gradle plugin</a>
</li>
</ul>

<h3 id="introduction">Introduction</h3>

Test automation allows you to run the same tests repeatedly and execute them in parallel on the <a href="/docs/general-reference/devices/">real devices</a> in the TestObject cloud.<br>
What you will need to provide is a number of test suites complying with the requirements of the framework of your choice. In your test you will be able to interact  with UI elements, like a user would do. This will allow you to reproduce the various use cases of your application.

There are a number of frameworks available on the market for this purpose. To execute your tests on the TestObject device cloud you can choose between several  frameworks to test native iOS and Android applications, as well as hybrid and web apps. 
 

<h3 id="frameworks">Test Automation Frameworks</h3>

At the moment the following frameworks are supported, which are all available free of charge:

* <a href="/docs/tools/appium/introduction/">Appium</a>
* <a href="/docs/testing-tools/robotium-espresso/introduction/#Robotium">Robotium</a>
* <a href="/docs/testing-tools/robotium-espresso/introduction/#Espresso">Espresso</a>

<br> To write tests for native Android applications, you can use any of these three frameworks.
<br> Appium is a cross-platform framework, which allows you to test native Android and iOS applications, as well as hybrid or web apps.

To set up Appium on your system check out our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>.

<img class="shadow" src="/img/tools/automation/Automation_Frameworks.png"  alt="Automation Frame work Button">


<h3 id="scripts">Executing Test Scripts</h3>

If you have created tests for one of the supported frameworks you will be able to use them on the TestObject devices. 
For <a href="/docs/testing-tools/robotium-espresso/introduction/#Espresso">Espresso</a> and <a href="/docs/testing-tools/robotium-espresso/introduction/#Robotium">Robotium</a> you upload your test apk to our platform and execute your test suite from there. Your test apk will be installed together with the app you want to test. Your tests will then be executed automatically on the selected devices.<br>

For Appium it works a bit differently. Therefore you will have to <a href="/docs/testing-tools/appium/setup/">set some capabilities</a> in your Appium driver first to be able to execute them on our devices.<br>

<img class="center shadow" src="/img/tools/automation/Upload_Robotium_test.png" alt="Upload Robotium Test">


<h3 id="reporting">Execution Reports</h3>

For every test run you will get a detailed <a href="/docs/testing-tools/automation/reporting/">Execution Report</a>, including all logs, a video of the test run and screenshots.

<img class="center shadow" src="/img/tools/reporting/automation-report.png" alt="Automation Report">


<h3 id="continuous-integration">Continuous Integration</h3>

Automated testing is a perfect match for your continuous integration process. To ensure the basic functionality of your app automate your most important test cases and run tests regularly. The test runs are triggered right from your CI-Server.<br>
Use our tutorials to set up your Continuous Integration with TestObject:

+ <a href="/docs/guides/appium-travisci/">Run Appium Tests with Travis CI</a>
+ <a href="/docs/guides/robotium-espresso-jenkins-ant/">Running Robotium and Espresso through Jenkins with Ant</a>
+ <a href="/docs/guides/appium-jenkins-gradle/">Running Appium tests through Jenkins</a>
+ <a href="/docs/guides/gradle-plugin/">Execute your tests with Gradle plugin</a>
