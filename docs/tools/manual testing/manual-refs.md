
---
title: Additional options in Manual Testing
layout: en
permalink: docs/testing-tools/manual-refs/

<ul>
    <li><a href="#3rd-party-apps">Install 3rd Party Apps and Accounts</a></li>
    <li><a href="#google-account">Add a Google Account to the Device</a></li>
    <li><a href="#share-device">Share your Device With Colleagues and Customers</a></li>
    <li><a href="#create-issue">Create an Issue</a> </li>
</ul>



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

<h4 id="google-account">Use your own Google-Account on our Devices</h4>
Form some tests you need your own Google-Account on a device. We have added a feature to add your account. <b>We will delete this account of course automatically after your session is closed.</b>

1. Go to Manual testing and open a device
2. Click on "Add Google Accounts" in the left menu
3. Add your Google Account to the device
<br style="clear:both">
</div>
<h3 id="create-issue">Create an Issue</h3>

Testing is only useful if you can document your findings. The best way to do so with Manual Testing is to create a 'New Issue'. <br>
Clicking on the button creates a report.<br>
To safe the issue you will need to add a title. For more detailed information add a more detailed description in the field below.<br>
The report allows you to toggle between three different views, which include:

* General info about the app under test and the device
* A screenshot of the device is added
* The full <a href="#logs">Device Log</a>

'Create Issue' saves the report. For every app your issues will be saved centrally. To navigate there directly, click on the red bug symbol on top of the window bar. Or access your issues from your <a href="/docs/general-reference/dashboard/">app dashboard.</a> <br>
You also have the option to intgrate this report with your favorite <a href="/docs/general-reference/dashboard/#issue-tracker">Isssue Tracker</a>.


<img class="center shadow" src="/img/tools/manual/issue.png" alt="Issue Creation">



<br style="clear:both">
