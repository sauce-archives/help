---
title: Basic Setups
layout: en
permalink: docs/tools/appium/setups/basic-setups/
---
Basic setup is the simplest and the fastest setup you can ever use to run your Appium tests on a single device on TestObject. It's been written in many languages/testing frameworks just to keep the process easy for you. Here is a list of our Basic setups, you just need to choose one of them according to the programming language you use and the testing framework you prefer.

###Java
Java is the first language we choose to run tests on our platform. We currently support both [JUnit](http://junit.org/junit4/) and [TestNG](http://testng.org/doc/index.html).

+ [JUnit Setup](/docs/tools/appium/setups/basic-setup/junit/)
+ [TestNG Setup](/docs/tools/appium/setups/basic-setup/testng/)

###Ruby
Ruby is our most recent addition as for supported languages for Appium tests. As a first framework, we have chosen  [Test::Unit](https://github.com/test-unit/test-unit).

+ [Test::Unit Setup](/docs/tools/appium/setups/basic-setup/testunit/)

###WebDriverIO
WebdriverIO is a testing framework that allows you to write web tests using Javascript. Currently only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible in the test report on TestObject.

+ [WebDriverIO Setup](/docs/tools/appium/setups/basic-setup/webdriverio/)

###Python
It is possible to write and run Appium tests using Python on TestObject. To do that, you need to point to the following Appium server:

    http://appium.testobject.com:80/api/appium/wd/hub
