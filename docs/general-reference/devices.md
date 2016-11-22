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

TestObject hosts hundreds of <strong>real smartphones and tablets in the cloud</strong> for manual and automated testing. You can remotely control all devices directly from your browser. 

The devices are located at TestObjects' data center in Germany, connected to servers. TestObject uses a virtual networking computer (VNC) to transmit mouse and keyboard events on a device. The VNC client on the device relays back the graphical screen, and you can control it remotely. It is almost like holding the device in your hands.

You can upload and test your mobile applications on the devices directly from your browser. As opposed to testing on emulators our real devices allow you to see what your customers see when they use your app on their hardware. 

A user accessing a device means that this phone is exclusively assigned to this user during the whole session and cannot be accessed by another user. To ensure frictionless testing TestObject provides several instances of the same device model. 

Every time a session starts the app gets installed freshly on the respective phone and the chosen settings are applied. At the end of every session the device gets set back to its default settings, the phone is getting cleaned completely. <strong>None of your data remains on the phone.</strong>

Every user will be able to use a <strong>fresh, standard phone that is not modified</strong>. This guarantees reliable, realistic test runs for every user and application.

<h4 id="device-list">Device List</h4>

Currently, TestObject hosts <strong>more than 190 different models of real Android and iOS devices </strong>. We constantly add more devices to our pool. To see if the devices you want to test on are available, please refer to our <a href="https://devicelab.testobject.com/">Device Lab</a> for the complete device list, including device specifications.</b>

<h3 id="free_pre">Free vs. Premium Devices</h3>

Both Free and Premium devices are real devices and there is no defference at all between them. But if you have a free account, then you will need to use limited models of devices.

If you upgraded your plan, then you will be able to access and do your tests on much more devices.
Due to our **Fair Use** policy and to ensure that no single user is blocking devices permanently, we reserve the right to limit the daily usage time, depending on the purchased plan.
You can get more priority for your tests by [upgrading your plan](/docs/general-reference/settings/#plans).

Our Enterprise Customers can get exclusively dedicated devices for their tests. [Become an enterprise customer now](/docs/general-reference/settings/#enterprise_plan).

<h3 id="device_settings">Device settings</h3>
It is important to configure the devices you use and change its settings to make it relevant to your testing purposes. Therefore, TestObject has given you the possibility to set your test settings for both of Manual and Automated Testing.

The first setting you can change is the default **Device Orientation** (Portrait or Landscape), and this is useful if you want to run your test always in a specific orientation.

There is also the **Device Language** Setting which enables you to test your application in the language you wish.

Setting a **Proxy Settings** is also possible on Android but you need API level 17 or higher. You can easily enable it and clicking on the Save button after filling the requisted data.

<img class="center shadow" src="/img/dashboard/device-settings.png">

***

Some other setting are available only for **iOS**, like the **System Alerts Delay** which help you lunching your app without any issue related to the iOS system alerts.
And if you prefer to use a **private container directory** for your app instead of the shared one, you can do that with only one click.
<img class="center shadow" src="/img/dashboard/device_settings_ios.png">

***

While testing manually on our platform, you can control some further settings. [Learn more](/docs/testing-tools/manual-testing/). 

<div class="center">
	<h4><a href="https://devicelab.testobject.com/">devicelab.testobject.com</a></h4>
</div>

<br>

<img class="center shadow" src="/img/first-impressions/devicepool-photo2.jpg">

***
***
***
