---
title: Basic Setup on TestObject using Codeception
layout: en
permalink: docs/tools/appium/setups/basic-setup/codeception/
---

<a href="http://codeception.com" target="_blank">Codeception</a> is a testing framework that allows you to write automated web tests using PHP. Currently only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible in the test report on TestObject.

In this guide you will learn how to update your test to run on TestObject. First of all you need to have a working Codeception test. If you don't have one, then follow the <a href="http://codeception.com/quickstart" target="_blank">Codeception Quick Start section</a> to download, install and create a new test project.

After that, update `tests/acceptance.suite.yml` configuration file to look as follows:

{% highlight javascript %}
class_name: AcceptanceTester
modules:
    enabled:
        - WebDriver:
            url: 'https://google.com'
            host: 'appium.testobject.com'
            port: 80
            browser: chrome
            capabilities:
                testobject_api_key: 'YOUR TESTOBJECT API KEY'
                testobject_device: LG_Nexus_4_E960_real
                testobject_appium_version: 1.5.2-patched-chromedriver  
        
{% endhighlight %}

Codeception mandatory capabilities:

* <strong>url</strong> is the URL of the website or the web app you want to test (e.g. 'https://google.com').
* <strong>browser</strong> name of the browser you wish to use.

TestObject Capabilities:

* <strong>testobject_api_key</strong> Your TestObject API Key.
* <strong>testobject_device</strong> Device you want to use.
* <strong>testobject_appium_version</strong> Appium version you want to use.
