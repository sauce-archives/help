---
title: Scripting Methods
layout: en
permalink: docs/api/scripting/
alias: docs/references/scripting-api/scripting/
---

<h3 id="runScript">runScript( scriptId )</h3>
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

<h3 id="importScript">importScript( scriptId )</h3>
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

<h3 id="sleep">sleep( n )</h3>
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

<h3 id="print">print( message )</h3>
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

<h3 id="http">http( {method: 'METHOD', url: 'URL', [ data: {}] )</h3>
<p>Sends a HTTP request using a configuration JSON and returns a response</p>
<p><ul>
	<li>
		<strong>method</strong>
		<div>Type: String</div>
		<em>The HTTP method</em>
	</li>
	<li>
		<strong>url</strong>
		<div>Type: String</div>
		<em>The URL used for the HTTP request</em>
	</li>
	<li>
		<strong>data</strong>
		<div>Type: JSON</div>
		<em>A JSON that will be sent as the request's data</em>
	</li>
	<li id="http-response">
		<strong>returns</strong>
		<div>Type: HttpResponse</div>
		<em>A response object with the following properties:</em>

		<ul>
			<li>
				<strong>status</strong>
				<div>Type: Numeric</div>
				<em>The response status code</em>
			</li>
			<li>
				<strong>headers</strong>
				<div>Type: JSON</div>
				<em>The response headers</em>
			</li>
			<li>
				<strong>config</strong>
				<div>Type: JSON</div>
				<em>The configuration object used for the HTTP request</em>
			</li>
			<li>
				<strong>data</strong>
				<div>Type: String</div>
				<em>The response data as a String</em>
			</li>
			<li>
				<strong>json</strong>
				<div>Type: JSON</div>
				<em>The response data as a JSON</em>
			</li>
		</ul>
	</li>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}
var response = http( {method: 'GET', url: 'http://echo.jsontest.com/echo/testobject', data: {some: 'data'}} )
print(response.status)
print(response.headers)
print(response.config)
print(response.data)
print(response.json)
{% endhighlight %}
</p>

<h3 id="http-get">http().doGet( url )</h3>
<p>Convenience syntax for an HTTP GET request</p>
<p><ul>
	<li>
		<strong>url</strong>
		<div>Type: String</div>
		<em>The URL used for the request</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: HttpResponse</div>
		<em>The result of the GET request as an <a href="#http-response">HttpResponse</a> object</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}
var response = http().doGet('http://echo.jsontest.com/echo/testobject')
print(response.json)
{% endhighlight %}
</p>

<h3 id="http-post">http().doPost( url, data )</h3>
<p>Convenience syntax for an HTTP POST request</p>
<p><ul>
	<li>
		<strong>url</strong>
		<div>Type: String</div>
		<em>The URL used for the request</em>
	</li>
	<li>
		<strong>data</strong>
		<div>Type: JSON</div>
		<em>The request data</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: HttpResponse</div>
		<em>The result of the POST request as an <a href="#http-response">HttpResponse</a> object</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}
var response = http().doPost('http://echo.jsontest.com/echo/testobject', { some: 'data' })
print(response.json)
{% endhighlight %}
</p>

<h3 id="http-put">http().doPut( url, data )</h3>
<p>Convenience syntax for an HTTP PUT request</p>
<p><ul>
	<li>
		<strong>url</strong>
		<div>Type: String</div>
		<em>The URL used for the request</em>
	</li>
	<li>
		<strong>data</strong>
		<div>Type: JSON</div>
		<em>The request data</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: HttpResponse</div>
		<em>The result of the PUT request as an <a href="#http-response">HttpResponse</a> object</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}
var response = http().doPut('http://echo.jsontest.com/echo/testobject', { some: 'data' })
print(response.json)
{% endhighlight %}
</p>

<h3 id="http-delete">http().doDelete( url )</h3>
<p>Convenience syntax for an HTTP DELETE request</p>
<p><ul>
	<li>
		<strong>url</strong>
		<div>Type: String</div>
		<em>The URL used for the request</em>
	</li>
	<li>
		<strong>returns</strong>
		<div>Type: HttpResponse</div>
		<em>The result of the DELETE request as an <a href="#http-response">HttpResponse</a> object</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}
var response = http().doDelete('http://echo.jsontest.com/echo/testobject')
print(response.json)
{% endhighlight %}
</p>