---
title: Get to know Manual Testing
layout: en
permalink: docs/testing-tools/manual-testing/
---

<li><a href="#whatis">What is Manual Testing?</a></li>
<li><a href="#device-management">Device Management</a> </li>
<li><a href="#app-management">App Management</a> </li>
<li><a href="#tools">Tools</a></li>
<li><a href="#sensors">Sensors</a></li>
<li><a href="#device-settings">Device Settings</a> </li>
<li><a href="#create-issue">Create an Issue</a> </li>
<li><a href="#screenshots">Take a Screenshot</a> </li>
<li><a href="#logs">Device Log</a> </li>


<br> 

<center>
<iframe width="750" height="422" style="margin-bottom: 20px" src="https://www.youtube.com/embed/_Jj3zPIq96E" frameborder="0" allowfullscreen></iframe>
</center>

<h3 id="whatis">Introduction</h3>
Manual testing is the most direct way to test your app. It is particularly suitable for the reproduction of reported bugs and to see how your app looks and feels. Access one of the <a href="https://devicelab.testobject.com/" target="_blank" >available devices</a> from the cloud and fully remote control it. To control the device you can use your Mouse and Keyboard.

Testing manually throught TestObject only requires you to upload the .apk or .ipa file so your application can be run on the device you are interested in. If you are unsure how to create an .ipa file, check out this <a href="/docs/guides/creating-ipa/">short guide</a>.

A preparation and installation protocol will be executed automatically every time a device gets started. This takes a couple of seconds and guarantees a fresh, standard device for every new user. After a testing session was ended the previous app and all data gets cleaned from the device. For Android 6.0 devices or higher we currently grant all runtime permissions automatically.

To document your test results you can go to the right side of the Manual Testing view. Document the issues you've found, take screenshots throughout the test, and have a look on the extensive log data provided.

Change some of the settings and manipulate the device's sensors. To access all available features, open the left menu. The entire spectrum of options is only available for Android so far. The features will be implemented step by step for iOS, too.

The left menu is partitioned into several areas (from top):

<li><a href="#device-management">Device Managment</a> </li>
<li><a href="#app-management">App Management</a> </li>
<li><a href="#tools">Tools</a></li>
<li><a href="#sensors">Sensors</a></li>
<li><a href="#device-settings">Device Settings</a> </li>

<br>
<img class="center shadow" src="/img/tools/manual/screenshot-manual-testing.png">
<br>
<h3 id="device-management">Device Management</h3>
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


<h3 id="app-management">App Management</h3>

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


<h3 id="tools">Tools</h3>

<img src="/img/tools/manual/tools.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Tool Options">

<p style="margin-top:40px">

<li><b>Paste Content:</b> Create content in a text field and paste it to your app.</li>
<li><b>Monkey Exerciser:</b> We use the MonkeyExerciser from Google to stress-test your app. Execute a pre-defined number of random inputs on the device.

<p><li><b>ADB Shell:</b> The Android Debug Bridge is a command line tool. It is part of the Android SDK and helps you control connected devices. At TestObject, ADB can be used to send shell commands to the devices.</li></p>
<li><b>Upload file:</b> Select a file from your system and upload it to the device storage.</li>

<br style="clear:both">

<h3 id="sensors">Sensors</h3>

<img src="/img/tools/manual/sensors.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Sensor Options">

<p style="margin-top:40px">

<p><li><b>Rotate Device:</b> Rotate the device to see if your app works correctly in portrait and landscape mode.</li></p>
<p><li><b>Set GPS:</b> You can set and change the GPS position of the device. We use mock locations that allows you to generate location data without actually moving the device.</li></p>
<br style="clear:both">

<h3 id="device-settings">Device Settings</h3>

<img src="/img/tools/manual/device-settings.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Device Settings">

<p style="margin-top:40px">

<p>
<li><b>Toggle WiFi:</b> Connects/Disconnects the WiFi connection. Simulate you app's offline experience.</li>
<li><b>Toggle Animations:</b> Turn </li>
<li><b>Change Language:</b> You can change the language settings of the device. Click on "Change Language" and select one of the languages from the list.</li></p>
<li><b>Add Google Account:</b> Many apps require a Google login. We provide a one-click solution that directs you to the Google login page immediately. Here, you can log in to your existing Google account or create a new one.</li></p>

</ul>

<br style="clear:both">

<h3 id="create-issue">Create an Issue</h3>

Testing is only useful if you can document your findings. The best way to do so with Manual Testing is to create a 'New Issue'. You can create a new issue during your manual test by selecting the 'New Issue' button. You can <a href="/docs/general-reference/issue-tracking">track issues</a> with the built in tracker or with a third party integration.

<img class="center shadow" src="/img/tools/manual/issue.png" alt="Issue Creation">



<br style="clear:both">


<h3 id="screenshots">Take a Screenshot</h3>

<img src="/img/tools/manual/screenshot2.png" width="311" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Sample Screenshot">

<p style="margin-top:40px">
Apart from the screenshot which is attached to any issue created, additional screenshots can be taken any time.<br>
A click on the camera symbol in the right corner  snaps a screenshot and safes it as a png file to the dedicated download folder of your browser.

<br style="clear:both">

<h3 id="logs">Device Logs</h3>

Throughout your manual tests the log output of the device is collected and viewable for you.<br>
Filter the logs due to your needs. The different levels applicable are Verbose, Debug, Info, Warn, Error, Assert.<br>
Log options also include a search function, a scroll lock, an option to clear the logs and a download function, which safes the selected logs in a txt file.

<img src="/img/tools/manual/logcat2.png" alt="Device Log">


