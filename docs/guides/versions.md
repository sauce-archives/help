---
title: Tests on different Android versions
layout: en
permalink: docs/guides/versions/
---

When creating a test, we would of course like to run it on all of our app's supported android versions.

Sometimes, though, tests seem to fail (or display warnings) when they are replayed on a device with a different android version than the one they were recorded on.


[When this issue appears, it's usually when switching between newer versions (4.&#42;) and older ones (2.&#42;)]

What you need:

+ A recorded test with issues on different android versions - read more on how to [Running a Test on Multiple Devices](/docs/getting-started/batches/ "Running a Test on Multiple Devices")


### Step 0: Before we look at the solution

Let's understand the problem.

+ Android comes with a lot of basic UI elements for the developers to use (e.g menus, popup messages, buttons, fonts, etc.),
and naturally, these elements are sometimes redesigned or changed with the release of a new version.   
A major makeover has been made between the 2.&#42; versions and 4.&#42;, and that's why the transition between these two is prone to issues.  

+ Sometomes, different layouts or images are displayed depending on the android version.  
This might and might not be considered an issue (as it could be the developer's purpose), but it's still important to take into consideration.


#### Example 1: Font difference
Here we see the same 'Sign Up' button from the Twitter app,  
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
This will result usually with a warning:  

<img class="center shadow" src="/img/guides/versions/versions-03.png">

#### Example 2: Native icons difference

Here we see the same 'Info' icon from the native android menu in the Twitter app,  
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

In this case, the icon looks quite different, 
so this will lead to an error: 

<img class="center shadow" src="/img/guides/versions/versions-06.png">

#### Example 3: Different image selection

Here we see the same (non native) button,  
as rendered in 2 different Android versions:     

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

In this case, the button looks quite different, 
so this will lead to an error.  

--


### Step 1: Record a test

This guide assumes that you are familliar with [Creating tests](/docs/getting-started/first-test/ "First test"), [Using the recorder](/docs/getting-started/recorder/ "Recorder") and [Running tests on Multiple Devices](/docs/getting-started/batches/ "Running a Test on Multiple Devices").  

We will use the Twitter app to see how to face the issues listed above.  
We uploaded the app, and recorded the following simple test:  

<img class="center shadow" src="/img/guides/versions/versions-11.png">  



### Step 2: Create a batch

The batch should include more than one android versions.  
In our example we will use Android 2.3.3 and Android 4.1:

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


### Step 3: Run the batch 

We ran the batch, and got these results:  

<img class="center shadow" src="/img/guides/versions/versions-14.png">  

It passes on 4.1 and fails on 2.3.3, not surprisingly, by encountering the issues we mentioned above:

1) A fuzzy image match because of the font:  

<img class="center shadow" src="/img/guides/versions/versions-15.png"> 

2) An error because of the icon:  

<img class="center shadow" src="/img/guides/versions/versions-16.png"> 


### Step 4: Fix it

#### Option 1: Fine tune the match  

A lot of 'close calls', meaning, images that look similar, but yield warnings or even errors, could be fixed  
by [fine-tuning the match](/docs/guides/image-matching/#fine-tune-matching "Fine-tune Matching").

#### Option 1: Cherry picking (using find())








