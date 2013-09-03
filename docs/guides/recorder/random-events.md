---
title: Random Events
layout: en
permalink: docs/guides/recorder/random-events/
alias: docs/references/recorder/random-events/
---

This Dialog allows you to add a [Random Input](/docs/api/input#randomInput "Random Input") step to the test script. When a Random Input step is executed it sends random touch and key events to your application and fails if an exception is thrown during execution. This step can be configured with the following parameters:

**Event Count:** the number of events that will be sent.

**Delay**: The delay time between two events in milliseconds.

**Random Seed**: A Random Input step uses a integer number to generate a certain sequence of events. This number is also called a *seed*. A Random Input step will trigger the same sequence of events each time if the same seed is used. This parameter could also be seen as a "Scenario".



Note - The execution of the Random Input step is done using the [Android SDK Exerciser Monkey](http://developer.android.com/tools/help/monkey.html).