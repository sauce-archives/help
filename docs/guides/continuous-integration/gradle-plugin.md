---
title: Gradle Plugin
layout: en
permalink: docs/guides/gradle-plugin/
---
<ul>
<li><a href="#gradle-plugin">TestObject Gradle Plugin</a> </li>
</ul>

<h3 id="gradle-plugin">TestObject Gradle Plugin</h3>

The TestObject Gradle plugin improves your build process and lets you enjoy statistics and seamless usage of custom runners.
For users with a Custom Runner to do internal filtering this feature is recommended. It enables you to run your test cases as a package.

Use this plugin to upload your apk, as well as test apk (Espresso/Robotium tests) to the TestObject platform.

When the tests are finished, you will find a JUnit xml file in the “testobject” folder within the build folder. This xml file holds the information about every test run and can be integrated with a CI server like Jenkins to see the progress reports and statistics.

<h5>Test Result Trend</h5>
<img src="/img/guides/gradle/gradle-test-results.png" alt="Test result statistics">


<h4>Configuration</h4>


<h5>1. <a href="/docs/testing-tools/robotium-espresso/setup/">Setup your first Espresso/Robotium test</a> through our UI.</h5>

<h5>2. Get all necessary account settings to prepare your <a href="#build.gradle">build.grade config file</a> </h5>

Additionally to your user name and password you put
+1. a team name (not compulsary)
+2. your app name
+3. id you selected for your test suite

You find this information in the TestObject UI before you run your Espresso/Robotium test.

<img src="/img/guides/gradle/screen-gradle-plugin.png" alt="Screen Gradle Plugin">

<h5>Configure your <a href="#build.gradle">build.grade config file</a></h5>


<h4 id="build.gradle"> build.gradle config</h4>

```
buildscript {
        repositories {
                mavenCentral()
                maven { url 'http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo' }
        }

        dependencies {
                classpath 'com.android.tools.build:gradle:0.12+'
                classpath group: 'org.testobject', name: 'testobject-gradle-plugin', version: '0.0.35'
        }
}

apply plugin: 'android'
apply plugin: 'testobject'

android {
	...
}

testobject {
	username "your-username" // testobject username (not your email)
	password "your-password" // your password for testobject login
	team "a-team-name" //the name of the team the user belongs to (if existing), see nr. 1 in screenshot below
	app "your-app-name" // name of your app
	testSuite 17 // id of your test suite
	runAsPackage true // Recommended for usage of custom runners and doing internal filterings (if not this option can be deleted or set as false)
}
```

<h5>Run the subsequent tests from command line</h5>


<h5>Access your reports and stats form your CI Server</h5>

<h5>Upgrades of your apk/testapk will be pushed automatically by your Gradle</h5>
