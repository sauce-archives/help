---
title: Scripting Methods
layout: en
permalink: docs/references/scripting-api/scripting/
---

<ul>
	<li>
		<h4 id="runScript">runScript( scriptId )</h3>
		<p>executes the given script, should be used to execute actions from another script immediately</p>
		<p><ul>
			<li>
				<strong>scriptId</strong>
				<div>Type: Numeric</div>
				<em>id of the script which should be executed</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}runScript(3){% endhighlight %}
		</p>
	</li>
	<li>
		<h4 id="importScript">importScript( scriptId )</h3>
		<p>executes the given script, and returns its global scope as object, should be used to invoke methods defined in other scripts</p>
		<p><ul>
			<li>
				<strong>scriptId</strong>
				<div>Type: Numeric</div>
				<em>id of the script which should be imported</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
{% highlight js %}
var script = importScript(2);
script.invokeMethodFromAnotherScript();
{% endhighlight %}
		</p>
	</li>
	<li>
		<h4 id="sleep">sleep( n )</h3>
		<p>pause script execution for n seconds</p>
		<p><ul>
			<li>
				<strong>n</strong>
				<div>Type: Numeric</div>
				<em>number of seconds to pause the script execution</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}sleep(1){% endhighlight %}
		</p>
	</li>
	<li>
		<h4 id="print">print( message )</h3>
		<p>print a message to the test log</p>
		<p><ul>
			<li>
				<strong>message</strong>
				<div>Type: String</div>
				<em>message to be written to the log</em>
			</li>
		</ul></p>
		<p>
		<strong>Example:</strong>
		{% highlight js %}print('hello'){% endhighlight %}
		</p>
	</li>
</ul>
