---
title: Managing Your Apps
layout: en
permalink: docs/general-reference/managing-your-apps/
---

<ul>
	<li><a href="#prepare-your-application">Prepare Your Application</a></li>
	<li><a href="#create-new-project">Create a New Project</a></li>
	<li><a href="#app-versions">Manage App Versions</a></li>
</ul>

<!-- from faq -->
<h3 id="prepare-your-application">Prepare Your Application</h3>

To test your application on TestObject you will need to follow some guidelines when building your application. For iOS applications, you have to export your IPA file as an Ad Hoc Deployment. Check out this <a href="/docs/guides/creating-ipa/">short guide</a> on how to do it! For Android applications, you will simply need to build a debuggable version of your application.

<!-- info for whitelisting ip's -->

<h3 id="create-new-project">Create a New Project</h3>

After logging in to your account, you will see options for creating a new project. If you have an app for Android or iOS, you can select "Android/iOS App" and upload the application to your account. If you are testing a website, you should select "Mobile Website" instead. If you don't have an application or website to test, you can also select "Sample App" to try the platform with a simple trial app. 
<br>
<img class="center shadow" src="/img/settings/upload_app.png">
<br>

After uploading your application, you will then need to specify an app name and version. If you are testing a website, you will also need to provide the URL of the website. Finally, you will be able to set default settings for the device. Don't worry, you can change the device settings for your project at any time. 

To create additional projects, you will need to select the "New App" button from your home screen. You can then go through the same procedure that we just used to create our first project.

<img class="center shadow" src="/img/settings/new_app.png">

<h3 id="app-versions">Manage App Version</h3>

Now that you've created your new project, the project dashboard gives you information on your application and the tests that you've run. You can upload a new app version directly from this dashboard by selecting "Upload New Version". You can also manage your different app versions by selecting "All Versions".

<img class="center shadow" src="/img/dashboard/app-dashboard.png">


Clicking "All Versions" gives you an overview of all previously uploaded versions of this app. On the left side of each app version, you see the ID. This can be used to select specific app versions when performing automated testing. If you don't specify an app version, the active app version will be used. Also, for manual testing, the active app version is always used. You can see which version of your application is active by looking for "active" in the status column.

<img class="center shadow" src="/img/settings/app-versions.png">

It's possible to use the icons on the right of each app version to:

<img src="/img/settings/app-version-icons.png">

- Set a new active app version
- Archive the app version
- Download the app version
- Edit the app version

For a more advanced setup, you can also upload new app versions using our <a href="/docs/api/storage/">Storage REST API</a>. This can be useful for automatically uploading new builds of your application to your account.
