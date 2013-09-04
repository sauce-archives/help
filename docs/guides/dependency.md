---
title: Installing a Dependency App
layout: en
permalink: docs/guides/dependencies/
---

A dependency in an app that your app requires to be installed on the device. In order to test functionalities of your app which are dependent on this second app, you can first install it as a dependency.

In this guide you will learn how to create and install a dependency. We will use the Twitter app as our example dependency.

What you need:

+ An app (*.apk file) to use as dependency
+ A recorded test - read more on how to [create your first test](http://localhost:4000/docs/getting-started/first-test/ "Running Your First Test Tutorial")




### Step 1: Create a New Dependency

Open a project and go to the *Apps* tab. Then click the *New dependency* button.

<img class="center shadow" src="/img/guides/dependency/dependency-01.png">

Choose the APK file that you want to add as dependency, give the dependency a name and press *Save*.

<img class="center shadow" src="/img/guides/dependency/dependency-02.png">

You can now see your new dependency listed under *Dependencies*. You can later on press the settings icon on the right to edit it.

<img class="center shadow" src="/img/guides/dependency/dependency-03.png">




### Step 2: Install the Dependency in a Test

Create a Test and open it. Click on **Install dependency** in the **Apps** category in the operations bar on the left.

<img class="center shadow" src="/img/guides/dependency/dependency-04.png">

The Install Dependency dialog pops up. Click on the dependency you would like to install.

<img class="center shadow" src="/img/guides/dependency/dependency-05.png">

Notice that a new [installApp() step](/docs/api/apps/#install) was added to the script. In the script the dependency is referenced to by its numerical ID.

<img class="center shadow" src="/img/guides/dependency/dependency-06.png">




### That's it!

Your dependency is now installed on the device and can be used in subsequent test steps.

<img class="center shadow" src="/img/guides/dependency/dependency-07.png">
