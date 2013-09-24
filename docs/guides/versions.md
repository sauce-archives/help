---
title: Testing Different Android Versions
layout: en
permalink: docs/guides/android-versions/
alias: docs/guides/versions/
---

When creating a test, we would like to run it on all of our app's supported android versions.

Sometimes, though, tests seem to fail (or display warnings) when they are replayed on a device with a different android version than the one they were recorded on.

This issue usually appears when switching between newer versions (4.&#42;) and older ones (2.&#42;)

This guide will be in the form of problem and solution, and not step by step.
If you are already familiar with the problem, you can just skip to the [solution](#solution).

### Problem description 

+ Android comes with a lot of basic UI elements for developers to use (e.g menus, popup messages, buttons, fonts, etc.).
These elements are sometimes redesigned or changed with the release of a new version.   
A major makeover has been made between the 2.&#42; versions and 4.&#42;, and that's why the transition between these two is prone to issues.  

+ Sometimes, different layouts or images are displayed differently depending on the android version they are running on.
This might not be considered an issue (as it could be the developer's intention), but it's still important enough to take into consideration.


#### Example 1: Font difference
Here we see the same 'Sign Up' button of the Twitter app
as displayed on 2 different Android versions:  

<table class="table versions-table" align="center">
	<thead>
		<tr>
			<th>Android 2.3.3 (api 10)</th>
			<th>Android 4.1 (api 16)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img class="center shadow" src="/img/guides/versions/versions-01.png"></td>
			<td><img class="center shadow" src="/img/guides/versions/versions-02.png"></td>
		</tr>
	</tbody>
</table>

The font is similar, but not the same.
This will usually result with a warning:  

<img class="center shadow" src="/img/guides/versions/versions-03.png">

#### Example 2: Native icons difference

Here we see the same 'About' icon of the native android menu in the Twitter app
as displayed on 2 different Android versions:  

<table class="table versions-table" align="center">
	<thead>
		<tr>
			<th>Android 2.3.3 (api 10)</th>
			<th>Android 4.1 (api 16)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img class="center shadow" src="/img/guides/versions/versions-04.png"></td>
			<td><img class="center shadow" src="/img/guides/versions/versions-05.png"></td>
		</tr>
	</tbody>
</table>

In this case, the icons look quite different
and it will lead to an error: 

<img class="center shadow" src="/img/guides/versions/versions-06.png">

#### Example 3: Different image selection

Here we see the same (non native) button
being rendered in 2 different Android versions:     

<table class="table versions-table" align="center">
	<thead>
		<tr>
			<th>Android 2.3.3 (api 10)</th>
			<th>Android 4.1 (api 16)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img class="center shadow" src="/img/guides/versions/versions-07.png"></td>
			<td><img class="center shadow" src="/img/guides/versions/versions-08.png"></td>
		</tr>
	</tbody>
</table>

In this case, the buttons look quite different
and this will lead to an error.  


<h3 id="solution"> Solution </h3>

We assume that you are familliar with [Creating tests](/docs/getting-started/first-test/ "First test"), [Using the recorder](/docs/getting-started/recorder/ "Recorder") and [Running tests on Multiple Devices](/docs/getting-started/batches/ "Running a Test on Multiple Devices").  

We will use the Twitter app to see how to face the issues listed above.  

### Quick overview

#### Upload the app
We uploaded the app, and recorded the following simple test:  

<img class="center shadow" src="/img/guides/versions/versions-11.png">  

#### Create and run a batch

We created a batch which includes more than one android version.  

<table class="table versions-table" align="center">
	<tbody>
		<tr>
			<td>
				<img class="center shadow" src="/img/guides/versions/versions-12.png">
			</td>
			<td>
				<img class="center shadow" src="/img/guides/versions/versions-13.png">
			</td>
		</tr>
	</tbody>
</table>  

We ran the batch, and got these results:  

<img class="center shadow" src="/img/guides/versions/versions-14.png">  

It passes on 4.1 and fails on 2.3.3, encountering the issues we mentioned above:

1. A fuzzy image match because of the font:  <img class="center shadow" src="/img/guides/versions/versions-15.png"> 

2. An error because of the icon:  <img class="center shadow" src="/img/guides/versions/versions-16.png"> 


### Fix it

#### Option 1: Fine tune the match  

A lot of 'close calls', i.e images that look similar but yield errors on replay, could be fixed by [fine-tuning the match](/docs/guides/image-matching/#fine-tune-matching "Fine-tune Matching").  

#### Option 2: Cherry picking by using find()  

We will use the [find()](/docs/api/locator/#find "find()") function to allow slightly different locators to pass.  
Briefly, [find()](/docs/api/locator/#find "find()") allows us to check if a locator exists on the screen and store the result in a variable (as opposed to [waitAppear()](/docs/api/locator/#waitAppear "waitAppear()") which will just fail the test if the locator was not found).  
This gives us the possibility to make decisions based on the [find()](/docs/api/locator/#find "find()") result.

####So lets fix it

For each Android version we need to add a specific find() case.  
In our situation, we have 2 cases: one for Android 4.1 and one for Android 2.3.3.  
#### We'll start with Android 4.1.  

Go to the desired test Settings: 

<img class="center shadow" src="/img/guides/versions/versions-17.png">   

Select Android 4.1 as the active device:  

<img class="center shadow" src="/img/guides/versions/versions-13.png"> 

And save: 

<img class="center shadow" src="/img/guides/versions/versions-18.png"> 

Go to the recorder, replay the test and stop the replay before the problematic step.  
(You can also manually click through the app to get to the desired state).

<img class="center shadow" src="/img/guides/versions/versions-19.png"> 

Start the recording:

<img class="center shadow" src="/img/guides/versions/versions-20.png"> 


Click on [find()](/docs/api/locator/#find "find()") in the Operations bar (Locator -> find()):

<img class="center shadow" src="/img/guides/versions/versions-21.png"> 

In the find() dialog, select the locator which you want to find:

<img class="center shadow" src="/img/guides/versions/versions-22a.png"> 

And click 'Done'.  
Our new script now looks like this:

<img class="center shadow" src="/img/guides/versions/versions-23.png"> 

We can now use this find() statement to make a condition:

<img class="center shadow" src="/img/guides/versions/versions-24.png"> 

We can now do a similar process for our second problematic case.  
Now our script looks something like this:  

<img class="center shadow" src="/img/guides/versions/versions-25.png"> 

#### Now for Android 2.3.3

Let's change the active device to Android 2.3.3 (Test list -> Test settings):

<img class="center shadow" src="/img/guides/versions/versions-12.png"> 

Now we repeat the same process and our final script will look like this:

<img class="center shadow" src="/img/guides/versions/versions-26.png">   

We added the 'else' cases to the 'if' statements to make the script follow this simple logic:  

If you find the button from Android 2.3.3, then click on it.  
<b>Else</b>, if you find the button from Android 4.1, click on it.    
<b>Else</b>, fail the replay.   


And if we run the batch again:

<img class="center shadow" src="/img/guides/versions/versions-27.png"> 

### To conclude

Different android versions sometimes display elements in a differently, e.g native elements, fonts, icons, etc'.  
To overcome this, we can:  

+ [fine-tune](/docs/guides/image-matching/#fine-tune-matching "Fine-tune Matching")  the match.  
+ Identify and treat each case using [find()](/docs/api/locator/#find "find()").    


While this requires some attention to small details and a bit of work, when you get to know the common differences between versions, 
finding and solving these issues becomes less of a problem.  





















