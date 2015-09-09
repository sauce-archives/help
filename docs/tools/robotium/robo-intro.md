---
title: Introducing Espresso and Robotium
layout: en
permalink: docs/testing-tools/robotium/introduction/
---


<li><a href="#Espresso">Espresso</a></li>
<li><a href="#Robotium">Robotium</a></li>


<h3 id="Espresso">Espresso</h3>

Espresso is a test automation framework for Android applications developed by Google. It enables you to do automatic black-box UI tests.  Therefor it uses the <a href="http://developer.android.com/reference/android/app/Instrumentation.html" target="_blank">Android instrumentation</a> to inspect and interact with the activities you are testing. To locate the UI elements it draws back on <a href="https://github.com/hamcrest" target="_blank">hamcrest matchers.</a>
<!-- Compared to Robotium it allows a fast ("provides automatic synchronization of test actions with the UI of the app you are testing. Espresso detects when the main thread is idle, so it is able to run your test commands at the appropriate time, improving the reliability of your tests. This capability also relieves you from having to adding any timing workarounds, such as a sleep period, in your test code.")
Android 2.2 (API level8) and higher


To set up Espresso on your computer see the <a href="https://developer.android.com/training/testing/ui-testing/espresso-testing.html">Android Developers...</a>
-->

<h3 id="Robotium">Robotium</h3>

Robotium is an open-source test automation framework for automatic black-box UI-tests. Created as an extension of the Android test framework it only supports native and hybrid Android apps. Robotium allows you two write function, system and acceptance test scenarios and define them across Android activities.
Espresso and Robotium both use the <a href="http://developer.android.com/reference/android/app/Instrumentation.html">Android instrumentation</a> to inspect and interact with the activities in your test.

<!-- <a href="http://robotium.com/products/robotium-recorder">Robotium Recorder</a> 

see the <a href="https://github.com/RobotiumTech/robotium/wiki/Getting-Started">Robotium GitHub page</a>  for some documentation on how to setup Robotium 
-->
