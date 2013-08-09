---
title: Sensor Methods
layout: en
permalink: sensor/
---

<ul>
	<li>
		<h4 id="rotateToLandscape">rotateToLandscape( [ recordedImage ] )</h3>
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
	</li>
	<li>
		<h4 id="rotateToPortrait">rotateToPortrait( [ recordedImage ] )</h3>
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
	</li>
	<li>
		<h4 id="setGPS">setGPS( latitude , longitude , elevation, [ recordedImage ] )</h3>
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
				<em>elevation part of the gps position (height above a fixed reference point)</em>
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
	</li>
</ul>