---
title: Basic Setup on TestObject using WebdriverIO
layout: en
permalink: docs/tools/appium/setups/basic-setup/webdriverio/
---

<a href="http://webdriver.io" target="_blank">WebdriverIO</a> is a powerful framework for web testing. Web tests written using WebdriverIO can easily be configured to run on real mobile devices on TestObject. You can find a working example for running WebdriverIO tests on our github page: <a href="https://github.com/testobject/webdriverio-example" target="_blank">TestObject WebdriverIO example</a>.

To begin testing, you will first need to create a configuration file for your tests. You can call this file 'wdio.conf.js' and it should look like this:

{% highlight javascript %}
var config = {
	protocol: 'https',
	host: 'app.testobject.com',
	port: '443',
	path: '/api/appium/wd/hub',
	capabilities: [{
		testobject_api_key: 'YOUR API KEY'
		testobject_device: 'Motorola_Moto_G_2nd_gen_real'
		browserName: 'Chrome'
	}],

	specs: [
		'./specs/**/*.js'
	],

	sync: true,
	logLevel: 'verbose',
	coloredLogs: true,
	screenshotPath: './errorShots/',
	waitforTimeout: 10000,
	connectionRetryTimeout: 10 * 60000,
	connectionRetryCount: 3,
	framework: 'mocha',
	mochaOpts: {
		ui: 'bdd',
		enableTimeouts: false
	}
}

exports.config = config
{% endhighlight %}

You will need to edit the `testobject_api_key` value in this file to specify your API key. You can also adjust the `testobject_device` value to choose a device for testing.

After setting up our configuration file, we will also need to create a 'package.json' file to specify dependencies. The contents of 'package.json' should look as follows:

{% highlight javascript %}
{
	"name": "testobject-web-test",
	"version": "0.0.1",
	"scripts": {
		"test": "./node_modules/.bin/wdio wdio.conf.js"
	},
	"dependencies": {
		"webdriverio": "4.0.7",
		"wdio-mocha-framework": "0.2.13",
		"selenium-standalone": "5.1.0"
	}
}
{% endhighlight %}

If you need any additional dependencies for your tests, you can add them to the above file.

Finally, we can create our first test file. In wdio.conf.js, we configured our test runner to run all tests in the 'specs' directory, so we will place our test in 'specs/test.js' with the following contents:

{% highlight javascript %}
var assert = require('assert');

describe('TestObject website', function() {
	before(function() {
		browser.timeouts('implicit', 10000);
		browser.url('https://testobject.com');
	});

	it('Opens features page', function() {
		var learnMore = "//a[contains(text(), 'Learn More')]";
		browser.scroll(learnMore);
		browser.element(learnMore).click();
		var pageUrl = browser.getUrl();
		assert.equal(pageUrl, "https://testobject.com/features")
	});
});
{% endhighlight %}

Now that all of the necessary files have been created, it is possible to run the tests. First, install the dependencies by running `npm install`. Next, run the tests by running `npm test`.

In our wdio.conf.js file, we specified the mandatory capabilities `testobject_api_key` and `testobject_device`. Along with the mandatory capabilities we have specified, you can send over some optional ones to customize your test runs:

* <strong>testobject_app_id</strong>, if you want to use an app version other than the active one.
* <strong>testobject_appium_version</strong>, if you want to run your tests against an Appium version other than the default one.
* <strong>testobject_suite_name</strong>, if you want to apply a label to your tests so that they are easier to group / find later on.
* <strong>testobject_test_name</strong>, if you want to specify a name for your test that will be displayed in place of the default one.
