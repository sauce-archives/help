---
title: Installing a Dependecy App
layout: en
permalink: docs/guides/dependency/
---

If your App requires other Apps to be installed on the device in order to test its functionality, you can install a **dependecy** app.

In this tutorial you will learn how to create and install a dependecy. We will use the Twitter app as our dependecy.

This tutorial assumes you already know how to create a test - if not, please first see the [Running Your First Test Tutorial](http://localhost:4000/docs/getting-started/first-test/ "Running Your First Test Tutorial").


### Step 1: Create a New Dependecy
Open a project and go to the **Apps** tab. Click the **New Dependecy** button.

<img class="center shadow" src="/img/guides/dependency/dependency-01.png">

Choose the APK file that you want to add as a dependecy, give the dependency a name and press **Save**.

<img class="center shadow" src="/img/guides/dependency/dependency-02.png">

You can now see your new dependency listed under **Dependencies**. You can later on use the setting icon on the right to edit it.

<img class="center shadow" src="/img/guides/dependency/dependency-03.png">

### Step 2: Install the Dependecy in a Test
Create a Test and open it. Click on **Install Dependecy** in the **Apps** category in the operations bar on the left.

<img class="center shadow" src="/img/guides/dependency/dependency-04.png">

The **Install Dependency** dialog pops up. Click on the dependecy you would like to install.

<img class="center shadow" src="/img/guides/dependency/dependency-05.png">

Notice that a new [Install App](/docs/api/apps/#install) step was added to the script. In the script the dependency is referenced by its numerical id.

<img class="center shadow" src="/img/guides/dependency/dependency-06.png">

### That's it!
Your dependecy is installed on the device and can be used by your app.

<img class="center shadow" src="/img/guides/dependency/dependency-07.png">