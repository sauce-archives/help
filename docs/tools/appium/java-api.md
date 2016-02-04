---
title: Our Appium Java API
layout: en
permalink: docs/tools/appium/appium-java-api/
---

To make things more convenient for our customers, we provide our own Appium Java API, which contains everything that is necessary to run our Java Appium test setups.

We are constantly improving this library, so we recommend our users to keep an eye on it to make sure they are using the latest version. Our goal is to make Appium testing on TestObject as easy and convenient as possible, so we are always looking to support more advanced setups and interesting testing frameworks. So stay tuned for more Java goodness!

<h4>Current status</h4>

LATEST VERSION is <a href="https://github.com/testobject/testobject-appium-java-api"><strong>0.0.13</strong></a>

* Supports JUnit Basic, Watcher and Suites setups
* Supports TestNG Basic and Watcher setups

<h4>Changelog</h4>

<strong>v0.0.13</strong>

* now supports TestNG Watcher setup through TestObjectTestNGTestResultWatcher;
* our result watchers can now be set for any RemoteWebDriver, not just for AppiumDriver;
* capabilities TESTOBJECT_APP_ID, TESTOBJECT_DEVICE, TESTOBJECT_SUITE_NAME, TESTOBJECT_TEST_NAME and TESTOBJECT_APPIUM_VERSION are no longer deprecated.