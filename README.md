# PlotTbl
MATLAB function for plotting data in table

[1]  Overview
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

[2]  Requirements
----------------------------

<div class="p">

</div>

You need a version of MATLAB that supports the “table” data type. You
also need my MATLAB package ExtractNameVal, which is available at
https://github.com/milleratotago/ExtractNameVal

<div class="p">


[3]  Example plots
----------------------------

Except as noted otherwise, each of these plots was made with a single PlotTbl call.

Demo figure 1:

![fig1](https://user-images.githubusercontent.com/18093640/30787930-220c45f2-a1f0-11e7-9089-8f521597955c.jpg)

Demo figure 2:

![fig2](https://user-images.githubusercontent.com/18093640/30787960-c568ad44-a1f0-11e7-89cd-0b0689b5f344.jpg)

Demo figure 3:

![fig3](https://user-images.githubusercontent.com/18093640/30787969-cedf75b0-a1f0-11e7-8eea-e8d416dd0823.jpg)

Demo figure 4:

![fig4](https://user-images.githubusercontent.com/18093640/30787968-cedf12f0-a1f0-11e7-8a2a-1364123f91bb.jpg)

Demo figure 5:

![fig5](https://user-images.githubusercontent.com/18093640/30787967-cedec6ba-a1f0-11e7-8434-2cd604f17d99.jpg)

Demo figure 6:

![fig6](https://user-images.githubusercontent.com/18093640/30787970-cedf9db0-a1f0-11e7-8988-a6c3c63e4aa2.jpg)

Demo figure 7:

![fig7](https://user-images.githubusercontent.com/18093640/30787966-cedea9f0-a1f0-11e7-99f1-7db57f1f0c39.jpg)

Demo figure 8 (made with 2 SubplotTbl calls):

![fig8](https://user-images.githubusercontent.com/18093640/30787965-cede3df8-a1f0-11e7-8813-98c15bfa26f7.jpg)
