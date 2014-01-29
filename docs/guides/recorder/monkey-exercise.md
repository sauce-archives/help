---
title: Monkey Exercise
layout: en
permalink: docs/guides/recorder/monkey-exercise/
---

This dialog allows you to add a [Monkey Exercise](/docs/api/input#monkeyExercise "Random Input") (random input events) step to the test script. When this step is executed it sends random touch and key events to your application, or to the browser if are testing a website. As soon as an error is detected the step will fail. The following parameters can be used to configure the step:

**Event Count:** The number of events that will be sent.

**Delay**: The delay time between two events in milliseconds.

**Random Seed**: An integer number representing a certain sequence of events. For the same seed the Random Input step will trigger the same sequence of events.

Note: The execution of the Random Input step is done using the [Android SDK Exerciser Monkey](http://developer.android.com/tools/help/monkey.html "Android SDK Exerciser Monkey").
