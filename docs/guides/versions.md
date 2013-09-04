---
title: Tests on different Android versions
layout: en
permalink: docs/guides/versions/
---

When creating a test, we would of course like to run it on all of our app's supported android versions.

Sometimes, though, tests seem to fail (or display warnings) when they are replayed on a device with a different android version than the one they were recorded on.


[When this issue appears, it's usually when switching between newer versions (4.&#42;) and older ones (2.&#42;)]


This tutorial assumes you already know how to create a test - if not, please first see the [Running a Test on Multiple Devices](/docs/getting-started/first-test/ "Running a Test on Multiple Devices").


### Step 1: Create a New Dependecy
Open a project and go to the **Apps** tab. Click the **New Dependecy** button.

<img class="center shadow" src="/img/guides/dependency/dependency-01.png">

