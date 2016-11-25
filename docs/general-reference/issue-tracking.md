---
title: Issue Tracking
layout: en
permalink: docs/general-reference/issue-tracking/
---

<ul>
	<li><a href="#open-an-issue">Open an Issue</a></li>
	<li><a href="#issue-tracker">Issue Tracker</a></li>
	<li><a href="#third-party-integration">Third Party Integrations</a></li>
</ul>

<h3 id="open-an-issue">Open an Issue</h3>

If you encounter a problem with your application while testing, you can track it by opening a new issue. At any time during manual testing, you can select the New Issue button to record your issue. For automated testing, you can find the New Issue button located on each test report.

<img class="center shadow" src="/img/general-reference/issue-tracking/new-issue-button.png">

Your issue will automatically contain useful information related to the issue. For manual tests, a screenshot, logs, and additional information on the app and device will be included. For automated tests, the full test report will be attached. To leave additional information for tracking the issue, you can fill out a title and description.

<img class="center shadow" src="/img/general-reference/issue-tracking/issue-form.png">

<h3 id="issue-tracker">Issue Tracker</h3>

All issues for the respective app are collected in the "Issues" section. You can manage your issues directly inside TestObject or connect to one of the supported <a href="#third-party-integration">third party issue trackers</a>. To access your issues in TestObject, open your project dashboard and select "Issues".

<img class="center shadow" src="/img/general-reference/issue-tracking/issues.png">

The most recent issues are shown on top. You can search for specefic issues using the search tool. When an issue is resolved, you can check the box to the left of the issues you would like to close and select "Archive". To view archived issues you can select the Archived tab. When viewing archived issues, you can reopen them by again checking the issue and selecting Reopen. 

<img class="center shadow" src="/img/general-reference/issue-tracking/issue-dashboard.png">

By selecting a particular issue, you can view, edit and print the issue report. The issue report will include device information, app version, and device logs as well as the issue description.

<img class="center shadow" src="/img/general-reference/issue-tracking/issue-report.png">


<h3 id="third-party-integration">Third Party Integration</h3>

Ensure optimal bug fixing processes by connecting your TestObject account with your favorite issue tracker. So far <strong>Jira and GitHub</strong> are supported. To connect to your third party issue tracker, open your project dashboard and select "Connect Now" from the Issue Tracker section.

<img class="center shadow" src="/img/general-reference/issue-tracking/connect-to-tracker.png">

To set up your issue tracker add your credentials and choose the project you want the issues to appear in. You are ready to go! 
When you create an issue it will be transferred automatically to your Jira or GitHub account. 

To view the details of your issue, you will find a link in JIRA/GitHub. Click on the link to have a closer look at the screenshots, logs and device specifications generated on TestObject.



