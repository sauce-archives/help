---
title: Running Your First Test
layout: en
permalink: docs/getting-started/first-test/
alias: [docs/guides/getting-started/, wiki/display/cf/Getting+Started+Tutorial/index.html]
---

Welcome to TestObject! Get ready to create and run your first mobile app test in 5 easy steps!<br>
In this tutorial we will walk you through the steps to write and run your first automated GUI test.

What you need:

<ul>
	<li>A web browser</li>
	<li>An app (*.apk file) - <a href="https://docs.google.com/file/d/0ByR0JcAYUAoWdS1faUNJdGxONzg/edit?usp=sharing" target="_blank" rel="nofollow">download a sample app here</a></li>
	<li>A free <a href="http://app.testobject.com/signup" target="_blank">TestObject account</a></li>
	<li>5 minutes</li>
</ul>

Let's get started!

<p style="text-align: center;"> Tired of reading? Check out CONTINUOUS in action!</p>

<p style="text-align: center;">
	<iframe class="youtube-player" type="text/html" style="width: 400px; height: 300px" src="http://www.youtube.com/embed/EIiBSECA4ZE" frameborder="0"></iframe>
</p>

<blockquote>TestObject CONTINUOUS, an automated testing solution, offers a cloud infrastructure for mobile app testing that is accessible from any web browser. CONTINUOUS allows you to easily upload any app to your own testing account, record tests, add assertions and run those tests on multiple devices. In order to start and use CONTINUOUS you first need to create a free account.</blockquote>




<h3 id="project">Step 1: Create a New Project</h3>

After <a href="http://app.testobject.com/signup" target="_blank">signing in</a> to your TestObject account, click the *New Project* button to create your first project.

<img src="/img/getting-started/first-test/first-test-01.png">

Name the project "MyProject" and click *Save*.

<img class="center shadow" src="/img/getting-started/first-test/first-test-02.png">

Your newly created project will then be opened for you.




<h3 id="app">Step 2: Upload Your App</h3>

After having created the project you will be shown the screen to manage versions of your app.

Click the *New Version* button to add a version of your app which you would like to test.

<img class="center shadow" src="/img/getting-started/first-test/first-test-03.png">

Choose whether you are going to test a native Android app or a web app (website). In this tutorial we will test a native app.

<img class="center shadow" src="/img/getting-started/first-test/first-test-04.png">

On the next screen, click *Choose APK File* and browse for the app file you want to upload to the system. In our case, use the <a href="https://docs.google.com/file/d/0ByR0JcAYUAoWdS1faUNJdGxONzg/edit?usp=sharing" target="_blank" rel="nofollow">sample app here</a>.<br>
Name your app "My App 1.0" and click *Save*.

<img class="center shadow" src="/img/getting-started/first-test/first-test-05.png">

You will then see the newly uploaded app in the list. It will be marked as "active". Per project you can have one active app version which is going to be used for testing.

<img class="center shadow" src="/img/getting-started/first-test/first-test-06.png">




<h3 id="record">Step 3: Record Your First Test</h3>

Now switch to the *Tests* tab and click *New Test* to set up your first test.

<img class="center shadow" src="/img/getting-started/first-test/first-test-07.png">

Name your test "My first test" and, if you like, select a label for it.<br>
Then choose a device to record your test on and click *Continue*.

<img class="center shadow" src="/img/getting-started/first-test/first-test-08.png">

You will then see the TestObject Recorder. The device that had been selected before will now be booted and your app will be installed on it.

<img class="center shadow" src="/img/getting-started/first-test/first-test-09.png">

As soon as your app has launched, you are ready to start recording. To do so click the *Record* button. Each action you execute on the device will now be added as a line in the script on the right side.

<img src="/img/getting-started/recorder/recorder-02.png">

In the sample app click 'Continue' and notice that for the click action a new script line is generated.<br>
Now click *Stop* to leave the recording mode.

<img class="center shadow" src="/img/getting-started/first-test/first-test-10.png">




<h3 id="replay">Step 4: Replay the Test</h3>

In the recorder you can immediately check how your test runs on the device. Click the *Replay* button to run your test.

<img src="/img/getting-started/recorder/recorder-11.png">

The recorded test will then be replayed automatically on the device.

<img class="center shadow" src="/img/getting-started/first-test/first-test-11.png">

Congratulations, you have successfully recorded and replayed a test for your app. Good for you!




<h3 id="replay">Step 5: Create and Run a Batch of Tests</h3>

Leave the replay mode by clicking the close icon.

<img src="/img/getting-started/recorder/recorder-15.png">

Then click *Done* to close the recorder.

<img src="/img/getting-started/first-test/first-test-12.png">

Select the tests that you would like to run.

<img class="center shadow" src="/img/getting-started/first-test/first-test-13.png">

Then click the batch button to create a batch for those tests.

<img src="/img/getting-started/first-test/first-test-14.png">

Name your new batch "My first batch". You can then configure an interval in which all tests in this batch will be automatically run. In our case, we set it to *Manually*. Below you will see a list of the tests to include in this batch.

<img class="center shadow" src="/img/getting-started/first-test/first-test-15.png">

Then select one or multiple devices that you would like to run your tests on and, in case your app requires an internet connection, choose a network speed.

<img class="center shadow" src="/img/getting-started/first-test/first-test-16.png">

If you like, you can choose to be notified about test failures via email. Then click *Continue*.

You will then see a list of all your batches. Click the play button to run your newly created batch.

<img class="center shadow" src="/img/getting-started/first-test/first-test-18.png">

The tests will then be run as specified in your batch. When a test run finished, you can open a detailed report to see the results.

<img class="center shadow" src="/img/getting-started/first-test/first-test-19.png">

The reports looks like the following.

<img class="center shadow" src="/img/getting-started/first-test/first-test-20.png">




<h3 id="next">What's next?</h3>

To learn more about some advanced functionalities have a look at how to <a href="/docs/guides/recorder">get started with the recorder...</a>

Remember: TestObject CONTINUOUS is made for **continuous integration** and will reach it's fullest potential as a continuous testing solution in the tool chain of your agile development process.
