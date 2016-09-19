---
title: Watcher Setups
layout: en
permalink: docs/tools/appium/setups/watcher-setups/
---
Watcher setup is an improvment of the Basic setup, and it can be used simply for registering your test results on TestObject, that means that your test results will not be only available on your testing machine, but also on Testobject. So if you used the Watcher you will see your test results marked as "success" or "error" on TestObject, but if you didn't use it, you will see your test results always marked as "unknown". To get the most benefit of TestObject, we recommend you to use the Watcher setup.

Here is a list of our Wacher setups, you just need to choose one of them according to the programming language you use and the testing framework you prefer.

###Java
Java is the first language we choose to run tests on our platform. We currently support both [JUnit](http://junit.org/junit4/) and [TestNG](http://testng.org/doc/index.html).

+ [JUnit Setup](/docs/tools/appium/setups/watcher-setup/junit/)
+ [TestNG Setup](/docs/tools/appium/setups/watcher-setup/testng/)

###Ruby
Ruby is our most recent addition as for supported languages for Appium tests. As a first framework, we have chosen [Test::Unit](https://github.com/test-unit/test-unit).

+ [Test::Unit Setup](/docs/tools/appium/setups/watcher-setup/testunit/)
