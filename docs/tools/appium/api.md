---
title: Our Appium APIs
layout: en
permalink: docs/tools/appium/appium-api/
alias: /docs/tools/appium/appium-java-api/
---

To make things more convenient for our customers, we provide our own Appium API, which contains everything that is necessary to run our Appium test setups in a variety of [supported languages](/docs/tools/appium/setups/).

We are constantly improving our libraries, so we recommend our users to check this page from time to time to make sure they are using the latest version. Our goal is to make Appium testing on TestObject as easy and convenient as possible, so we are always looking to support more advanced setups and interesting testing frameworks.

<h3>Java API</h3>

<h4>Current status</h4>

LATEST VERSION is <a href="https://github.com/testobject/testobject-appium-java-api"><strong>0.0.13</strong></a>

* Supports JUnit Basic, Watcher and Suites setups
* Supports TestNG Basic and Watcher setups

<h4>Changelog</h4>

<strong>v0.0.13</strong>

* now supports TestNG Watcher setup through TestObjectTestNGTestResultWatcher;
* our result watchers can now be set for any RemoteWebDriver, not just for AppiumDriver;
* capabilities TESTOBJECT_APP_ID, TESTOBJECT_DEVICE, TESTOBJECT_SUITE_NAME, TESTOBJECT_TEST_NAME and TESTOBJECT_APPIUM_VERSION are no longer deprecated.

<h4>How to get it</h4>
<h5>Gradle</h5>
{% highlight bash %}
    ...

    repositories {
        ...
        maven {
            url "http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo/"
        }
    }
    
    ...

    dependencies {
        ...
        testCompile 'org.testobject.extras.appium:appium-java-api:0.0.9'
    }

    ...
{% endhighlight %}

<h5>Maven</h5>
{% highlight bash %}
<project ...>
    
    ...

    <dependencies>
        
        ...
        
        <dependency>
            <groupId>org.testobject.extras.appium</groupId>
            <artifactId>appium-java-api</artifactId>
            <version>0.0.13</version>
        </dependency>
    </dependencies>

</project>
{% endhighlight %}

<h3>Ruby API</h3>

<h4>Current status</h4>

LATEST VERSION is <a href="https://github.com/testobject/testobject-appium-ruby-api"><strong>0.0.0</strong></a>

You can find this on [rubygems.org](https://rubygems.org/gems/test_object_test_result_watcher)!

* Test::Unit Basic and Watcher setups

<h4>Changelog</h4>

<strong>v0.0.0</strong>

* now suppports Test::Unit Basic and Watcher setups