---
title: Basic Setups
layout: en
permalink: docs/tools/appium/setups/basic-setups/
---
The Basic setup is the simplest, fastest way you can get started with running your Appium tests on TestObject. You don't need to worry about importing any libraries whatsoever: just choose the language you are most comfortable with and the device you want to test on, and let TestObject do the rest!

###Java
Java is the first language we choose to run tests on our platform. We currently support both [JUnit](http://junit.org/junit4/) and [TestNG](http://testng.org/doc/index.html).

+ [JUnit Setup](/docs/tools/appium/setups/basic-setup/junit/)
+ [TestNG Setup](/docs/tools/appium/setups/basic-setup/testng/)

###Ruby

+ [Test::Unit Setup](/docs/tools/appium/setups/basic-setup/testunit/)

###Javascript
WebdriverIO is a testing framework that allows you to write web tests using Javascript. Currently only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible in the test report on TestObject.

+ [WebDriverIO Setup](/docs/tools/appium/setups/basic-setup/webdriverio/)

###PHP
Codeception is a testing framework that allows you to write web tests using PHP. Currently only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible in the test report on TestObject.

+ [Codeception Setup](/docs/tools/appium/setups/basic-setup/codeception/)

###Python
It is possible to write and run Appium tests using Python on TestObject. To do that, you need to point to the following Appium server:

    http://appium.testobject.com:80/api/appium/wd/hub
