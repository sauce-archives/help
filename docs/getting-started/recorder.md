---
title: Using the Recorder
layout: en
permalink: docs/getting-started/recorder/
---

In this tutorial we will walk you through the different components of the CONTINUOUS Recorder.


What you need:

<ul>
	<li>A web browser</li>
	<li>A free <a href="http://app.testobject.com/signup" target="_blank">TestObject account</a></li>
	<li>An app (*.apk file) - <a href="https://docs.google.com/file/d/0ByR0JcAYUAoWdS1faUNJdGxONzg/edit?usp=sharing" target="_blank" rel="nofollow">download a sample app here</a></li>
	<li>15 minutes</li>
</ul>


Let's have a look at what the recorder looks like:

<img src="/img/getting-started/recorder/recorder-01.png" class="center">

... and now let's get started.




<h3>Step 1: Start Recording</h3>

On the right above the editor you will find the recorder controls to enable the recording or replay mode. To record your first test, hit <em>Record</em>.

<img src="/img/getting-started/recorder/recorder-02.png">




<h3>Step 2: Use Your App</h3>

In the middle of the screen you'll find the testing device. It gives you access to the emulator which had been selected when creating the new test. You can use it just as a user of your app would.

When recording is enabled the actions you perform on the device are recorded. This means, the respective steps are added to the script on the right side of the screen.

If you are using our sample app, click on the 'Continue' button and notice the step that gets added to the script as a new line.




<h3>Step 3: Adjust Locator</h3>

Now try out adjusting your newly created step by clicking the settings icon in the respective script line.

<img src="/img/getting-started/recorder/recorder-03.png">

This will open the settings dialog. In the <em>Adjust Locator</em> tab you can modify the locator. Just enable either the <em>Move and Resize</em> or the <em>Draw New</em> mode. In order to set the precise click position use the <em>Set Offset</em> mode. This will set the click coordinates relative to the locator box. Alternatively, you can also switch the <em>click strategy</em> to <em>click on position</em> to click on an absolute position on the screen.

<img src="/img/getting-started/recorder/recorder-04.png" class="center shadow">

See the recorder guide for more details about <a href="/docs/guides/recorder/action-settings#locator">adjusting locators</a>.




<h3>Step 4: Set Timeout</h3>

In the <em>Set Timeout</em> tab you can specify how long the system should look for your locator on the screen. The timeout is the maximum amount of time it will try matching the locator.

<img src="/img/getting-started/recorder/recorder-05.png">

See the recorder guide for more details about <a href="/docs/guides/recorder/action-settings#timeout">setting the timeout</a>.




<h3>Step 5: Fine-tune Matching</h3>

In the <em>Fine-tune Matching</em> tab you can adjust the sensitivity of the image matcher. With a high value the locator must always look very similar and appear in the same position on the screen. With a low value both can deviate more from the original. Adjusting the matching precision is usually very handy when a warning or an error occurs during replay.

See the recorder guide for more details about <a href="/docs/guides/recorder/action-settings#matching">fine-tuning the matching</a>.

Now click <em>Save</em> to close the dialog. Notice how the line has been updated in the script.




<h3>Step 6: Add Assertions</h3>

In most test cases you don't only want to validate the click execution but also check the presence of some graphical elements. With assertions you can make sure that certain elements vanish from or appear on the screen. To add assertions for an action, press the plus icon in the respective script line.

<img src="/img/getting-started/recorder/recorder-06.png">

This will open the assertion builder. On the left side you'll see two devices side by side which represent your app before and after the execution of the click action. In the <em>Appearing Locators</em> tab pick elements which you expect to appear after the action was executed. The system gives you a few suggestions that you can modify in the <em>Move and Resize</em> mode. You can also draw your own locator in the <em>Draw New</em> mode.

<img src="/img/getting-started/recorder/recorder-07.png" class="center shadow">

Switch to the <em>Vanishing Locators</em> tab to pick locators that you expect to vanish after the action was performed.

See the recorder guide for more details about the <a href="/docs/guides/recorder/assertion-builder">assertion builder</a>.

Now click <em>Insert Assertions</em> to close the dialog. Notice the new lines that have been added to the script.

<img src="/img/getting-started/recorder/recorder-08.png">




<h3>Step 7: Add Sensor Actions</h3>

Input actions and assertions can also be added using the operations bar on the left side. You will then see the settings dialog from above with a screenshot of the current device screen.

The operations bar offers you additional functionalities. For example, try out the <em>Sensor</em> actions to rotate the device or set the GPS coordinates.
<img src="/img/getting-started/recorder/recorder-09.png">

More details you will find in the JavaScript API reference for <a href="/docs/api/sensor">sensor methods</a>.




<h3>Step 9: Stop Recording</h3>

Leave the recording mode by hitting <em>Stop</em>.

<img src="/img/getting-started/recorder/recorder-10.png">




<h3>Step 10: Replay Your Test</h3>

You can now replay your test. To do so press the <em>Play</em> button.

<img src="/img/getting-started/recorder/recorder-11.png">

You will then get a fresh device so that the replay starts in a clean state. The editor, the device and the operations bar are locked during the replay. You can now follow the execution of your test.

<img src="/img/getting-started/recorder/recorder-12.png">




<h3>Step 11: View Report</h3>

As soon as the replay has finished, the result is shown at the top. It includes a link to the detailed report about this replay.

<img src="/img/getting-started/recorder/recorder-13.png">

In the report, all steps executed during replay are listed. For each step two screenshots are shown. The first screenshot had been taken during the recording and the second when the step was replayed. This allows you to easily compare how your app's behavior has changed, for example, when running the test on a different Android version or on a newer version of your app.

<img src="/img/getting-started/recorder/recorder-14.png" class="center shadow">




<h3>Step 12: Exist Replay</h3>

Leave the replay mode by clicking the close icon. 

<img src="/img/getting-started/recorder/recorder-15.png">




<h3 id="next">What's next?</h3>

Run your test on different devices by <a href="/docs/getting-started/batches">creating a batch</a>.
