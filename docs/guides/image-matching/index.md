---
title: Image Matching
layout: en
permalink: docs/guides/image-matching/
---

<h3 id="basic-concepts">Basic Concepts</h3>
To interact with application testing solution needs to be able to find target elements which are most commonly buttons or text fields.<br>
There are two most common approaches to achieve this task - API based access or visual matching.

<strong>API based access</strong> allows applications to communicate with the system and provides direct access to elements. 
The drawback is that the app itself has to be modified.

<strong>Visual matching</strong> is a technique employed by CONTINUOUS to identify elements of application. 
Instead of element id stored in application it uses image of that element and matches it to actual screen of app during test execution.<br>
This way application doesn't have to me modified and solution doesn't care if it's Android app or web app - image is an image.


<h3 id="visual-matching-in-continuous">Visual Matching in CONTINUOUS</h3>
When you record a test we add a "locator" for each action that needs to identify an element on the screen.<br>
<strong>Example:</strong> {% highlight js %}click(image(4).before().box(129, 469, 221, 69), 60.0, image(4)){% endhighlight %}

The locator here is {% highlight js %}image(4).before().box(129, 469, 221, 69){% endhighlight %}
In script editor it's transformed into actual image for convenience but this is how it looks in the script to execute.

<strong>Let's break it down:</strong><br>
{% highlight js %}image(4).before(){% endhighlight %} is a screenshot before the action was taken.<br>
{% highlight js %}.box(129, 469, 221, 69){% endhighlight %} is an area of the screenshot - "original" element to perform an action on, 
"click" in this example. 

The important thing here is that not only do we have image to match but also it's original position on the screen.

Our matching algorithm only matches locators that have the same image and also situated at the same location.

<h4>Matching Probability</h4>
Visual matching would not be useful if it required the image to be exactly the same and be at the same position while executing the script. The locator might be on a slightly different position or the font can be different from the one in recording. This especially applies to web applications.

The matching probability is combined from <strong>two probabilities</strong>: image and position.<br>
Image probability is higher if the image to match is similar to the original.<br>
Position probability is high if the match is found on the same position and low if it's position is different.<br>
This means that even if locator looks exactly the same it might give you a warning or not match at all if it's on different position.


<h3 id="errors-and-warnings">Errors and Warnings</h3>

<h4>Warning</h4>
Sometimes during test execution you might receive a warning which looks something like this:

<img class="drop-shadow" src="/img/references/image-matching/warning.png" alt="Fuzzy location matching" />

Report for test execution has these two images:

<img class="drop-shadow" src="/img/references/image-matching/report-warning.png" alt="Fuzzy location matching in report" />

Test was recorded with browser address bar expanded and was executed with address bar collapsed which made locator move.<br>
Position probability was enough for system to find the locator but still the match was not perfect.<br> 
This means that next time when position is even more off(for example in different browser) it might not match at all.<br>
You might want to re-record this test step without address bar, so next time matching probability will be higher.


<h4>Locator Not Found Error</h4>
Sometimes locator can't be found. This happens when locator is not present while test is executed or matching probability is too low.

<img class="drop-shadow" src="/img/references/image-matching/locator-not-found.png" alt="Locator not found error" />

Report and replay images are the same as in previous example but minimum similarity required for this locator was set to <strong>0.95</strong><br>
This is how record and replay images look like in report:

<img class="drop-shadow" src="/img/references/image-matching/locator-not-found-in-report.png" alt="Locator not found error in report" />

<h3 id="fine-tune-matching">Fine-tune Matching</h3>
Most of matching warning and errors occur because the locator is in wrong position during replay or it looks different.<br>
Best way to solve it is to choose different locator which doesn't change or changes are small.

If you know that the correct element is present and not matched only because it's a bit different but still correct you can adjust 
matching probability so it matches.

When test fails you can open settings dialog for the method that failed and adjust matching probability:

<img class="drop-shadow" src="/img/references/image-matching/fine-tune-matching-matches.png" alt="Fine-tune matching - matches" />

"Fine-tune Matching" tab shows screenshot of current device and a locator match for current probability level.

Changes are reflected immediately - increasing minimum probability to <strong>0.95</strong> gives no matches:

<img class="drop-shadow" src="/img/references/image-matching/fine-tune-matching-not-matching.png" alt="Fine-tune matching - doesn't match" />

Decreasing probability will make sure that locator is found but also might match images that are too different.<br>
It might be handy to decrease matching probability if you want to allow icon or text on the button to change and still want test to click on it.
