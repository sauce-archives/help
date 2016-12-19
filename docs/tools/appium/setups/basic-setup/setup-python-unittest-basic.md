---
title: Basic Setup on TestObject using Python
layout: en
permalink: docs/tools/appium/setups/basic-setup/python-unittest/
---
Appium tests can be written in Python and conveniently run on TestObject. In this example, we will be using <a href="https://docs.python.org/2/library/unittest.html" target="blank">unittest</a>, the first testing framework included in Python standard library and it is easy to use by people familiar with the xUnit frameworks. Currently, only the basic setup is supported. This means that you can run your tests on TestObject, but the result of the test (whether it passed or failed) won't be visible from the test report on TestObject.

To get started, you need to have <a href="https://www.python.org/downloads/" target="blank">Python</a> downloaded and installed on your computer, and an environment variable referring to the python folder must be added too.
After that, install <a href="https://pypi.python.org/pypi/selenium" target="blank">Selenium</a> and <a href="https://github.com/appium/python-client" target="blank">Appium-Python-Client</a> to use them for your test. It is possible to do that using `pip` or `pip3` depending on which version of python is installed:

{% highlight python %}
pip3 install -U selenium
pip3 install Appium-Python-Client
{% endhighlight %}

Now, you are able to write a basic test setup with *Python* and *unittest* and it could look like this:

{% highlight python %}
import unittest
from appium import webdriver

class TestClass(unittest.TestCase):

    def setUp(self):
        desired_capabilities = {}
        desired_capabilities['testobject_api_key'] = 'your TestObject API key here'
        desired_capabilities['testobject_device'] = 'LG_Nexus_4_E960_real'
        desired_capabilities['testobject_appium_version'] = '1.5.2-patched-chromedriver'
        testobject_endpoint = 'http://appium.testobject.com:80/api/appium/wd/hub'
        self.driver = webdriver.Remote(testobject_endpoint, desired_capabilities)

    # All test methods starts with the word "test_"
    def test_open_testobject_website(self):
        self.driver.get("https://testobject.com/")
        if not "TestObject" in self.driver.title:
            raise Exception("Unable to load TestObject")

    def tearDown(self):
        self.driver.quit()

# This will trigger the test
if __name__ == '__main__':
    unittest.main()
{% endhighlight %}

Along with the mandatory capabilities we have specified, you can send over some optional ones to customize your test runs:

* **testobject_app_id**, if you want to use an app version other than the active one.
* **testobject_appium_version**, if you want to run your tests against an Appium version other than the default one.
* **testobject_suite_name**, if you want to apply a label to your tests so that they are easier to group / find later on.
* **testobject_test_name**, if you want to specify a name for your test that will be displayed in place of the default one.

####Run the test
The easiest way to run the tests is to open your python test file with IDLE - Python and click on the *Run* tab from the top menu then, select the *Run Module* from the list. At the end, you will be able to see the test result on IDLE directly as soon as the test is done. 

For more information about writing your tests with unittest framework, check this <a href="https://docs.python.org/2/library/unittest.html" target="blank">link</a>.

***
***
***
