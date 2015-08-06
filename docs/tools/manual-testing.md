---
title: Manual Testing
layout: en
permalink: docs/testing-tools/manual-testing/
---

<li><a href="#introduction">Introduction</a></li>
<li><a href="#tools-sensors-settings">Tools, Sensors and Settings</a></li>
<li><a href="#3rd-party-apps">Install 3rd Party Apps and Accounts</a></li>
<li><a href="#google-account">Add a Google Account to the Device</a></li>
<li><a href="#share-device">Share your Device With Colleagues and Customers</a></li>
<li><a href="#create_issue">Create an Issue</a> </li>



<h3 id="introduction">Introduction</h3>
Manual testing is the most direct way to test your app. You can see how your app looks and feels as well as reproduce reported bugs. At TestObject, you can test your app manually without the need to buy all the devices yourself and spend a fortune on infrastructure. You can upload your app on our devices and fully remote control them. The manual testing tool provides different features that can help you test your app. The features will be discussed in this post.

<br>
<img class="center shadow" src="/img/tools/manual/screenshot-manual-testing.png">
<br>

<h3 id="tools-sensors-settings">Tools, Sensors and Settings</h3>

You can change some of the settings and sensors of the devices. To access the features just open the left menu.

<img src="/img/tools/manual/left-menu.png" width="311" height="194" style="float:left; margin-right:60px;
  margin-bottom:10px" alt="Manual Testing Menu">

<p style="margin-top:60px"><ul><li><b>Add Google Account:</b> Many apps require a Google login. We provide a one-click solution that directs you to the Google login page immediately. Here, you can log in to your existing Google account or create a new one.</li></ul></p>
<p><ul><li><b>Change Language:</b> You can change the language settings of the device. Click on "Change Language" and select one of the languages from the list.</li></ul></p>
<p><ul><li><b>Set GPS:</b> You can set and change the GPS position of the device. We use mock locations that allows you to generate location data without actually moving the device.</li></ul></p>
<p><ul><li><b>Rotate Device:</b> Test if your app works correctly in portrait and landscape modes and rotate the device.</li></ul></p>
<p><ul><li><b>Monkey Exerciser:</b> We use the MonkeyExerciser from Google to stress-test your app. Start a stress test and see how the monkey performs thousands of random clicks within your app. If you want to perform a stress test on multiple devices in parallel, please have a look at our <a href="/docs/testing-tools/quality-report/#stress-test" target="_blank">Quality Report.</a>.</li></ul></p>
<p><ul><li><b>ADB Shell:</b> The Android Debug Bridge is a command line tool. It is part of the Android SDK and helps you control connected devices. At TestObject, ADB can be used to send shell commands to the devices.</li></ul><br style="clear:both"></p>


<h3 id="3rd-party-apps">Dependency: Install Third-Party Apps</h3>

<img src="/img/tools/manual/dependency-process.png" width="311" height="194" style="float:right; margin-left:60px;
  margin-bottom:10px" alt="Manual Testing Menu">

If your app requires a third-party app, like Facebook or Twitter, for login, you can install these apps as dependencies.

<b>I. Upload Dependency to TestObject</b>

1. Log in to TestObject and open the relevant project.
2. Click on the app symbol of your app in the upper main bar.
3. Click on "New Dependency" next to "New Version".
4. Now, you can upload a third-party app, such as Facebook.

<b>II. Install Dependency on Device</b>

1. Go to manual testing and open a device.
2. Click on "Versions of Your App" in the left menu and go to "Install Dependency".
3. Select the dependency.
4. Now, the dependency app is installed on the device and ready for use.


<h3 id="google-account">Use your own Google-Account on our Devices</h3>
Form some tests you need your own Google-Account on a device. We have added a feature to add your account. <b>We will delete this account of course automatically after your session is closed.</b>

1. Go to Manual testing and open a device
2. Click on "Add Google Accounts" in the left menu
3. Add your Google Account to the device

<br>
<img src="/img/tools/manual/addgoogleaccount.png" alt="Add Google Account">
<br>


<h3 id="share-device">Share your Device with Colleagues and Customers</h3>

When you share a device, the recipient can see the screen of the device in real time. It makes collaborative work much easier. Demonstrate to clients the latest updates of the app or show your colleagues exactly where you found a problem.

1. Login and navigate to manual testing.
2. Open a device and look for "Share Device" in the left menu.
3. Create a link and send it to your customer/developer.
4. Now the recipient can see the device in real time.

<br>
<img src="/img/tools/manual/share-device.png" alt="Share Device">
</br>

<h3 id="create_issue">Create Issue</h3>

Crea

* General info about the app under test and the device
* Screenshot is taken when you create an issues
* Device log, which you can search, filter and download

<img class="center shadow" src="/img/dashboard/manual-report.png">

<!-- old: possible within the UI 
<h3 id="toggle-connection">Use ADB to deactivate the Internet Connection</h3>

It is possible to deactivate the WIFI (Internet) Connection of our devices via ADB commands. Please use the following command:
{% highlight xml %}
am broadcast -a org.testobject.android.toolkit.DEVICE_MANAGER --es ACTION WIFI_DISCONNECT
{% endhighlight %} --> 
