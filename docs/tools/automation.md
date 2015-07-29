---
title: Automated Testing
layout: en
permalink: docs/testing-tools/automation/
---


<li><a href="#Introduction">Introduction</a></li>
<li><a href="#frameworks">Test Automation Frameworks</a></li>
<li><a href="#scripts">Execute test scripts</a></li>
<li><a href="#reporting">Execution Reports</a></li>
<!--<li><a href="#continuous-integration">Continuous Integration</a></li>-->

<h3 id="Introduction">Introduction</h3>

Test automation allows you to run the same tests repeatedly and execute them in parallel on the <a href="docs/general-reference/devices/">real devices</a> in the TestObject cloud.  To start your automated testing, you will need a script, defining the test, and a special software to control and run these pre-scripted tests. There are several frameworks available on the market. To run your tests on the TestObject device cloud you can choose between several open-source frameworks. 
 

<h3 id="frameworks">Test Automation Frameworks</h3>

At the moment the following frameworks are supported:

* <a href="/docs/testing-tools/automation/appium/">Appium</a>
* Robotium
* Espresso

If you want to run tests for native Android applications, you can use any of these three frameworks. To test native iOS applications, hybrid or web apps, we recommend to use Appium. 
To set up Appium on your system, you can also check out our <a href="/docs/guides/appium-ser/">Appium Tutorial Series</a>.

<h3 id="scripts">Execute test scripts</h3>

If you have created test scripts for one of the supported frameworks you can use them without any changes in your script. Otherwise you will have to write scripts first. 
On Espresso and Robotium you create a test apk, which you then upload and run on the TestObject platform. 
<!--further information -- link -->
For Appium it's a bit different. You will have to set some capabalities in your Appium driver to be able to execute them on our devices. You will find detailed instructions <a href="/docs/testing-tools/automation/appium/">here</a>.



<h3 id="reporting">Execution Reports</h3>

For every test run you will get a detailed report, including all logs, a video of the test run and screenshots. 


<h3 id="continuous integration">Continuous Integration</h3>

Automated testing is a perfect match for your continuous integration process. To ensure the basic functionality of your app automate your most important test cases and run tests regularly. 
Use our tutorials to <a href="/docs/guides/continuous-integration/">set up your Continuous Integration</a> </li> with TestObject.