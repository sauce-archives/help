---
title: Appium Test Reports
layout: en
permalink: docs/tools/appium/test-reports/
---

<ul>
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#test-reports">Test Reports Page</a></h3>
	<li><a href="#test-report-data">Test Report</a></h3>
	<li><a href="#sharing-test-reports">Sharing Test Reports</a></h3>
</ul>

<h3 id="introduction">Introduction</h3>

When running Appium tests on TestObject, test reports give you a convenient and organised way to browse your results. Quickly find which executions failed and which devices cause the most trouble. The test reports will automatically organise test information, such as video and device logs. You can share the report with your colleagues and also use the report to create and track [issues](/docs/general-reference/issue-tracking/).

<h3 id="test-reports">Test Reports Page</h3>

To view your test reports, first navigate to your [project dashboard](/docs/general-reference/dashboard/). From here, open the Automated Testing tab and select Appium. From your Test Reports page, you can now view all of your Test Reports to get an overview of your testing. To record if your tests passed or failed, you will need to use the [Watcher Setup](/docs/tools/appium/setups/watcher-setups/) or the more advanced [Suite Setup](/docs/tools/appium/setups/suite-setups/). If you are using the Suite Setup, you can select the Test Suites tab to view your test reports. 

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

Screenshots are not taken automatically, so it will be necessary to add screenshots to your Appium test. You can do this using the normal Appium screenshot command, and your screenshots will be automatically added to your test report.

<img class="center shadow" src="/img/tools/reporting/automation-report-individual-execution-info.png">

<h3 id="sharing-test-reports">Sharing Test Reports</h3>

In order to share the test report with others, simply select the Share button from your test report. This will generate a link which you can share to other team members, giving them access to the full Test Report. This feature can be useful when trying to show a developer a failing test, or simply to showcase new changes to the application.

<img class="center shadow" src="/img/tools/automation/appium/share-test-report.png">

To manage your test report link, select the Share button again. This will give you access to the link as well as an option to un-share the test report.



