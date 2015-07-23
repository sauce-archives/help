---
title: Quality Report
layout: en
permalink: docs/testing-tools/quality-report/
---

<li><a href="#introduction">Introduction</a></li>
<li><a href="#install-launch">Install&Launch</a></li>
<li><a href="#stress-test">Stress Test</a></li>
<li><a href="#screenshot">Screenshots</a></li>
<li><a href="#process-5-steps-to-sanity">Process: 5 Steps to Sanity</a></li>
<li><a href="#faq">Quality Report - FAQ</a></li>

<h3 id="introduction">Introduction</h3>
We know mobile app testing can be complex and time consuming. This is why we provide a simple and fast solution to check the functionality of your app, called the Quality Report. The Quality Report automatically runs multiple tests of your app and displays the results clearly on the dashboard. You can also share the results via a link or download the files. Tests included in the Quality Report are:

<ul>
<li><b>Install & Launch:</b> See if your app launches properly on different devices.</li>
<li><b>Stress Tests:</b> Check if your app can handle thousands of random inputs.</li>
<li><b>Screenshots:</b> Get an overview of how your app looks on different devices.</li>
</ul>

The Quality Report is best suited to test the basic functionality of your app on dozens of devices simultaneously with almost no effort. Your users will love your improved app!

<img class="left shadow" src="/img/tools/quality-report/screenshot-quality-report.png" alt="Dashboard Quality Report">


<h3 id="install-launch">Install & Launch</h3>
We install your application on the TestObject devices to see if it launches properly. If we find an issue, we will flag the respective device.


<h3 id="stress-test">Stress Test</h3>
We simulate random user inputs until an exception is thrown. Our Stress Test is using the MonkeyExerciser from Google to execute random clicks within your app. Spot check the error flag and the exception messages for critical issues.


<h3 id="screenshots">Screenshots</h3>
TestObject takes screenshots of different activities within your app. Using the screenhot test, you can get a quick overview on how your app looks on different devices. After the screenshots are taken, you can review them and open bugs if somethings not right.


<h3 id="process-5-steps-to-sanity">Process: 5 Steps to Sanity</h3>
Running the Quality Report is pretty easy.

<b>1. Upload:</b> Upload your app or use the provided sample app and create a project.

<b>2. First test:</b> Navigate to the green "Quality Report" tab and hit the "Create Report" button.

<b>3. Select devices:</b> Now, you can select the devices you want to run the tests on. Click the "Run" button.

<b>4. Results:</b> It will take 15 to 45 minutes until your results are ready. We will notify you by email when the tests are done. You will have an overview of all potential problems on the dashboard. Review the results and error messages and open a bug if somethings not right. You can also share your report with colleagues via a link or download the report, including all log files.

<b>5. Re-run:</b> Select other devices and run a new Quality Report or upload a new version of your app and see if it can handle the stress this time.

<h3 id="faq">Quality Report - FAQ</h3>

<h5> Q: What kind of bugs will I find?</h5>
A: There is a long list of potential problems that can be discovered either with the Install&Launch or the Stress Test. The most common problems are NullPointerExceptions, OutOfBoundExceptions, InsufficientStorage- and OutOfMemoryExceptions.


<h5> Q: What is the difference between "ERRORS" and "BUGS" in the Quality Report?</h5>
A: "ERRORS" are problems that we found automatically while running the Install&Launch and Stress test. They're good indicators for potential problems. "BUGS" on the other hand, can only be opened by yourself. In case we found an error, you can review it and decide if it can be ignored or if it is a real problem and open a bug for it.

<h5>Q: My app requires a login, and the Stress Test can't get through.</h5>
A: Currently, we don't provide a solution for this. The MonkeyRunner can't pass a login screen at the moment. If you want to perform a Stress Test anyway, you can do so in the manual testing feature. Go to manual, select a device, manually login to your app, and then select the MonkeyRunner feature in the left menu.
