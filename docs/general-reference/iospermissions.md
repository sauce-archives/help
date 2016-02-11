---
title: iOS Permissions
layout: en
permalink: docs/general-reference/iospermissions/
---

<h3>Handling Early iOS Alerts</h3>

<p>When testing an iOS app that triggers an alert immediately (e.g. notification or location services permission popup), the popup can appear before test software such as Appium has time to initialize, which can cause tests to time out at the beginning. You can read more about this on <a href="https://testobject.com/?p=8580">our blog post on the issue</a>.</p>

<p>To mitigate this issue, please add a wait of 5-8 seconds before your app requests permissions, to allow time for the testing sofware to initialize and you'll be able to interact with these alerts. This helps ensure reliability with both automated and manual tests.</p>

<p>Then, you can accept alerts with the "autoAcceptAlert" capability or by handling them individually in your Appium test case.</p>
