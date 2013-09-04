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
This is the same 'Sign Up' button from the Twitter app,  
as displayed on 2 different android versions:  

<table align="center">
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

<img class="center shadow" src="/img/guides/versions/fuzzy.png">

#### Example 2: Native icons difference

#### Example 3: Different image selection



