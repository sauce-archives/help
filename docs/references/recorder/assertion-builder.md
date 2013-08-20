---
title: Assertion Builder
layout: en
permalink: docs/references/recorder/assertion-builder/
---

This dialog assists you in creating assertions for a specific screenshot. An assertion makes sure that a locator vanishes from or appears on the screen. It is an API call of either the <a href="/docs/references/scripting-api/locator#waitVanish">waitVanish</a> or the <a href="/docs/references/scripting-api/locator#waitAppear">waitAppear</a> function. For each locator that has been picked it creates a new line in the script.

<p><strong>Pick locators:</strong> Select a locator on the screen. It will then be staged for insertion into the script.</p>
<p><strong>Move and resize:</strong> Click on a locator and move it around or pull on its edges to resize the box.</p>
<p><strong>Draw new:</strong> Draw a new locator box. This automatically picks the locator and thus stages it for insertion into the script.</p>
<p><strong>Delete:</strong> Click on a locator to remove it from the screen.</p>

<h3 id="vanish"><a href="#vanish">Vanishing Locators</a></h3>
<p>In this tab pick locators that are visible on the shown screen but should not be visible on the next screen anymore. For each locator that has been picked a <a href="/docs/references/scripting-api/locator#waitVanish">waitVanish</a> assertion will be added to the script.</p>

<h3 id="appear"><a href="#appear">Appearing Locators</a></h3>
<p>In this tab pick locators that have to be visible on the shown screen but were not visible on the previous screen. For each locator that has been picked a <a href="/docs/references/scripting-api/locator#waitAppear">waitAppear</a> assertion will be added to the script.</p>
