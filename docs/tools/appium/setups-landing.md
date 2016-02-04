---
title: Setting up your Tests
layout: en
permalink: docs/tools/appium/setups/
alias: /docs/tools/appium/setup/
---
<h3>Running your Appium tests on TestObject</h3>

It is possible to run Appium tests on TestObject using different languages, testing frameworks and approaches. Here you can find a list of sample test setups we recommend to our customers. For every language/framework, they are listed in order of growing complexity, with a more complex setup usually granting more advanced functionality.

<h4 id="java">Java</h4>
Java is the first language we chose to support for running tests on our platform. We currently support both <a href="http://junit.org/">JUnit</a> and <a href="http://testng.org/doc/index.html">TestNG</a>, with JUnit boasting the user-friendly, GUI-based <a href="junit/suites#suite-setup">Suite Setup</a>.

<ul>
    <li>JUnit<ul>
      <li><a href="junit/basic">Basic Setup</a></li>
      <li><a href="junit/watcher">Watcher Setup</a></li>
      <li><a href="junit/suites">Suite Setup</a></li>
    </ul></li>
</ul>
<ul>
    <li>TestNG<ul>
      <li><a href="testng/basic">Basic Setup</a></li>
      <li><a href="testng/watcher">Watcher Setup</a></li>
    </ul></li>
</ul>

<h4 id="ruby">Ruby</h4>
Ruby is our most recent addition as for supported languages for Appium tests. As a first framework, we have chosen <a href="https://github.com/test-unit/test-unit">Test::Unit</a>.

<ul>
    <li>Test::Unit<ul>
      <li><a href="testunit/basic">Basic Setup</a></li>
      <li><a href="testunit/watcher">Watcher Setup</li>
    </ul></li>
</ul>
