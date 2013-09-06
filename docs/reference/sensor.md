---
title: Sensor Methods
layout: en
permalink: docs/api/sensor/
alias: docs/references/scripting-api/sensor/
---

<h3 id="rotateToLandscape">rotateToLandscape( [ recordedImage ] )</h3>
<p>rotate the device to landscape view</p>
<p><ul>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}rotateToLandscape(image(13)){% endhighlight %}
</p>

<h3 id="rotateToPortrait">rotateToPortrait( [ recordedImage ] )</h3>
<p>rotate the device to portrait view</p>
<p><ul>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}rotateToPortrait(image(14)){% endhighlight %}
</p>

<h3 id="setGPS">setGPS( latitude , longitude , elevation, [ recordedImage ] )</h3>
<p>change the gps position of the device</p>
<p><ul>
	<li>
		<strong>latitude</strong>
		<div>Type: Numeric</div>
		<em>latitude part of the gps position (north-south position of a point on the Earth's surface)</em>
	</li>
	<li>
		<strong>longitude</strong>
		<div>Type: Numeric</div>
		<em>longitude part of the gps position (east-west position of a point on the Earth's surface)</em>
	</li>
	<li>
		<strong>elevation</strong>
		<div>Type: Numeric</div>
		<em>elevation part of the gps position (in meters above sea level)</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}setGPS(52.52757966672534, 13.392462730407715, 0.0, image(15)){% endhighlight %}
</p>

<h3 id="setGPS">setGPS( latitude , longitude , elevation, speed, bearing, [ recordedImage ] )</h3>
<p>change the gps position of the device</p>
<p><ul>
	<li>
		<strong>latitude</strong>
		<div>Type: Numeric</div>
		<em>latitude part of the gps position (north-south position of a point on the Earth's surface)</em>
	</li>
	<li>
		<strong>longitude</strong>
		<div>Type: Numeric</div>
		<em>longitude part of the gps position (east-west position of a point on the Earth's surface)</em>
	</li>
	<li>
		<strong>elevation</strong>
		<div>Type: Numeric</div>
		<em>elevation part of the gps position (in meters above sea level)</em>
	</li>
	<li>
		<strong>speed</strong>
		<div>Type: Numeric</div>
		<em>the speed in meters/second over ground.</em>
	</li>
	<li>
		<strong>bearing</strong>
		<div>Type: Numeric</div>
		<em>the device movement direction in degrees (Clockwise, where North is 0).</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}setGPS(52.52757966672534, 13.392462730407715, 0.0, 1, 90, image(15)){% endhighlight %}
</p>
