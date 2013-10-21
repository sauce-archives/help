---
title: Locator Methods
layout: en
permalink: docs/api/locator/
alias: docs/references/scripting-api/locator/
---

<h3 id="find">find( targetLocator , [timeout] , [recordedImage])</h3>
<p>rotate the device to landscape view</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator to search for on the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds to wait until the target locator appears, if not set, the default timeout of 60 seconds will be used</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: Box</div>
		<em>the box which contains the size and position of the target locator on the current screen</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}find(image(25).before().box(129, 469, 221, 69), 60, image(25)){% endhighlight %}
</p>



<h3 id="waitVanish">waitVanish( targetLocator , [timeout] , [recordedImage] )</h3>
<p>wait until the target locator vanishes from the screen, fails if the locator is still visible after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should disappear from the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the target locator must disappear, if not set, the default timeout of 60 seconds will be used</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitVanish(image(26).before().box(129,469,221,69), 82.3, image(26)){% endhighlight %}
</p>



<h3 id="waitAppear">waitAppear( targetLocator , [timeout] , [recordedImage] )</h3>
<p>wait until the target locator appears on the screen, fails if the locator doesn't appear after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should appear on the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the target locator must appear, if not set, the default timeout of 60 seconds will be used</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitAppear(image(26).after().box(129,469,221,69), 82.3, image(26)){% endhighlight %}
</p>



<h3 id="waitLoaded">waitLoaded( [timeout] )</h3>
<p>wait until no major visual updates are recognized on the screen, continuous after timeout</p>
<p><ul>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the screen must have stopped updating, if not set, the default timeout of 60 seconds will be used</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitLoaded(60){% endhighlight %}
</p>

In some cases an application requires some time to update the screen between actions. For example, when a user needs to login he first needs to click on the "Login" button, then type in his credentials and press the "Confirm" button. If an application takes some time to load the login form, then the system might start typing although the screen is not ready yet. The *waitLoaded* step ensures that the screen is ready before the next action is performed. If the screen still changes, the next action will not be performed until there are no more updates except for really small ones to ignore blinking cursors. If an application screen is supposed to change all the time because of an animation, the timeout can be decreased.

When to use *waitLoaded*:

- The system starts typing before text field has appeared on the screen.  
- Normally the system clicks on the button as soon as it finds it on the screen. In some cases all elements on the screen have to be loaded beforehand.

Usually, *waitLoaded* steps are inserted during recording when the system detects that an action was followed by a lot of screen changes. The loading speed of web applications can vary from execution to execution so that in some cases *waitLoaded* might not be inserted automatically. The page may have loaded fastly during recording but loads slowly in some of the replays. In this case *waitLoaded* should be inserted manually.

Read more about <a href="/docs/guides/bulletproof-tests">making your tests bulletproof</a>.



<h3 id="readText">readText( region )</h3>
<p>recognizes text within the given target region on the screen</p>
<p><ul>
	<li>
		<strong>region</strong>
		<div>Type: Region</div>
		<em>the region in which the text should be recognized</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: Array</div>
		<em>a string array with the recognized text</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}readText(region(80,90,100,100)){% endhighlight %}
</p>
