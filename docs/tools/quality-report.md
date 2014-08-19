---
title: Quality Report
layout: en
permalink: docs/testing-tools/quality-report/
---

<li><a href="#introduction">Introduction</a></li>
<li><a href="#install-launch">Install&Launch</a></li>
<li><a href="#stress-test">Stress Test</a></li>
<li><a href="#process-5-steps-to-sanity">Process: 5 Steps to Sanity</a></li>
<li><a href="#faq">Quality Report - FAQ</a></li>

<h3 id="introduction">Introduction</h3>
We know mobile app testing can be complex and time consuming. This is why we provide a simple and fast solution to check the functionality of your app, called the Quality Report. The Quality Report automatically runs multiple tests of your app and displays the results clearly on the dashboard. You can also share the results via a link or download the files. Tests included in the Quality Report are:

<ul> 
<li> <b>Install&Launch</b> to see if your app launches properly on different devices</li>
<li> <b>Stress Tests</b> to see if your app can handle thousands of random inputs</li>
</ul>

The Quality Report is the best solution to test the basic functionality of your app on dozens of devices simultaneously with almost no effort. Your users will love your improved app!

<img class="left shadow" src="/img/tools/quality-report/quality-report-dashboard.png" alt="Dashboard Quality Report">

<h3 id="install-launch">Install&Launch</h3>
We take screenshots of your app on various phones. We install and launch your application on a number of different devices with various resolutions and sizes. After the screenshots are taken, you can review them to decide if the layout of your application looks good or needs improvements.

<h3 id="stress-test">Stress Test</h3>
We simulate random user inputs until an exception is thrown. Our Stress Test is using the MonkeyExerciser from Google to execute random clicks within your app. Spot check the exception messages for critical issues.

<h3 id="process-5-steps-to-sanity">Process: 5 Steps to Sanity</h3>
Running the Quality Report is pretty easy.

<b>1. Upload:</b> Upload your app or use the provided sample app and create a project.

<b>2. First test:</b> Navigate to the green "Quality Report" tab and hit the "Create Report" button.

<b>3. Select devices:</b> Now, you can select the devices you want to run the tests on. For each device, we will subtract 3 minutes from your account. Click the "Run" button.

<b>4. Results:</b> It will take about 15 minutes until your results are ready, and we will notify you by email. You will have an overview of all potential problems on the dashboard. Open a single device for details and logs. You can also share your report with colleagues via a link or download the report, including all log files.

<b>5. Re-run:</b> Select other devices and run a new Quality Report or upload a new version of your app and see if it can handle the stress this time.

<img class="left shadow" src="/img/tools/quality-report/quality-report-menu.png" alt="Quality Report Menu">

<h3 id="faq">Quality Report - FAQ</h3>
<p>
<h5> Q: What kind of bugs will I find?</h5> 
A: There is a long list of potential problems that can be discovered either with the Install & Launch or the Stress Test. The most common problems are NullPointerExceptions, OutOfBoundExceptions, InsufficientStorage- and OutOfMemoryExceptions. 
</p>

<h5> Q: What does the "Success Rate" in the PDF report imply?</h5> 
A: The success rate is the percentage of all tests that succesfully passed. For example, if you selected 10 devices for the Quality Report, we will perform 20 tests (10x Install & Launch and 10x Stress Tests). If your app crashes during one Stress Test, and one test is marked as failed in the Install & Launch section, 2 out of 20 tests failed. Thus, the success rate will be 90%.

<img class="left shadow" src="/img/tools/quality-report/quality-report-success-rate.png" alt="Success Rate">

<h5> Q: Why do I only get one screenshot in the Install & Launch tests?</h5>
A: The primary focus of the Install & Launch test is to check if your app launches properly. Therefore, we only take a screenshot of the first screen. If you want to have more screenshots, we recommend to use the automation tool and upload a script that takes screenshots from different activities.

<h5>Q: My app requires a login, and the Stress Test can't get through.</h5>
A: Currently, we don't provide a solution for this. The MonkeyRunner can't pass a login screen at the moment. If you want to perform a Stress Test anyway, you can do so in the manual testing feature. Go to manual, select a device, manually login to your app, and then select the MonkeyRunner feature in the left menu. 

<h5>Q: When is an Install & Launch test marked as failed?</h5>
A: By default, we do not mark any Install & Launch test as failed. We leave it up to you to review the screenshots and decide if it looks good or not. Only when you explicitly mark a test as failed will it be shown as an error in the results.



