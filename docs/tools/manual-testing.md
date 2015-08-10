---
title: Manual Testing
layout: en
permalink: docs/testing-tools/manual-testing/
---

<li><a href="#introduction">Introduction</a></li>
<li><a href="#device-control">Device Control</a> </li>
<li><a href="#app-control">App Control</a> </li>
<li><a href="#tools">Tools</a></li>
<li><a href="#sensors">Sensors</a></li>
<li><a href="#device-settings">Device Settings</a> </li>
<ul>
    <li><a href="#3rd-party-apps">Install 3rd Party Apps and Accounts</a></li>
    <li><a href="#google-account">Add a Google Account to the Device</a></li>
    <li><a href="#share-device">Share your Device With Colleagues and Customers</a></li>
    <li><a href="#create_issue">Create an Issue</a> </li>
</ul>


<h3 id="introduction">Introduction</h3>
Manual testing is the most direct way to test your app. It is particularly suitable for the reproduction of reported bugs and to see how your app looks and feels. Access one of the <a href="https://devicelab.testobject.com/" target="_blank" >available devices</a> from the cloud and fully remote control it. To control the device you can use your Mouse and Keyboard.

A preparation and installation protocol will be executed automatically every time a device gets started. This takes a couple of seconds and guarantees a fresh, standard device for every new user. After a testing session was ended the previous app and all data gets cleaned from the device.


Inside the tool you can directly change some of the settings and manipulate the device's sensors. To access all avialable features open the left menu. The entire spectrum of options is only available for Android so far. The features will be implemented step by step for iOS, too.

The left menu is partitioned into several areas (from top):

<li><a href="#device-control">Device Control</a> </li>
<li><a href="#app-control">App Control</a> </li>
<li><a href="#tools">Tools</a></li>
<li><a href="#sensors">Sensors</a></li>
<li><a href="#device-settings">Device Settings</a> </li>

<br>
<img class="center shadow" src="/img/tools/manual/screenshot-manual-testing.png">
<br>
<h3 id="device-control">Device Control</h3>
<img src="/img/tools/manual/device-control.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Device Control Options">


<ul>
<p style="margin-top:40px">

<li><b>Stop Session:</b> Will terminate your session and you will return to the dashboard.</li>
<li><b>Switch Device:</b> See the list with all available devices and continue your test right away on a different device</.li>
<li><b>Share Device:</b> Generates a unique link to watch a live feed of your session. 
<li><b>Report Problem:</b> You experienced technical problem with our devices? Help us, so it won't happen again! Describe the problem you experienced and open a ticket for our developers to fix it asap.</li></p>
</ul>

<br style="clear:both">

<div style="padding-left:40px">
<h4 id="share-device">Share your Device with Colleagues and Customers</h4>
<img src="/img/tools/manual/share-device.png" alt="Share Device">
<br>
When you share a device, the recipient can see the screen of the device in real time. It makes collaborative work much easier. Demonstrate to clients the latest updates of the app or show your colleagues exactly where you found a problem.
<ol>
<li> Login and navigate to manual testing.</li>
<li> Open a device and look for "Share Device" in the left menu.</li>
<li> Create a link and send it to your customer/developer.</li>
<li> Now the recipient can see the device in real time.</li>
</ol>
</div>
<br style="clear:both">

<h3 id="app-control">App Control</h3>

<img src="/img/tools/manual/app-control.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="App Control Options">

<p style="margin-top:40px">
<ul>
<li><b>Restart App:</b> Closes and starts the app again without a full reinstallation.</li>
<li><b>Switch App:</b> Select a different version of your app</li>
<li><b>Install Dependancy:</b> Install an additional app to interact with. 
</p>
</ul>

<br style="clear:both">

<div style="padding-left:40px">
<h4 id="3rd-party-apps">Dependency: Install Third-Party Apps</h4>

If your app requires a third-party app, like Facebook or Twitter, for login, you can install these apps as dependencies.<br>
<b>I. Upload Dependency to TestObject</b>
<ol>
<li>Log in to TestObject and open the relevant project.</li>
<li>On the <a href="/docs/general-reference/dashboard/">Dashboard</a> click on "All Versions" in the Active Version segment.</li>
<li>Click on "New Dependency" below the list of your uploaded app versions.</li>
<li>Now, you can upload a third-party app, such as Facebook.</li>
</ol>
<b>II. Install Dependency on Device</b>
<ol>
<li>Go to manual testing and open a device.</li>
<li>Click on "Versions of Your App" in the left menu and go to "Install Dependency".</li>
<li>Select the dependency.</li>
<li>Now, the dependency app is installed on the device and ready for use.</li>
</ol>
</div>
<br style="clear:both">

<h3 id="tools">Tools</h3>

<img src="/img/tools/manual/tools.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Tool Options">

<p style="margin-top:40px">

<li><b>Monkey Exerciser:</b> We use the MonkeyExerciser from Google to stress-test your app. Start a stress test and see how the monkey performs thousands of random clicks within your app. If you want to perform a stress test on multiple devices in parallel, please have a look at our <a href="/docs/testing-tools/quality-report/#stress-test" target="_blank">Quality Report.</a>.</li></p>

<p><li><b>ADB Shell:</b> The Android Debug Bridge is a command line tool. It is part of the Android SDK and helps you control connected devices. At TestObject, ADB can be used to send shell commands to the devices.</li></p>
<!-- <li><b>Upload file:</b></li>
<li><b>Paste Content</b></li>-->
<br style="clear:both">

<h3 id="sensors">Sensors</h3>

<img src="/img/tools/manual/sensors.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Sensor Options">

<p style="margin-top:40px">

<p><li><b>Rotate Device:</b> Test if your app works correctly in portrait and landscape modes and rotate the device.</li></p>
<p><li><b>Set GPS:</b> You can set and change the GPS position of the device. We use mock locations that allows you to generate location data without actually moving the device.</li></p>
<br style="clear:both">

<h3 id="device-settings">Device Settings</h3>

<img src="/img/tools/manual/device-settings.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Device Settings">

<p style="margin-top:40px">

<p>
<!--<li><b>Toggle WiFi:</b></li>
<li><b>Toggle Animations:</b></li>-->
<li><b>Change Language:</b> You can change the language settings of the device. Click on "Change Language" and select one of the languages from the list.</li></p>
<li><b>Add Google Account:</b> Many apps require a Google login. We provide a one-click solution that directs you to the Google login page immediately. Here, you can log in to your existing Google account or create a new one.</li></p>

</ul>

<br style="clear:both">

<div style="padding-left:40px">
<h4 id="google-account">Use your own Google-Account on our Devices</h4>
Form some tests you need your own Google-Account on a device. We have added a feature to add your account. <b>We will delete this account of course automatically after your session is closed.</b>

1. Go to Manual testing and open a device
2. Click on "Add Google Accounts" in the left menu
3. Add your Google Account to the device
<br style="clear:both">

<h3 id="create_issue">Create an Issue</h3>


* General info about the app under test and the device
* Screenshot is taken when you create an issues
* Device log, which you can search, filter and download

<img class="center shadow" src="/img/dashboard/manual-report.png">
<!--
<h3 id="screenshot">Make a Screenshot>

<h3 id="logs">Logs</h3>


-->