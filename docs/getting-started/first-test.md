---
title: Creating and Running Your First Test
layout: en
permalink: docs/getting-started/first-test/
alias: [docs/guides/getting-started/, wiki/display/cf/Getting+Started+Tutorial/index.html]
---

Welcome to TestObject! Get ready to create and run your first mobile app test in 3 easy steps!<br>
In this tutorial we will walk you through the steps to write and run your first automated GUI test.

What you need:

<ul>
	<li>A web browser</li>
	<li>An app (*.apk file) - <a href="https://docs.google.com/file/d/0ByR0JcAYUAoWdS1faUNJdGxONzg/edit?usp=sharing" class="external-link" rel="nofollow">download a sample app here</a></li>
	<li>5 minutes</li>
</ul>

Let's get started!

<p style="text-align: center;"> Tired of reading? Check out CONTINUOUS in action!</span></p>

<p style="text-align: center;">
	<iframe class="youtube-player" type="text/html" style="width: 400px; height: 300px" src="http://www.youtube.com/embed/EIiBSECA4ZE" frameborder="0"></iframe>
</p>


<h3 id="GettingStartedTutorial-Step1%3ACreateanaccount">Step 1: Create an Account</h3>
		
<a href="http://app.testobject.com/signup" target="_blank">Create a free account</a> for TestObject or, in case you already have one, <a href="http://app.testobject.com/signup" target="_blank">login to TestObject</a>.

<blockquote>TestObject CONTINUOUS, an automated testing solution, offers a cloud infrastructure for mobile app testing that is accessible from any web browser. CONTINUOUS allows you to easily upload any app to your own testing account, record tests, add assertions and run those tests on multiple devices. In order to start and use CONTINUOUS you first need to create a free account.</blockquote>

To sign up, fill in your name and email address, select a username and password and then click <em>Create my account</em>. In the following minutes you will receive a registration confirmation email. Once you get it you are good to go.
		
<img class="center" src="/img/guides/getting-started//Screen%20Shot%202013-05-23%20at%202.02.53%20PM.png">
		

<h3 id="GettingStartedTutorial-Step2%3ACreateanewProject">Step 2: Create a New Project</h3>
		
After <a href="http://app.testobject.com/login">signing in</a> to your account, click <strong>New Project</strong> to create your first project.<br>
Name the project "MyProject" and click <em>Save</em>.

Choose whether you are going to test a native Android app or a web app (website). In this tutorial we will test a native app.

On the next screen, click <em>Choose APK File</em> and browse for the app file you want to upload to the system. In our case, use the sample app.<br>
Name your application "MyApp" and click <em>Save</em>.

<img class="center" src="/img/guides/getting-started/Screenshot_2.png?version=1&amp;modificationDate=1375315365013&amp;api=v2&amp;effects=drop-shadow">


<h3 id="GettingStartedTutorial-Step3%3ARecordyourfirsttest">Step 3: Record Your First Test</h3>
			
Click <em>New Test</em> to set up your first test.

<img class="center" src="/img/guides/getting-started/Screenshot_3.png?version=1&amp;modificationDate=1375315645757&amp;api=v2&amp;effects=drop-shadow">

Name your test "My First Test". You can also select a label for your test, if you like.<br>
Then choose a device to record your test on and click <em>Continue</em>. You will then see the TestObject CONTINUOUS Recorder. 

<img class="center" src="/img/guides/getting-started/Screenshot_4.png?version=1&amp;modificationDate=1375315801010&amp;api=v2&amp;effects=drop-shadow">

After the sample app has loaded on the device, you are ready to start recording. To do so click <em>Record</em>. Each action executed by the user will then be added as a line in the script.
			
In the sample app click 'Continue' and notice that for the click action a new line is generated in the script on the right side.<br>
Now click <em>Stop</em> to leave the recording mode and then <em>Replay</em> to run your test.

Congratulations, you have successfully recorded and replayed a test for your app. Good for you!


<h3 id="GettingStartedTutorial-What%E2%80%99snext%3F">What's next?</h3>

If you want to try out some more advanced functionalities, read more on <a href="/docs/guides/recorder">Using the Recorder...</a>

You might as well want to

* Upload a new version of my app
* Run a test on multiple devices
* Check the reports

Remember: TestObject CONTINUOUS is made for **continuous integration** and will reach it's fullest potential as a continuous testing solution in the tool chain of your agile development process.
