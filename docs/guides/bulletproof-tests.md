---
title: Making Your Tests Bulletproof
layout: en
permalink: docs/guides/bulletproof-tests/
---

Reliable tests are essential for successfully monitoring the quality of your product. A good test only fails when the app does not behave as expected.



### Why can tests be unreliable?

We strive to make creating tests as simple as possible. In most cases it is enough to just press the "Record" button and interact with the app. Based on your actions, our system then creates the test for you. With only a click on "Replay" your actions are finally reconstructed based on the recorded steps.

Our test replay is fast - much faster than recording. This is one of the reasons why automated testing is so efficient. However, the behavior of apps sometimes collides with this goal. Two common challenges are:

- We want to accommodate for a changing environment. For example, the screen was ready in 0.5 seconds during recoding. But what if during replay the server is under load? Loading might take longer under such circumstances.
- Some applications require the whole screen - not only the desired element - to be loaded in order to be fully functional.

Our system automatically takes care of these issues, but sometimes a test still needs adjustments. With the techniques presented below you can make sure that your test executes reliably every time.  



### Waiting for Locators

Most of the stability issues originate from the time it takes the application to generate the visual elements.  

Let's have a look at screenshots below:

<div class="side-by-side">
 	<img src="/img/guides/bulletproof-tests/theverge1.png" /> <img src="/img/guides/bulletproof-tests/theverge2.png" />
</div>

The first screenshot was taken while the page was still loading, the second one when it was ready. Imagine that the first step in your script is clicking on the "Login" button:

<img src="/img/guides/bulletproof-tests/theverge-before.png">

During replay the system will find the "Login" button as soon as it appears on the screen. It will click on it immediately. This can be problematic for two reasons:

- The position of the element may be different from the one in recording. Before clicking, the person who records the test most likely waits for the whole screen to finish loading. The position mismatch will be indicated as warning during replay.
- The click on the element may be handled by JavaScript. The element might then be rendered before all JavaScript has loaded, so that the click will have no effect. Subsequent steps of the test will fail in this case.

So what now? It's [waitAppear](/docs/api/locator#waitAppear "waitAppear API reference") and [waitVanish](/docs/api/locator#waitVanish "waitVanish  API reference") to the rescue! These functions are normally used as test assertions - making sure that a certain element has appeared on or vanished from the screen. The system will only procede to the next step only after the assertion was successful. This means we can use them to make sure that the screen is in a state in which the subsequent step can be completed.

Let's use the "Install" button as an indicator for the page to be rendered properly by using the *waitAppear* function:

<img src="/img/guides/bulletproof-tests/theverge-after.png">

In some cases it is also useful to wait for an element to disappear from the screen before continuing with the next step. Imagine, for instance, a loading spinner which indicates when an operation as finished. The *waitVanish* function can be used to capture this behavior.



### Wating for the Whole Screen

Another way of making sure that the screen has finished loading is by using the [waitLoaded](/docs/api/locator#waitLoaded "waitLoaded API reference") function. When *waitLoaded* is called it starts monitoring changes on the application screen. As long as the interface is loading, it keeps changing visually. When no major changes are recognized anymore, it is considered to be loaded.

<img src="/img/guides/bulletproof-tests/theverge-waitLoaded.png">

This approach is useful if you are not interested in a particular element but rather in the whole page. A common problem is typing into a text field too early.

<img src="/img/guides/bulletproof-tests/testobject-cursor.png">  

The script below will fail quite often:

<img src="/img/guides/bulletproof-tests/testobject-before.png">

The problem here is that the system might start typing before the page is ready. A pragmatic solution would be to click on the text input field before starting to type:

<img src="/img/guides/bulletproof-tests/testobject-click.png">

In order to click on the text field the system waits for it to appear first. By the time the *type* function is executed, text field will be ready. It will also ensure that the field is focused.

But what if the purpose of a test step is to make sure that the field already has focus? In this case the system needs to wait until the page is ready. Inserting *waitLoaded* before typing will make sure that the page is fully loaded before typing begins:

<img src="/img/guides/bulletproof-tests/testobject-after.png">

A *waitLoaded* step is inserted automatically during recording when the system detects that it took some time for the app to get ready between steps.



### When to use waitAppear, waitVanish, or waitLoaded?

The functions *waitAppear*/*waitVanish* and *waitLoaded* have similar meaning. All of them can be used to ensure that the application is ready to continue to the next step. In many cases they can be used interchangeably. Nevertheless, there are a few differences:

**waitLoaded** is more generic and does not need a particular element to be defined, which makes it perfect for situations in which the screen is ready as soon as it does not change visually anymore. This solution works well in most cases.

The usage however makes the test execution a bit slower. When the application screen stops updating, *waitLoaded* has to keep waiting a couple of seconds to confirm that it is not just a pause in loading. 

The function is not suited for a screen that constantly changes. This may be caused by, for example, an animated banner.

**waitAppear** and **waitVanish** are very fast as the system procedes to the next test step as soon as the respective element appears on or vanishes from the screen. This ensures the fastest possible test execution but requires manual input from the user as the system cannot determine which elements are actually relevant.

If the execution speed is essential for your test, you can reduce the waiting time by replacing *waitLoaded* with *waitAppear* or *waitVanish* steps.



### Adjusting Timeouts

Timeouts are used to determine how long to wait for elements to appear or vanish before executing the subsequent step. The default timeout for all functions that look for elements on the screen is **60** seconds.

Sometimes, however, applications need more time, for example, if they include some processing or downloading big files. The timeout can be increased to make sure that the system waits long enough.

For *waitAppear* and *waitVanish* the timeout specifies the maximum amount of time to wait before the step will fail.

The timeout for *waitLoaded* limits the time that the system waits for the screen to get ready. The result, however, is different: The *waitLoaded* step never fails. The system always continuous to the next step after the timeout was reached. 
