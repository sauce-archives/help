---
title: Quality Report
layout: en
permalink: docs/tools/automated-testing/quality-report/
---

* [What is a Quality Report?](#introduction)
* [Install & Launch Test](#install-launch)
* [Stress Test](#stress-test)
* [Screenshots Test](#screenshots-test)
* [Run a Quality Report](#run-a-quality-report)
* [Quality Report FAQs](/docs/testing-tools/automated-testing/quality-report-faq/)


<h3 id="introduction">What is Quality Report?</h3>

<br>

<center>
<iframe width="100%" height="422" class="shadow" style="margin-bottom: 20px" src="https://www.youtube.com/embed/j06spPKaRy4" frameborder="0" allowfullscreen></iframe>
</center>

We know mobile app testing can be complex and time consuming. This is why we provide a simple and fast solution to check the functionality of your app, called the Quality Report. The Quality Report automatically runs multiple tests of your app and displays the results clearly on the dashboard. You can also share the results via a link or download the files. Tests included in the Quality Report are:


* **Install & Launch:** See if your app launches properly on different devices.
* **Stress Tests:** Check if your app can handle thousands of random inputs.
* **Screenshots:** Get an overview of how your app looks on different devices.


The Quality Report is best suited to test the basic functionality of your app on dozens of devices simultaneously with almost no effort. Your users will love your improved app!

<img class="left shadow" src="/img/tools/quality-report/screenshot-quality-report.png" alt="Dashboard Quality Report">


<h3 id="install-launch">Install & Launch Test</h3>
We install your application on the TestObject devices to see if it launches properly. If we find an issue, we will flag the respective device.


<h3 id="stress-test">Stress Test</h3>
We simulate random user inputs until an exception is thrown. Our Stress Test is using the MonkeyExerciser from Google to execute random clicks within your app. Spot check the error flag and the exception messages for critical issues.


<h3 id="screenshots-test">Screenshots Test</h3>
TestObject takes screenshots of different activities within your app. Using the screenshot test, you can get a quick overview on how your app looks on different devices. After the screenshots are taken, you can review them and open bugs if somethings not right.

<h3 id="run-a-quality-report">Run a Quality Report</h4>

Running the Quality Report is pretty easy.

1. <b>Upload:</b> Upload your app or use the provided sample app and create a project.<br>
2. <b>First test:</b> Navigate to the green "Quality Report" tab and hit the "Run Tests" button.<br>
3. <b>Select devices:</b> Now, you can select the devices you want to run the tests on. Click the "Run" button.<br>
4. <b>Results:</b> It will take 15 to 45 minutes until your results are ready. We will notify you by email when the tests are done. You will have an overview of all potential problems on the dashboard. Review the results and error messages and open a bug if somethings not right. You can also share your report with colleagues via a link or download the report, including all log files.<br>
5. <b>Re-run:</b> Select other devices and run a new Quality Report or upload a new version of your app and see if it can handle the stress this time.<br>

#####The Quality Report feature is only available with an automated testing plan. [Learn more](/docs/general-reference/managing-your-account/#pre_plans).

<h3 id="gradle-plugin">Gradle Plugin</h3>

If you're using Gradle, you may use our <a href="https://github.com/testobject/testobject-quality-report-gradle-plugin" target="_blank">Quality Report Gradle plugin</a> to start your Quality Reports.

***
***
***
***
***
***
***
***
***
