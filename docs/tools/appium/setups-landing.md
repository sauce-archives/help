---
title: Setting up your Tests
layout: en
permalink: docs/tools/appium/setups/
---

###Running Appium tests on TestObject
It is possible to run Appium tests on TestObject using different languages, testing frameworks and approaches. But first, you need to choose and use one of the following setups.

####[Basic setup](/docs/tools/appium/setups/basic-setups)
Basic setup is the simplest and the fastest setup you can ever use to run your Appium tests on a single device on TestObject. It's been written in many languages/testing frameworks just to keep everything super easy for you. [Learn more](/docs/tools/appium/setups/basic-setups)

####[Watcher setup](/docs/tools/appium/setups/watcher-setups)
Watcher setup is an improvment of the Basic setup, and it can be used simply for registering your test results on TestObject, that means that your test results will not be only available on your testing machine, but also on Testobject. So if you used the Watcher you will see your test results marked as "success" or "error" on TestObject, but if you didn't use it, you will see your test results always marked as "unknown". To get the most benefit of TestObject, we recommend you to use the Watcher setup. [Learn more](/docs/tools/appium/setups/watcher-setups)

####[Suite setup](/docs/tools/appium/setups/suite-setups)
You need to use Suite setup when you want to run your Appium tests on multiple devices at the same time. To do that, you only need to create a new suite on TestObject, then to add some testing devices to the created suite, after that you run your tests on the new suite using the number "suiteId". [Learn more](/docs/tools/appium/setups/suite-setups)
