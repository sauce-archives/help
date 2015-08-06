---
title: Dashboard
layout: en
permalink: docs/general-reference/dashboard/
---

On your dashboard you will find all important <b>information and settings on a specific app</b>, brought together on one screen:
<ul>
    <li><a href="#tool-access">Access Testing Tools</a></li>
    <li><a href="#issues">Manage Issues</a></li>
    <li><a href="#issue-tracker">Connect Issue Tracker</a></li>
    <li><a href="#activities">Control Activities</a></li>
    <li><a href="#app-versions">Manage Active App Version</a></li>
    <li><a href="#device-settings">Edit Device Settings</a></li>
</ul>



<img class="center shadow" src="/img/dashboard/app-dashboard.png">


<h3 id="tool-access">Access Testing Tools</h3>
<img class="center shadow" src="/img/dashboard/dashboard-testing.png">
 
 With only one click you can start testing on the different testing tools. 
 
 Access <a href="/docs/testing-tools/manual-testing/">Manual Testing</a>, <a href="/docs/testing-tools/quality-report/">Quality Report</a>, and <a href="/docs/testing-tools/automation/">Automated Testing</a> from here. 

<h3 id="issues">Manage Issues</h3>
All the issues for the respective app are collected in the "Issues" section. Manage your issues directly inside TestObject or connect to one of the supported <a href="#issue-tracker">Issue Trackers</a>.

<img class="center shadow" src="/img/dashboard/issues.png">


The most recent issue are shown on top. You can search the list for specific issues, devices, OS versions, screen sizes etc.

Navigate from here to the individual issues reports created before. All issues comprise a description of the bug as well as extensive reports. 
The <a href="/docs/testing-tools/manual-testing/#create_issue">Manual Testing Report</a> contains a screenshot, logs, additinal information on the app and the device and your description of the issue.

For automated testing you will find attached the full <a href="/docs/testing-tools/automation/reporting/">Automated Testing Report</a>.

<img class="center shadow" src="/img/dashboard/issuelist.png">

<h3 id="issue-tracker">Connect Issue Tracker</h3>


Ensure optimal bug fixing processes by connecting with your issue tracker. TestObject supports your Jira and GitHub Account.

To set up your issue tracker you only need to add your credentials and choose the project you want the issues to appear in. 
When you create an issue it will be transferred automatically to your Jira or GitHub account. 

To view the details of your issue, you will find a  link in JIRA/GitHub. 

Click on the link to have a closer look at the screenshots, logs and device specifications generated on TestObject.
<img class="center shadow" src="/img/dashboard/jira-github.png">

<h3 id="activities">Control Activities</h3>

Once you start a new <a href="/docs/testing-tools/quality-report/">Quality Report</a> or execute <a href="/docs/testing-tools/automation/">Automated Tests</a> it appears in the activity area.<br>
Each currently executing entry displays its progress, so you will be able to monitor its progress. Once an item is done processing it moves into the “Recent Activity” section where it is stored for future review. Each of the items is clickable. Quickly navigate between the results and review them.

<img class="center shadow" src="/img/dashboard/activity.png">

<h3 id="app-versions">Manage Active App Version</h3>

You will see at first glance which app you have selected. It gives you information on the name, version, package name and when it was uploaded to your TestObject Account.

<img class="center shadow" src="/img/dashboard/active_version.png">

Upload a new app version from this window or go to "All Versions". It gives you an overview about all the previous versions of the app that were uploaded so far. 

<h4>Add Dependency</h4>
Below this list of uploaded app versions, you find a button to upload your dependancy. Every time you test your app the dependancy gets installed on the devices as well. This allows you to connect to another app like e.g. facebook with your test application, even if it is not standardly installed on the devices. 

<img class="center shadow" src="/img/dashboard/dependancy.png">

<h3 id="device-settings">Edit Device Settings</h3>

Choose your preferred Device Settings. Change the device orientation (Default orientation, Portrait, or Landscape), the standard device language, and set a proxy if you need to. Proxy settings are available on all devices with API level 17 or higher.


<!--<h3 id="activity-stream">Activity Stream</h3>-->
