---
title: Locator Methods
layout: en
permalink: docs/api/locator/
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
		<em>time in seconds to wait until the targetLocator appears, if no set timeout is by default 60 seconds</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
	<li>
		<strong>Returns</strong>
		<div>Type: BoxLocator</div>
		<em>locator which contains the size and position of the targetLocator on the current Screen</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}find(image(25).before().box(129, 469, 221, 69), 60, image(25)){% endhighlight %}
</p>

<h3 id="waitVanish">waitVanish( targetLocator , [timeout] , [recordedImage] )</h3>
<p>wait until the targetLocator vanishes from the screen, fails if the targetLocator is still visible after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should disappear from the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the targetLocator must disappear, if no set timeout is by default 60 seconds</em>
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
<p>wait until the targetLocator appears on the screen, fails if the targetLocator doesn't appear after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should appear on the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the targetLocator must appear, if no set timeout is by default 60 seconds</em>
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
