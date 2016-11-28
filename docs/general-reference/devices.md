---
title: Cloud Devices
layout: en
permalink: docs/general-reference/devices/
alias: /docs/devices/
---

* <a href="#device_farm">Device Farm</a>
* <a href="#free_pre">Free vs. Premium Devices</a>
* <a href="#device_settings">Device settings</a>


<h3 id="device_farm">Device Farm</h3>
<h4 id="real-devices-how-it-works">Real Devices: How It Works</h4>

TestObject hosts hundreds of **real smartphones and tablets in the cloud** for manual and automated testing. You can remotely control all devices directly from your browser.

The devices are located at TestObjects' data center in Germany. TestObject uses a virtual networking computer (VNC) to transmit mouse and keyboard events on a device. The VNC client on the device relays back the graphical screen, and you can control it remotely. It is almost like holding the device in your hands.

You can upload and test your mobile applications on the devices directly from your browser. As opposed to testing on emulators, our real devices allow you to see what your customers see when they use your app on their hardware.

A user accessing a device means that this phone is exclusively assigned to this user during the whole session and cannot be accessed by another user. To ensure frictionless testing, TestObject provides several instances of the same device model.

Every time a session starts the app gets installed freshly on the respective device and the chosen settings are applied. At the end of every session the device gets set back to its default settings, the phone is getting cleaned completely.

Every user will be able to use a **fresh, standard phone that is not modified**. This guarantees reliable, realistic test runs for every user and application.

<h4 id="device-list">Device List</h4>

Currently, TestObject hosts <strong>more than 200 different models of real Android and iOS devices </strong>. We are constantly adding more devices to our pool. To see if the devices you want to test on are available, please refer to our <a href="https://devicelab.testobject.com/">Device Lab</a>, where you will be able to access the complete device list, including device specifications.</b>

<h3 id="free_pre">Free vs. Premium Devices</h3>

While on a free (i.e. not premium) plan, you will be restricted to running your tests on free devices only. Free devices, just like premium ones, are real devices. The only difference is that they can be accessed from free users.

If you upgraded to a premium plan, you will be able to access and run your tests on a much wider array of devices. Due to our *Fair Use* policy, which is in place to ensure that no single user is blocking devices permanently, we reserve the right to limit the daily usage time, depending on the purchased plan. You can get more testing time by [upgrading your plan](/docs/general-reference/managing-your-account/#plans).

Our enterprise customers can get dedicated devices, which can not be allocated to other users, and which allow for higher performance when executing tests through shorter waiting times. [Become an enterprise customer now](/docs/general-reference/managing-your-account/#enterprise_plan).

<h3 id="device_settings">Device settings</h3>
TestObject gives you the possibility to set the default settings your devices will be launched with when you are testing on them. Among these are:

* *Device Orientation* can be set to portrait or landscape (this is useful if you want to run your test always in a specific orientation);
* *Device Language* enables you to test your application in the language you wish;
* *Proxy Settings* can also be set on Android API level 17 or higher.

<img class="center shadow" src="/img/dashboard/device-settings.png">

***

Some other settings are available only for iOS, like the *System Alerts Delay*, which helps you running your tests without having to care about dismissing iOS system alerts. And if you prefer to use a *Private Container Directory* for your app instead of the shared one, you can do that with only one click.
<img class="center shadow" src="/img/dashboard/device_settings_ios.png">

***

You will be able to change most of the settings described above in real time while running manual testing. [Learn more](/docs/testing-tools/manual-testing/).

<div class="center">
	<h4><a href="https://devicelab.testobject.com/">devicelab.testobject.com</a></h4>
</div>

<br>

<img class="center shadow" src="/img/first-impressions/devicepool-photo2.jpg">

***
***
***
