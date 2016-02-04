---
title: Basic Setup on TestObject using Test::Unit
layout: en
permalink: docs/tools/appium/setups/testunit/basic/
---

<h4 id="basic-setup">Basic Setup</h4>
To begin testing on our platform with Ruby, you need to install the ruby library supporting Appium and also test-unit, a testing framework for Ruby. Install the dependencies by running:
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
            testobject_app_id: '1',
            testobject_device: 'Motorola_Moto_G_2nd_gen_real'
        },
        appium_lib: {
            server_url: 'https://app.testobject.com:443/api/appium/wd/hub',
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

* testobject_appium_version, if you want to run your tests against an Appium version other than the default one (1.3.5)
* testobject_test_name, if you want to specify a name for your test that will be displayed in place of the default one
* testobject_suite_name, if you want to apply a label to your tests so that they are easier to group / find later ons

With this kind of barebones setup you will be able to run tests on the TestObject platform, but you will not be using it to its fullest potential, as the results of the tests won't be registered in the test reports on TestObject. Don't panic though! We are working on a Test::Unit Watcher setup that will allow you to do just that.