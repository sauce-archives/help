---
title: Execution Reports
layout: en
permalink: docs/testing-tools/automation/reporting/
---



<li><a href="#introduction">Introduction</a></li>
<li><a href="#aggregated-results">Aggregated Results of an Entire Test Suite</a></li>
<li><a href="#share-link">Sharing via Link</a></li>
<li><a href="#download-zip">Download as ZIP</a></li>
<li><a href="#results-per-device">Results per Device</a></li>
<li><a href="#results-per-test">Results per Test</a></li>
<li><a href="#individual-execution">Individual Test Execution Results</a></li>
<li><a href="#issue-tracking">Issue Tracking</a></li>

<br>

<center>
<iframe width="750" height="422" style="margin-bottom: 20px" src="https://www.youtube.com/embed/TEMs3DtyQxg" frameborder="0" allowfullscreen></iframe>
</center>



<h3 id="introduction">Introduction</h3>

Extensive reports allow you to easily browse through all the test results. Quickly find out which executions failed and which devices cause most trouble. All logs, videos capturing the test runs and screenshots are provided. Share the report with your colleagues, create issues and send them to your issue tracker.



<h3 id="aggregated-results">Aggregated Results of an Entire Test Suite</h3>

For each execution of a test suite you will get an aggregated overview of all the results. Search the results and filter them by status.

There are three representations:

* Results by device
* Results by test
* All screenshots

<img class="shadow" src="/img/tools/reporting/automation-report.png">
<img class="shadow" src="/img/tools/reporting/automation-report-tests.png">
<img class="shadow" src="/img/tools/reporting/automation-report-screenshots.png">



<h3 id="share-link">Sharing via Link</h3>

In order to share the report with others, simply create a public link.

<img class="shadow zoom" src="/img/tools/reporting/share-report-private.png">
<img class="shadow zoom" src="/img/tools/reporting/share-report-link.png">



<h3 id="download-zip">Download as ZIP</h3>

All logs, full-resolution screenshots and execution videos of all the individual test executions can be downloaded as a combined ZIP file.



<h3 id="results-per-device">Results per Device</h3>

Here you can find the results of all tests that were executed on a specific device. To jump to the next device, simply use your keyboard's left/right arrow keys.

<img class="shadow" src="/img/tools/reporting/automation-report-results-per-device.png">



<h3 id="results-per-test">Results per Test</h3>

Here you can find the results of the executions of one test on all the devices you had selected. To jump to the next test, simply use your keyboard's left/right arrow keys.

<img class="shadow" src="/img/tools/reporting/automation-report-results-per-test.png">



<h3 id="individual-execution">Individual Test Execution Results</h3>

This screen provides you with all the details of a single test method execution on a specific device. It includes:

* General info about the test status, the app under test and the device
* Error message and stack trace, in case an exception was thrown
* Screenshots, if you had specified to take any
* Video capturing the exection of this test method
* Device log, which you can search, filter and download
* Appium log, if you were using the Appium framework

<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-info.png">
<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-error.png">
<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-screenshots.png">
<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-video.png">
<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-log.png">



<h3 id="issue-tracking">Issue Tracking</h3>

Tracking issues with your app is easy. Open a new issue directly from the report. If you had connected with an external issue tracker (GitHub or JIRA), the issue will be automatically transferred.

<img class="shadow" src="/img/tools/reporting/automation-report-individual-execution-issue-error.png">
