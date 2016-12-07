---
title: Appium Test Reports
layout: en
permalink: docs/tools/appium/test-reports/
---

<ul>
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#test-reports">Test Reports Page</a></li>
	<li><a href="#test-report-data">Test Report Data</a></li>
	<li><a href="#sharing-test-reports">Sharing Test Reports</a></li>
	<li><a href="#open-an-issue">Open an Issue</a></li>
</ul>

<h3 id="introduction">Introduction</h3>

When running Appium tests on TestObject, test reports give you a convenient and organised way to browse your results. Quickly find which executions failed and which devices cause the most trouble. The test reports will automatically organise test information, such as video and device logs. This can be valuable for seeing exactly why a test failed and resolving any issues with your application. You can share the report with your colleagues and also use the report to create and track [issues](/docs/general-reference/issue-tracking/).

<h3 id="test-reports">Test Reports Page</h3>

To view your test reports, first navigate to your project dashboard. From here, open the Automated Testing tab and select Appium. From your Test Reports page, you can now view all of your Test Reports to get an overview of your testing. To record if your tests passed or failed, you will need to use the [Watcher Setup](/docs/tools/appium/setups/watcher-setups/) or the more advanced [Suite Setup](/docs/tools/appium/setups/suite-setups/). If you are using the Suite Setup, you can select the Test Suites tab to view your test reports. 

<img src="/img/tools/automation/appium/test-results.png">

<h3 id="test-report-data">Test Report Data</h3>

From the Test Reports page, you can select a particular test report for more information. For each test report, you will have access to:

<ul>
	<li>App information: app name, app version, date uploaded</li>
	<li>Device information: device name, os version</li>
	<li>Screenshots</li>
	<li>Test video</li>
	<li>Appium request list</li>
	<li>Device logs</li>
	<li>Appium logs</li>
</ul>

Screenshots are not taken automatically, so it will be necessary to add screenshots to your Appium test. You can do this using the normal Appium screenshot command, and your screenshots will be automatically added to your test report. All other data will be automatically added to your test report.

<img class="center shadow" src="/img/tools/automation/Appium_Execution_Report.png">

<h3 id="sharing-test-reports">Sharing Test Reports</h3>

In order to share the test report with others, simply select the Share button from your test report. This will generate a link which you can share with your collaborators, giving them access to the full Test Report. This feature can be useful when trying to show a developer a failing test, or simply to showcase new changes to the application. They will be able to view the link conveniently, without needing an account on TestObject.

<img class="center shadow" src="/img/tools/automation/appium/share-test-report.png">

To manage your test report link, select the Share button again. This will give you access to the link as well as an option to un-share the test report.

<h3 id="open-an-issue">Open an Issue</h3>

<a href="/docs/general-reference/issue-tracking/">Tracking issues</a> with your app is easy. You can open a new issue directly from the report by selecting the New Issue button. The new issue will be tracked using the built in issue tracker. You can also integrate with a <a href="/docs/general-reference/issue-tracking/#third-party-integration">third party tracker</a> such as Github or Jira and the issue will be tracked there. The new issue will automatically include the full test report, as well as your title and description of the issue.

<img class="center shadow" src="/img/general-reference/issue-tracking/new-issue-button.png">
