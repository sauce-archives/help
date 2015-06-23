---
title: Running a Test on Multiple Devices
layout: en
permalink: docs/getting-started/batches/
---

With a batch you can predefine a configuration and run a set of tests on a it. For each test run you will then get a report with all the details about the execution.

In this tutorial you will learn how to create and run a batch in 4 easy steps.

What you need:

<ul>
	<li>A web browser</li>
	<li>A <a href="http://app.testobject.com/signup" target="_blank">TestObject account</a></li>
	<li>A recorded test - read more on how to <a href="/docs/getting-started/first-test">create your first test</a></li>
	<li>3 minutes</li>
</ul>




<h3 id="select-tests">Step 1: Select the Tests to Run</h3>

Select the tests that you would like to run. You can select multiple tests. In this tutorial we will be using the test that we had created in the previous <a href="/docs/getting-started/first-test">tutorial on creating a first test</a>.

<img class="center shadow" src="/img/getting-started/batches/batches-01.png">

Then click the batch button to set up the headless test run.

<img src="/img/getting-started/batches/batches-02.png">




<h3 id="configure-batch">Step 2: Configure the Batch</h3>

A batch contains the configuration for the execution of set of tests.

Name your new batch "My first batch". Below you will see a list of tests to be included in this batch. You can then configure an interval in which all tests in this batch will be automatically run. In our case, we will trigger the execution *manually*.

<img class="center shadow" src="/img/getting-started/batches/batches-03.png">

Then select the devices that you would like to run your tests on. In addition to the preselected *Phone (Android 4.1)* select *Phone (Android 2.3.3)* as a second device. In case your app requires an internet connection, choose a network speed.

<img class="center shadow" src="/img/getting-started/batches/batches-04.png">

If you like, you can opt in to be notified about test failures via email. Then click *Save*.

<img class="center shadow" src="/img/getting-started/batches/batches-05.png">




<h3 id="run-batch">Step 3: Run the Batch</h3>

You will then see a list of batches which shows your freshly created batch. Click the play button to run it.

<img class="center shadow" src="/img/getting-started/batches/batches-06.png">

The tests will then be run as specified in your batch.




<h3 id="check-reports">Step 4: Check the Reports</h3>

After a test run has finished, you can open a detailed report to see the results. Let's open the one which contains a warning.

<img class="center shadow" src="/img/getting-started/batches/batches-07.png">

In the report, all steps executed during replay are listed. For each step two screenshots are shown. The first screenshot had been taken during the <a href="/docs/getting-started/first-test">recording</a> and the second when the step was replayed.

This allows you to easily compare how your app's behavior has changed, for example, when running the test on a different Android version or on a newer version of your app. In this case, the 'Continue' button has a different color on Android 2.3.3. In recording a device with Android 4.1 had been used.

<img class="center shadow" src="/img/getting-started/batches/batches-08.png">

In addition to that you will get the full logcat device log for the replay.

Yay! You have successfully run your test on multiple devices and analyzed the replay results.




<h3 id="next">What's next?</h3>

Learn more about some <a href="/docs/getting-started/recorder">advanced recorder functionalities</a>.
