---
title: Automated Testing
layout: en
permalink: docs/testing-tools/automation/
---


<li><a href="#Introduction">Introduction</a></li>
<li><a href="#frameworks">Test Automation Frameworks</a></li>
<li><a href="#scripts">Execute test scripts</a></li>
<li><a href="#Reporting">Execution Reports</a></li>
<li><a href="#Continuous-Integration">Continuous Integration</a></li>

<h3 id="Introduction">Introduction</h3>

Test automation allows you to run the same tests repeatedly and execute them on several devices in parallel.  To start your automated testing, you will need a script, defining the test, and a special software to control and run these pre-scripted tests. There are several frameworks available on the market. To run your tests on the TestObject device cloud you can choose between several open-source frameworks. 
 

<h3 id="frameworks">Test Automation Frameworks</h3>

At the moment the following frameworks are supported

* <a href="/docs/testing-tools/automation/appium/">Appium</a>
* Robotium
* Espresso

If you want to run tests for native Android applications, you can use any of the three. To test native iOS applications, hybrid or web apps, we recoomend to use Appium. 
To set up Appium on your system, you can also check out our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>.

<h3 id="scripts">Execute test scripts</h3>

If you have created 
If you have existing test scripts you can 


On the TestObject device cloud you can choose between different open-source frameworks. Right now we support Appium, Robotium and Espresso.
Already existing tests for one of these frameworks can be executed in parallel on the <a href="docs/general-reference/devices/">real devices</a> in the TestObject cloud. 

Robotium and Espresso are exclusively for native Android applications. 
To run With Appium you can run native Android and iOS, as well as, hybrid and web applications.


For every test run you will get a detailed report, including all logs, a video of the test run and screenshots.

You find more detailed information in the correspoding documentation on the frameworks. 
To set up your Appium, check out our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>. 
To include TestObject into your continuous integration process, you will find more information in the tutorials...

