---
title: Assertion Builder
layout: en
permalink: docs/guides/recorder/assertion-builder/
alias: docs/references/recorder/assertion-builder/
---

This dialog assists you in creating assertions for a specific screenshot. An assertion makes sure that a locator vanishes from or appears on the screen. It is an API call of either the <a href="/docs/api/locator#waitVanish">waitVanish</a> or the <a href="/docs/api/locator#waitAppear">waitAppear</a> function. For each locator that has been picked it creates a new line in the script.

<strong>Pick locators:</strong> Select a locator on the screen. It will then be staged for insertion into the script.

<strong>Move and resize:</strong> Click on a locator and move it around or pull on its edges to resize the box.

<strong>Draw new:</strong> Draw a new locator box. This automatically picks the locator and thus stages it for insertion into the script.

<strong>Delete:</strong> Click on a locator to remove it from the screen.


<h3 id="vanish">Vanishing Locators</h3>
In this tab pick locators that are visible on the shown screen but should not be visible on the next screen anymore. For each locator that has been picked a <a href="/docs/api/locator#waitVanish">waitVanish</a> assertion will be added to the script.


<h3 id="appear">Appearing Locators</h3>
In this tab pick locators that have to be visible on the shown screen but were not visible on the previous screen. For each locator that has been picked a <a href="/docs/api/locator#waitAppear">waitAppear</a> assertion will be added to the script.
