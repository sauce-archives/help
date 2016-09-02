---
title: Basic Setup on TestObject using Test::Unit
layout: en
permalink: docs/tools/appium/setups/testunit/basic/
---

The basic setup is the quickest way to get testing on TestObject. Here is what it looks like with Test::Unit.

To begin testing on our platform with Ruby, you need to install the Ruby library supporting Appium and also Test::Unit, a testing framework for Ruby. Install the dependencies by running:
{% highlight bash %}
gem install appium_lib
gem install test-unit
{% endhighlight %}

With the dependencies installed, you can begin testing on TestObject with the following setup:
{% highlight ruby %}
require 'appium_lib'
require 'test/unit'

class BasicTestSetup < Test::Unit::TestCase
  def setup
    desired_capabilities = {
        caps:       {
            testobject_api_key: 'YOUR_API_KEY',
            testobject_device: 'Motorola_Moto_G_2nd_gen_real'
        },
        appium_lib: {
            server_url: 'http://appium.testobject.com/wd/hub',
            wait: 10
        }
    }

    # Start the driver
    @driver = Appium::Driver.new(desired_capabilities).start_driver
  end

  # test method names must start with "test_"
  # to be recognized by the test-unit framework
  def test_login
    # Your test
  end

  def teardown
    @driver.quit
  end
end
{% endhighlight %}

Along with the mandatory capabilities we have specified, you can send over some optional ones to customize your test runs:

* <strong>testobject_app_id</strong>, if you want to use an app version other than the default one.
* <strong>testobject_appium_version</strong>, if you want to run your tests against an Appium version other than the default one.
* <strong>testobject_suite_name</strong>, if you want to apply a label to your tests so that they are easier to group / find later on.
* <strong>testobject_test_name</strong>, if you want to specify a name for your test that will be displayed in place of the default one.

With this kind of barebones setup you will be able to run tests on the TestObject platform, but you will not be using it to its fullest potential, as the results of the tests won't be registered in the test reports on TestObject. Don't panic though! You can register your results on TestObject with our <a href="/docs/tools/appium/setups/testunit/watcher">Watcher Setup</a>.
