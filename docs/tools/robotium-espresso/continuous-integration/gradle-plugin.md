---
title: Integrate Robotium/Espresso into your CI Process using our Gradle plugin
layout: en
permalink: docs/tools/robotium-espresso/gradle-plugin/
---

<h3 id="gradle-plugin">TestObject Gradle Plugin</h3>

Use this plugin to upload your APK, as well as test APK (Espresso/Robotium tests) to the TestObject platform.

The TestObject Gradle plugin improves your build process and lets you enjoy statistics and seamless usage of custom runners.

For users with a custom runner doing internal filtering this feature is recommended. It enables you to run your test cases as a package.



<h4>Configuration</h4>


<h5>1. <a href="/docs/testing-tools/robotium-espresso/setup/">Setup your first Espresso/Robotium test</a> through our UI.</h5>

<h5>2. Get the needed specifications</h5>

To setup your <a href="#build.gradle">build.grade config</a> file you will need to put some specifications. Additionally to your user name and password you find all the relevant data on the screen after you uploaded your test APK and before you select your devices for your test.

The information you will need:

+1. a team name (if used)
+2. your app name
+3. ID of your test suite

<img src="/img/guides/gradle/screen-gradle-plugin.png" alt="Screen Gradle Plugin">

<h5>3. Configure your <a id="build.gradle">build.grade config</a> file</h5>

Set your properties accordingly to this sample file:


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
  username "your-username"
  password "your-password"
  team "a-team-name"
  app "your-app-name"
  testSuite 17
  runAsPackage true
  failOnUnknown
  classes = ["com.testobject.foobar.Test1","com.testobject.foobar.Test2"]
  tests = ["com.testobject.foobar.Test1#test"]
  annotations = ["com.testobject.annotation.Test"]
  sizes = ["small","medium","large"]
}
```

<h5>The fields should be used as follows:</h5>

- username: The username you use for login into testobject, not your email.
- password: The password you use for login into testobject.
- team: the name of the team the user belongs to (optional, if the user is not part of a team). The team is indicated by nr. 1 in the screenshot above.
- app: Name of your app. See nr. 2 in screenshot above.
- testSuite: Id of your test suite, see nr. 3 in screenshot above.
- runAsPackage: If you are using custom runners and doing internal filterings we recommend you to use it like this. If not this option can be deleted or set as false.
- failOnUnkown: If you want your test to fail when one of the devices in the test suite is unavailable, set this property to true.
- classes: This property can be set to run only some test methods.
- tests: This property can be set to run only some test methods.
- annotations: This property can be set if you want to only run tests that has this annotation. If the annotation is set on the class then the methods will also inherit it and will be run
- sizes: This property can be set if you just want to run tests that have @SmallTest, @MediumTest and @LargeTest annotations. Like annotations, class annotations will again be inherited by the methods


<h5>4. Run the subsequent tests from command line</h5>

Upgrades of your APK/testAPK will be pushed automatically by your Gradle


<h5>Access your reports and stats form your CI Server</h5>

<h4>Test Result Trend</h5>


When the tests are finished, you will find a JUnit xml file in the “testobject” folder within the build folder. This xml file holds the information about every test run and can be integrated with a CI server like Jenkins to see the progress reports and statistics.

<img src="/img/guides/gradle/gradle-test-results.png" alt="Test result statistics">
