---
title: Run Appium Tests with Travis CI
layout: en
permalink: docs/guides/appium-travisci/
---

For a full continuous integration process automate the execution of your tests created with TestObject. This can be easily achieved by running Appium Tests on Travis CI.

In this tutorial we will get you setup to run automated tests on <a href="https://travis-ci.org" target="_blank">Travis CI</a> using devices available on TestObject.

You can find an example java project with Appium Tests at Github: <a href="https://github.com/testobject/appium-java-travisci-example" target="_blank">testobject/appium-java-travisci-example</a>.

<h3 id="getting_started">Getting Started</h3>

First, create a <strong>.travis.yml</strong> file in your repo if you don't have one yet.

You can learn more about setting up Travis for your project's programming language here<a href="http://docs.travis-ci.com/user/getting-started/#Getting-started" target="_blank">here</a>.

<h3 id="step1">Securely use your TestObject credentials on Travis CI</h3>


To test with TestObject on Travis, you need to make your credentials available to your tests.The best way to achieve this is to encrypt your credentials as environment variables so that they aren't visible in your source code, but instead available as global variables.

If you want to learn more about secure environment variables, check out the <a href="http://docs.travis-ci.com/user/build-configuration/#Secure-environment-variables" target="_blank">Travis CI documentation</a>.


<h3 id="step2">Adding credentials for a GitHub repo</h3>

+ First install the Travis gem with the following command:
{% highlight xml %}
gem install travis
{% endhighlight %}
This assumes you have Ruby installed on your system, and you may have to add sudo to the beginning of the command dependending on your system permissions.

+ If you don't have a <strong>.travis.yml</strong> file in your repo yet, you can run the following command to scaffold one:
{% highlight xml %}
travis init
{% endhighlight %}

+ Then run the following command to encrypt your API Key <strong>(replace YOUR_API_KEY_HERE)</strong> :
{% highlight xml %}
travis encrypt TESTOBJECT_API_KEY=YOUR_API_KEY_HERE --add
{% endhighlight %}

+ These command will add the following content to your <strong>.travis.yml</strong> file:
{% highlight xml %}
env:
global:
- secure: "Secure api-key token goes here!"
{% endhighlight %}

Now you can access the TESTOBJECT_API_KEY environment variable in your tests to authenticate with TestObject.

<strong>Now you are done!</strong></br></br>
