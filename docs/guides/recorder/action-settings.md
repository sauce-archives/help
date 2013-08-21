---
title: Action Settings
layout: en
permalink: docs/guides/recorder/action-settings/
---

This dialog assists you in editing the settings of an action or assertion. Those are an API call of either the <a href="/docs/api/input#click-box">click on box</a>, <a href="/docs/api/input#longPress-box">longPress on box</a>, <a href="/docs/api/input#click-position">click on position</a>, <a href="/docs/api/input#longPress-position">longPress on position</a>, <a href="/docs/api/locator#find">find</a>, <a href="/docs/api/locator#waitVanish">waitVanish</a> or <a href="/docs/api/locator#waitAppear">waitAppear</a> function. It updates the respective line in the script.


<h3 id="locator">Adjust Locator</h3>
<strong>Click strategy:</strong> Select the strategy to be used for performing the click or long press. Using the <em>click on box</em> strategy, the selected box is first matched and then the click is performed on a positon relative to the box which is indicated by the blue dot - see <em>set offset</em>. Using the <em>click on position</em> strategy, the click is performed on a position relative to the whole screen - see <em>set position</em>.

<strong>Move and resize:</strong> Click on the locator and move it around or pull on its edges to resize the box.

<strong>Draw new:</strong> Draw a new locator box. This replaces the previous box.

<strong>Set offset:</strong> Set the position on the screen - relative to the locator box - on which the click should be performed.

<strong>Set position:</strong> Set the position - relative to the whole screen - on which the click should be performed.


<h3 id="timeout">Set Timeout</h3>
The timeout specifies the amount of time during which the system tries to match the locator on the screen during replay. As soon as a match was found the click is executed. If no match could be found during this time, the step will fail. For a <a href="/docs/api/input#click-locator">click</a> or <a href="/docs/api/input#longPress-locator">longPress</a> this only applies if the <em>click on box</em> strategy is selected.


<h3 id="matching">Fine-tune Matching</h3>
The matching value specifies the precision for matching the locator on the screen during replay. Setting the value to 1 means that only an exact match will be considered valid. For a lower the value locators that are less similar to the original will be matched. Setting the value to 0 means that even very different locators will be matched. The screenshots shown as preview are taken on the current device screen when moving the slider. <a href="http://help.testobject.com/docs/references/image-matching#fine-tune-matching">Read more...</a>
