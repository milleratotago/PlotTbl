# PlotTbl
MATLAB function for plotting data in table

[1]  Overview
------------------------

<div class="p">

</div>

PlotTbl is a general-purpose function for creating a figure from data
stored in a table. It was designed to be used with tables in which some
variables hold the X/Y values to be plotted and other variables hold
numeric codes that distinguish different conditions. With such data,
PlotTbl makes it easy to make plots showing X/Y relationships for each
condition separately, with different conditions distinguished by being
in different subplots, different line types (e.g., solid/dashed),
different marker types, different colors, etc. Some options are provided
for control over titles, X and Y axis labels, legends, etc.

<div class="p">

</div>

Users needing even more fine-grained control over individual subplots
can call the function SubplotTbl, which plots only one subplot within a
subplot-type figure.

<div class="p">

</div>

[2]  Requirements
----------------------------

<div class="p">

</div>

You need a version of MATLAB that supports the “table” data type. You
also need my MATLAB package ExtractNameVal, which is available at
https://github.com/milleratotago/ExtractNameVal

<div class="p">

[3]  Example plots
----------------------------

Demo figure 1:

![fig1](https://user-images.githubusercontent.com/18093640/30787930-220c45f2-a1f0-11e7-9089-8f521597955c.jpg)

Demo figure 2:

