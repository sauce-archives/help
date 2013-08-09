---
title: Input Methods
layout: en
permalink: input/
---

<ul>
	<li>
		<h4>click( targetLocator , [ timeout ] , [ recordedImage ] )</h3>
		<p>click on the given locator when it appears on the screen, fails if the locator doesn't appear after given timeout</p>
		<p><ul>
			<li>
				<strong>targetLocator</strong>
				<div>Type: Locator</div>
				<em>the locator to click on</em>
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
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}click(image(4).before().box(129, 469, 221, 69), 60.0, image(4)){% endhighlight %}
		</p>
	</li>
	<li>
		<h4>click( x , y , [ recordedImage ] )</h3>
		<p>click immediately on the given position</p>
		<p><ul>
			<li>
				<strong>x</strong>
				<div>Type: Numeric</div>
				<em>x coordinate to click on</em>
			</li>
			<li>
				<strong>y</strong>
				<div>Type: Numeric</div>
				<em>y coordinate to click on</em>
			</li>
			<li>
				<strong>recordedImage</strong>
				<div>Type: Image</div>
				<em>reference to the screenshots taken during recording</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}click(100, 100, image(4)){% endhighlight %}
		</p>
	</li>
	<li>
		<h4>longPress( targetLocator , [ timeout ] , [ recordedImage ] )</h3>
		<p>long press on the given locator when it appears on the screen, fails if the locator doesn't appear after given timeout</p>
		<p><ul>
			<li>
				<strong>targetLocator</strong>
				<div>Type: Locator</div>
				<em>the locator to long press on</em>
			</li>
			<li>
				<strong>timeout</strong>
				<div>Type: Numeric</div>
				<em>wait time for the targetLocator to appear in seconds, if no set timeout is by default 60 seconds</em>
			</li>
			<li>
				<strong>recordedImage</strong>
				<div>Type: Image</div>
				<em>reference to the screenshots taken during recording</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}longPress(image(4).before().box(129, 469, 221, 69), 60.0, image(4)){% endhighlight %}
		</p>
	</li>
	<li>
		<h4>longPress( x , y , [ recordedImage ] )</h3>
		<p>click immediately on the given position</p>
		<p><ul>
			<li>
				<strong>x</strong>
				<div>Type: Numeric</div>
				<em>x coordinate to long press on</em>
			</li>
			<li>
				<strong>y</strong>
				<div>Type: Numeric</div>
				<em>y coordinate to long press on</em>
			</li>
			<li>
				<strong>recordedImage</strong>
				<div>Type: Image</div>
				<em>reference to the screenshots taken during recording</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}longPress(100, 100, image(4)){% endhighlight %}
		</p>
	</li>
	<li>
		<h4>drag( flow , [ recordedImage ] )</h3>
		<p>drag using the defined flow, flow is an array containing flow points</p>
		<p><ul>
			<li>
				<strong>flow</strong>
				<div>Type: Array</div>
				<em>2 dimensional array, flow point are triples with x, y coordinates and waitTime in milliseconds</em>
			</li>
			<li>
				<strong>recordedImage</strong>
				<div>Type: Image</div>
				<em>reference to the screenshots taken during recording</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}drag([[387, 615, 0], [450, 182, 20]], image(11)){% endhighlight %}
		</p>
	</li>
		<li>
		<h4>type( text , [ recordedImage ] )</h3>
		<p>type the given text</p>
		<p><ul>
			<li>
				<strong>flow</strong>
				<div>Type: String</div>
				<em>text to be written</em>
			</li>
			<li>
				<strong>recordedImage</strong>
				<div>Type: Image</div>
				<em>reference to the screenshots taken during recording</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}type('sample text', image(12)){% endhighlight %}
		</p>
	</li>
</ul>