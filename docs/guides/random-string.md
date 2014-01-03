---
title: Generating random strings
layout: en
permalink: docs/guides/random-strings/	
---

This guide assumes that you are familliar with [Creating tests](/docs/getting-started/first-test/ "First test").
### Step 1: Include an external random string generator script

Here we will create a helper script to include in test scripts, which will provide us methods to generate strings.  
This script doesn't use a device and it is pure javascript, so when creating the test for it (in the following steps), it doesn't matter which device you choose.  

1. Create a new test for the external script and give it a meaningful name ('string_generator' could be a good choice).  
2. Delete any code lines from the script so that it would be completely empty.  
3. Copy the script from <a href="https://gist.github.com/aluedeke/7100091/raw/1f57040b680c37c9f084e78b301cf579b8a4ce35/custom+chance.js" target="_blank">this link</a> and paste it to your empty script. 

### Step 2: Import the random generator script

1. Go to the test where you want to use the string generator.  
2. <a href="docs/api/scripting/#importScript" target="_blank">import</a> the script created in step 1.  

### Step 3: Generate random strings

The library we included if very comprehensive and can generate all kinds of random data.  
Some examples:  

{% highlight groovy %}
importScript(24) // string_generator

// generate a random string
var string = window.chance.string();
=> 'Z&Q78&fqkPq'

// generate a random string with length 5
var string = window.chance.string({length: 5});
=> 'YN%fG'

// generate a random email
var email = window.chance.email();
=> 'kawip@piklojzob.gov'

// generate a random email with specific domain
var email = window.chance.email({domain: 'example.com'});
=> 'giigjom@example.com'

// generate a random date
var email = window.chance.date();
=> Sat Apr 09 2072 00:00:00 GMT-0400 (EDT)
{% endhighlight %}

For all the methods and options, see the <a href="http://chancejs.com/#basics" target="_blank"> complete reference</a>.
