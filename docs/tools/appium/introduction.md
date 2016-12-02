---
title: Introduction
layout: en
permalink: docs/tools/appium/introduction/
alias: /docs/testing-tools/automation/appium/
---

<ul>
	<li><a href="#about-appium">About Appium</a></li>
	<li><a href="#how-it-works">How it Works</a></li>
	<li><a href="#testing">Running Appium Tests on TestObject</a></li>
</ul>

<h3 id="about-appium">About Appium</h3>

Appium is an open-source test-automation framework for mobile apps &ndash; native, hybrid and web apps are supported. It drives iOS and Android apps using a standardized protocol. Selenium uses the same protocol and design so if you are familiar with Selenium for web testing, Appium will definitely be easy to get started with.

One of the advantages of Appium is it's flexibility. Appium allows you to write tests in several popular languages, including Java, Javascript, Ruby, PHP, C#, and Python. This makes it signficantly easier to begin writing tests since you don't need to learn a new programming language to get started. You can simply write your tests using whichever language you are most comfortable with. If you want to get a first taste of what it is like to automate tests using Appium, have a look at our <a href="/docs/guides/tutorials-appium/">Appium Tutorial Series</a>, where we help you set up Appium on your system and run your first test.

<h3 id="how-it-works">How it Works</h3>

Appium uses a client server architecture. When you are writing your test case, this behaves as the Appium client. You can write your test case using the your programming language of choice, and the Appium library will communicate your test to the Appium Server. Because of this design, Appium makes it simple to write tests &ndash; regardless of whether we are testing on Android or iOS. This is because the Appium server exposes the same interface for running tests on Android and iOS. 

The Appium server recieves commands from your test, and it then interacts with the device to actually execute your test. The Appium server can be run locally, and you can run your test on a device sitting on your table. The Appium server can also be run on TestObject, in the cloud, and your test can be run on devices in our device farm. Because of Appium's flexible design, it is easy to migrate your existing tests to run on TestObject.

<h3 id="testing">Running Appium Tests on TestObject</h3>

If you are just getting started with Appium, visit our [Appium Tutorial Series](/docs/guides/tutorials-appium/) to write your first tests. Your existing Appium tests will run on the TestObject platform with just some small changes.

<h4>How to get up and running in 10 minutes</h4>

1. Create and activate a <a href="https://app.testobject.com/#/signup" target="_blank">TestObject account</a>. It's free to get started and no credit card is required.
2. Log into your account and [upload the app](/docs/general-reference/managing-your-apps/) you want to test.
3. Check out one of our [Basic setups](/docs/tools/appium/setups/basic-setups) (depending on which language / testing framework you are using) to see how to quickly run a test on our platform;
5. Run the tests on your machine and see them being recorded on our platform in the project you have just created.

When you are done, don't forget to check out <a href="/docs/tools/appium/setups/">more advanced setups</a> to have an even better testing experience on TestObject!
