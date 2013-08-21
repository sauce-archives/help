---
title: Apps Methods
layout: en
permalink: docs/api/apps/
---

<h3 id="install">installApp( appId )</h3>
<p>install the dependency with the given id</p>
<p><ul>
	<li>
		<strong>appId</strong>
		<div>Type: Numeric</div>
		<em>id of the dependency</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}installApp(1){% endhighlight %}
</p>

<h3 id="launch">launchDefaultApp()</h3>
<p>launch the default app of the current project</p>
<strong>Example:</strong>
{% highlight js %}launchDefaultApp(){% endhighlight %}
</p>

<h3 id="restart">restartDefaultApp()</h3>
<p>restart the default app of the current project</p>
<strong>Example:</strong>
{% highlight js %}restartDefaultApp(){% endhighlight %}
</p>
