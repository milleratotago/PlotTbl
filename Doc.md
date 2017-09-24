PlotTbl: Plot the data stored in a table

PlotTbl: Plot the data stored in a table {#plottbl-plot-the-data-stored-in-a-table align="center"}
========================================

### Jeff Miller {#jeff-miller align="center"}

<div class="p">

</div>

Contents
========

[1  Overview](#tth_sEc1)\
[2  Requirements](#tth_sEc2)\
[3  License](#tth_sEc3)\
[4  Syntax](#tth_sEc4)\
[5  Examples](#tth_sEc5)\
[6  Name-value pairs for design-element control](#tth_sEc6)\
    [6.1  Name-value pairs for line type control](#tth_sEc6.1)\
    [6.2  Name-value pairs for marker type control](#tth_sEc6.2)\
    [6.3  Name-value pairs for color control](#tth_sEc6.3)\
    [6.4  Name-value pairs for line width control](#tth_sEc6.4)\
    [6.5  Name-value pairs for marker size control](#tth_sEc6.5)\
    [6.6  Name-value pairs for subplot row and column
control](#tth_sEc6.6)\
[7  Name-value pairs for control of axis labels](#tth_sEc7)\
[8  Name-value pairs for control of legends](#tth_sEc8)\
[9  Appendix: A complete list of name-value pairs](#tth_sEc9)\

<div class="p">

</div>

[1]{#tth_sEc1}  Overview
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

[2]{#tth_sEc2}  Requirements
----------------------------

<div class="p">

</div>

You need a version of MATLAB that supports the “table” data type. You
also need my MATLAB package ExtractNameVal, which is available at
https://github.com/milleratotago/ExtractNameVal

<div class="p">

</div>

[3]{#tth_sEc3}  License
-----------------------

<div class="p">

</div>

Copyright (C) 2017, Jeff Miller

<div class="p">

</div>

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

<div class="p">

</div>

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details.

<div class="p">

</div>

You should have received a copy of the GNU General Public License along
with this program. If not, see &lt;http://www.gnu.org/licenses/&gt;.

<div class="p">

</div>

[4]{#tth_sEc4}  Syntax
----------------------

<div class="p">

</div>

PlotTbl is called with one of these four basic parameter configurations:

1.  PlotTbl(Tbl,Name,Value);
    <div class="p">

    </div>

2.  PlotTbl(Tbl,sX,sY,Name,Value);
    <div class="p">

    </div>

3.  PlotTbl(Tbl,sX,Name,Value);
    <div class="p">

    </div>

4.  PlotTbl(Tbl,sY,Name,Value);
    <div class="p">

    </div>

<div class="p">

</div>

Tbl is the data table containing the data to be plotted.

<div class="p">

</div>

sX and sY are strings indicating the names of the X and Y variables to
be plotted. These parameters *must* be omitted when the variable names
are specified by name-value pairs (see XVars and YVars below).

<div class="p">

</div>

Name,Value represents a series of name-value pair arguments.

<div class="p">

</div>

[5]{#tth_sEc5}  Examples
------------------------

<div class="p">

</div>

Suppose that you have a table AWHDat containing the average heights and
weights of male and female children of three different nationalities in
six different age groups (see PlotTblDemo.m). AWHDat.Gender is 1/2 to
code male/female, and AWHDat.Nationality is 1/2/3 to code three
nationalities (e.g., Germany, France, Spain), and AWHDat.Age holds the
ages (2, 4, 6, 8, 10, 12). The variables AWHDat.AvgWeight, and
AWHDat.AvgHeight hold the average weights and heights of the children of
each gender, nationality, and age group.

<div class="p">

</div>

Example:
*PlotTbl(AWHDat,’Age’,’AvgWeight’,’SubplotRowsCodeVar’,’Gender’,’SubplotColsCodeVar’,’Nationality’)*\

<div class="p">

</div>

This command produces a plot with six subplots (2 rows x 3 columns). The
two rows of subplots correspond to genders 1 and 2, and the three
columns correspond to the three nationalities. Each plot has Age on the
X axis and AvgWeight on the Y axis.

<div class="p">

</div>

Example:
*PlotTbl(AWHDat,’Age’,’SubplotRowsYVars’,{’AvgWeight’,’AvgHeight’},’SubplotColsCodeVar’,’Nationality’,’LineTypeCodeVar’,’Gender’)*\

<div class="p">

</div>

This produces a 6-subplot plot with plots of AvgWeight versus Age in the
top row and AvgHeight versus Age in the bottom row. The three
nationalities are the three columns. There are two lines per subplot-one
for each Gender-with the lines distinguished by line type (i.e., solid,
dashed).

<div class="p">

</div>

Example:
*PlotTbl(AWHDat,’Age’,’SubplotRowsYVars’,{’AvgWeight’,’AvgHeight’},’SubplotColsCodeVar’,’Nationality’,…
‘LineTypeCodeVar’,’Gender’,’LineTypeLegend’,{’Male’,’Female’})*\

<div class="p">

</div>

This is like the previous example except that the two Gender values are
called Male and Female in the legend.

<div class="p">

</div>

For more examples, see Demo.m.

<div class="p">

</div>

[6]{#tth_sEc6}  Name-value pairs for design-element control
-----------------------------------------------------------

<div class="p">

</div>

There are seven similar sets of name-value pair options to control the
organization of the figure in terms of its design elements, namely:

-   line types, such as solid versus dotted (LineType)
    <div class="p">

    </div>

-   marker types, such as squares versus circles (MarkerType)
    <div class="p">

    </div>

-   color (Color)
    <div class="p">

    </div>

-   line width (LineWidth)
    <div class="p">

    </div>

-   marker size (MarkerSize)
    <div class="p">

    </div>

-   subplot rows (SubplotRows)
    <div class="p">

    </div>

-   subplot columns (SubplotCols)
    <div class="p">

    </div>

<div class="p">

</div>

These are explained separately, but the most detail is provided for the
first (i.e., line type control). For examples of how the options work
together when more than one is specified, see Demo.m.

<div class="p">

</div>

### [6.1]{#tth_sEc6.1}  Name-value pairs for line type control

<div class="p">

</div>

*LineTypeCodeVar - variable name*\

<div class="p">

</div>

This option indicates that a different line type should be used for each
different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’LineTypeCodeVar’,’Gender’)*\
indicates that different line types should be used to plot the data for
males versus females.

<div class="p">

</div>

*LineTypeXVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different line types should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’LineTypeXVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different line types should be used when plotting X,Y
pairs with AvgHeight on the X axis versus with AvgWeight on the X axis.

<div class="p">

</div>

*LineTypeYVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different line types should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’LineTypeYVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different line types should be used when plotting X,Y
pairs with AvgHeight on the Y axis versus with AvgWeight on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
LineTypeCodeVar, LineTypeXVars, and LineTypeYVars. That is, line types
can only be distinguished in one way or the other-not several. If you
want the lines to be distinguished in more than one way, use other
design elements (e.g., marker types).

<div class="p">

</div>

*LineTypeSpecs - cell array of line type specifications*\
indicates that you want to replace the default set of line type
specifications with a new set. Use MATLAB’s standard line type
specifications in whatever order you prefer. The line types will be used
in order by values of the CodeVar or the order of the variables listed
for LineTypeXVars or LineTypeYVars.

<div class="p">

</div>

Example: *PlotTbl(…,’LineTypeSpecs’,{’:’ ‘-.’})*\
indicates that you want the first line to be dotted and the second line
to be dash/dot.

<div class="p">

</div>

*LineTypeLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these lines
with the new labels indicated in your cell array.

<div class="p">

</div>

Example: *PlotTbl(…,’LineTypeLegend’,{’Male’ ‘Female’})*\
indicates that you want the first line type to be labelled Male and the
second to be labelled Female. This would make sense in combination with
the option Example: *PlotTbl(…,’LineTypeCodeVar’,’Gender’)*\

<div class="p">

</div>

Note: Name-value pairs analogous to LineTypeCodeVar, LineTypeXVars,
LineTypeYVars, LineTypeSpecs, and LineTypeLegend, are available for
controlling marker types, colors, line widths, and marker sizes, as
described next. There are also very similar options for controlling
subplots.

<div class="p">

</div>

### [6.2]{#tth_sEc6.2}  Name-value pairs for marker type control

<div class="p">

</div>

*MarkerTypeCodeVar - variable name*\

<div class="p">

</div>

This option indicates that a different marker type should be used for
each different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerTypeCodeVar’,’Gender’)*\
indicates that different marker types should be used to plot the data
for males versus females.

<div class="p">

</div>

*MarkerTypeXVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different marker types should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerTypeXVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different marker types should be used when plotting X,Y
pairs with AvgHeight on the X axis versus with AvgWeight on the X axis.

<div class="p">

</div>

*MarkerTypeYVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different marker types should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerTypeYVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different marker types should be used when plotting X,Y
pairs with AvgHeight on the Y axis versus with AvgWeight on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
MarkerTypeCodeVar, MarkerTypeXVars, and MarkerTypeYVars. That is, marker
types can only be distinguished in one way or the other-not several. If
you want the markers to be distinguished in more than one way, use other
design elements (e.g., marker types).

<div class="p">

</div>

*MarkerTypeSpecs - string list of marker type specifications*\
indicates that you want to replace the default set of marker type
specifications with a new set. Use MATLAB’s standard marker type
specifications in whatever order you prefer. The marker types will be
used in order by values of the CodeVar or the order of the variables
listed for MarkerTypeXVars or MarkerTypeYVars.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerTypeSpecs’,’so\*’)*\
indicates that you want the first marker to be the square, the second to
be the circle, and the third to be the star.

<div class="p">

</div>

*MarkerTypeLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these markers
with the new labels indicated in your cell array.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerTypeLegend’,{’Male’ ‘Female’})*\
indicates that you want the first marker type to be labelled Male and
the second to be labelled Female. This would make sense in combination
with the option Example: *PlotTbl(…,’MarkerTypeCodeVar’,’Gender’)*\

<div class="p">

</div>

### [6.3]{#tth_sEc6.3}  Name-value pairs for color control

<div class="p">

</div>

*ColorCodeVar - variable name*\

<div class="p">

</div>

This option indicates that a different color should be used for each
different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’ColorCodeVar’,’Gender’)*\
indicates that different colors should be used to plot the data for
males versus females.

<div class="p">

</div>

*ColorXVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different colors should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’ColorXVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different colors should be used when plotting X,Y pairs
with AvgHeight on the X axis versus with AvgWeight on the X axis.

<div class="p">

</div>

*ColorYVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different colors should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’ColorYVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different colors should be used when plotting X,Y pairs
with AvgHeight on the Y axis versus with AvgWeight on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
ColorCodeVar, ColorXVars, and ColorYVars.

<div class="p">

</div>

*ColorSpecs - string list of colors*\
indicates that you want to replace the default set of colors with a new
set. The colors will be used in order by values of the CodeVar or the
order of the variables listed for ColorXVars or ColorYVars.

<div class="p">

</div>

Example: *PlotTbl(…,’ColorSpecs’,’rgbk’)*\
indicates that you want the first line to be red, the second green, the
third blue, etc. Use MATLAB’s standard color codes.

<div class="p">

</div>

*ColorLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these lines
with the new labels indicated in your cell array.

<div class="p">

</div>

Example: *PlotTbl(…,’ColorLegend’,{’Male’ ‘Female’})*\
indicates that you want the first color to be labelled Male and the
second to be labelled Female. This would make sense in combination with
the option Example: *PlotTbl(…,’ColorCodeVar’,’Gender’)*\

<div class="p">

</div>

### [6.4]{#tth_sEc6.4}  Name-value pairs for line width control

<div class="p">

</div>

*LineWidthCodeVar - variable name*\

<div class="p">

</div>

This option indicates that a different line width should be used for
each different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’LineWidthCodeVar’,’Gender’)*\
indicates that different line widths should be used to plot the data for
males versus females.

<div class="p">

</div>

*LineWidthXVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different line widths should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’LineWidthXVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different line widths should be used when plotting X,Y
pairs with AvgHeight on the X axis versus with AvgWeight on the X axis.

<div class="p">

</div>

*LineWidthYVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different line widths should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’LineWidthYVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different line widths should be used when plotting X,Y
pairs with AvgHeight on the Y axis versus with AvgWeight on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
LineWidthCodeVar, LineWidthXVars, and LineWidthYVars.

<div class="p">

</div>

*LineWidthSpecs - vector of line widths*\
indicates that you want to replace the default set of line widths with a
new set. The line widths will be used in order by values of the CodeVar
or the order of the variables listed for LineWidthXVars or
LineWidthYVars.

<div class="p">

</div>

Example: *PlotTbl(…,’LineWidthSpecs’,\[3 5 8 12\])*\
indicates that you want the first line to have width 3, the second width
5, etc.

<div class="p">

</div>

*LineWidthLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these lines
with the new labels indicated in your cell array.

<div class="p">

</div>

Example: *PlotTbl(…,’LineWidthLegend’,{’Male’ ‘Female’})*\
indicates that you want the first line width to be labelled Male and the
second to be labelled Female. This would make sense in combination with
the option Example: *PlotTbl(…,’LineWidthCodeVar’,’Gender’)*\

<div class="p">

</div>

### [6.5]{#tth_sEc6.5}  Name-value pairs for marker size control

<div class="p">

</div>

*MarkerSizeCodeVar - variable name*\

<div class="p">

</div>

This option indicates that a different marker size should be used for
each different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerSizeCodeVar’,’Gender’)*\
indicates that different marker sizes should be used to plot the data
for males versus females.

<div class="p">

</div>

*MarkerSizeXVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different marker sizes should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerSizeXVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different marker sizes should be used when plotting X,Y
pairs with AvgHeight on the X axis versus with AvgWeight on the X axis.

<div class="p">

</div>

*MarkerSizeYVars - cell array of variable names*\

<div class="p">

</div>

This option indicates that different marker sizes should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerSizeYVars’,{’AvgHeight’ ‘AvgWeight’})*\
indicates that different marker sizes should be used when plotting X,Y
pairs with AvgHeight on the Y axis versus with AvgWeight on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
MarkerSizeCodeVar, MarkerSizeXVars, and MarkerSizeYVars.

<div class="p">

</div>

*MarkerSizeSpecs - vector of marker sizes*\
indicates that you want to replace the default set of marker sizes with
a new set. The marker sizes will be used in order by values of the
CodeVar or the order of the variables listed for MarkerSizeXVars or
MarkerSizeYVars.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerSizeSpecs’,\[3 5 8 12\])*\
indicates that you want the first line to have width 3, the second width
5, etc.

<div class="p">

</div>

*MarkerSizeLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these lines
with the new labels indicated in your cell array.

<div class="p">

</div>

Example: *PlotTbl(…,’MarkerSizeLegend’,{’Male’ ‘Female’})*\
indicates that you want the first marker size to be labelled Male and
the second to be labelled Female. This would make sense in combination
with the option Example: *PlotTbl(…,’MarkerSizeCodeVar’,’Gender’)*\

<div class="p">

</div>

### [6.6]{#tth_sEc6.6}  Name-value pairs for subplot row and column control

<div class="p">

</div>

*SubplotRowsCodeVar - variable name*\
*SubplotColsCodeVar - variable name*\

<div class="p">

</div>

Each of these options indicates that a different subplot row or column
should be used for each different value of the indicated variable. The
variable name is specified as a character vector, say sVar.

<div class="p">

</div>

Example: *PlotTbl(…,’SubplotRowsCodeVar’,’Gender’)*\
indicates that the data for males and females should be plotted in two
different rows of subplots.

<div class="p">

</div>

*SubplotRowsXVars - cell array of variable names*\
*SubplotColsXVars - cell array of variable names*\

<div class="p">

</div>

Each of these options indicates that a different subplot row or column
should be used for X/Y plots with each of the indicated variable names
on the X axis.

<div class="p">

</div>

*SubplotRowsYVars - cell array of variable names*\
*SubplotColsYVars - cell array of variable names*\

<div class="p">

</div>

Each of these options indicates that a different subplot row or column
should be used for X/Y plots with each of the indicated variable names
on the Y axis.

<div class="p">

</div>

Note: You should only ever specify *at most* one of the three options
SubplotRowsCodeVar, SubplotRowsXVars, and SubplotRowsYVars, and
correspondingly only one of the SubplotCols options. But you can specify
both SubplotRows and SubplotCols in any combination that you want, since
these are independent “design elements” of the display (in the same
sense that the line type and color are independent).

<div class="p">

</div>

Note: Extrapolating from the previous options, you might expect there to
be SubplotRowsSpecs and SubplotColsSpecs options, but these do not
exist.

<div class="p">

</div>

*SubplotRowsLegend - cell array of legend labels*\
*SubplotColsLegend - cell array of legend labels*\
indicates that you want to replace the default labels of these subplots
with the new labels indicated in your cell array. (Strictly speaking,
these are not legends, but rather titles at the tops of the subplots.)

<div class="p">

</div>

Example: *PlotTbl(…,’SubplotRowsLegend’,{’Male’ ‘Female’})*\
indicates that you want the first subplot to be labelled Male and the
second to be labelled Female. This would make sense in combination with
the option Example: *PlotTbl(…,’SubplotRowsCodeVar’,’Gender’)*\

<div class="p">

</div>

[7]{#tth_sEc7}  Name-value pairs for control of axis labels
-----------------------------------------------------------

<div class="p">

</div>

*XLabel - vector of subplot numbers*\
*YLabel - vector of subplot numbers*\

<div class="p">

</div>

Example: *PlotTbl(…,’XLabel’,\[7 8 9\],’YLabel’,\[1 4 7)*\
With a 3x3 arrangement of subplots, this would label the X axes of the
plots in the bottom row and it would label the Y axes of the subplots in
the left-most column.

<div class="p">

</div>

<div class="p">

</div>

[8]{#tth_sEc8}  Name-value pairs for control of legends
-------------------------------------------------------

<div class="p">

</div>

*Legend - vector of subplot numbers*\
A list of the numbers

<div class="p">

</div>

*LegendLoc -*\

<div class="p">

</div>

*LegendPos - \[left bottom width height\]*\

<div class="p">

</div>

*LegendBox - true or false*\
indicates whether you want the box on the legend(s). I hate them, so the
default is false.

<div class="p">

</div>

[9]{#tth_sEc9}  Appendix: A complete list of name-value pairs
-------------------------------------------------------------

<div class="p">

</div>

*ColorCodeVar - variable name*\
*ColorLegend - cell array of legend labels*\
*ColorSpecs - string list of colors*\
*ColorXVars - cell array of variable names*\
*ColorYVars - cell array of variable names*\
*LegendBox - true or false*\
*LegendLoc -*\
*LegendPos - \[left bottom width height\]*\
*Legend - vector of subplot numbers*\
*LineTypeCodeVar - variable name*\
*LineTypeLegend - cell array of legend labels*\
*LineTypeSpecs - cell array of line type specifications*\
*LineTypeXVars - cell array of variable names*\
*LineTypeYVars - cell array of variable names*\
*LineWidthCodeVar - variable name*\
*LineWidthLegend - cell array of legend labels*\
*LineWidthSpecs - vector of line widths*\
*LineWidthXVars - cell array of variable names*\
*LineWidthYVars - cell array of variable names*\
*MarkerSizeCodeVar - variable name*\
*MarkerSizeLegend - cell array of legend labels*\
*MarkerSizeSpecs - vector of marker sizes*\
*MarkerSizeXVars - cell array of variable names*\
*MarkerSizeYVars - cell array of variable names*\
*MarkerTypeCodeVar - variable name*\
*MarkerTypeLegend - cell array of legend labels*\
*MarkerTypeSpecs - string list of marker type specifications*\
*MarkerTypeXVars - cell array of variable names*\
*MarkerTypeYVars - cell array of variable names*\
*SubplotColsCodeVar - variable name*\
*SubplotColsLegend - cell array of legend labels*\
*SubplotColsXVars - cell array of variable names*\
*SubplotColsYVars - cell array of variable names*\
*SubplotRowsCodeVar - variable name*\
*SubplotRowsLegend - cell array of legend labels*\
*SubplotRowsXVars - cell array of variable names*\
*SubplotRowsYVars - cell array of variable names*\
*XLabel - vector of subplot numbers*\
*YLabel - vector of subplot numbers*\

<div class="p">

</div>

\
\

------------------------------------------------------------------------

File translated from T~E~X by
[T~T~Hgold](http://hutchinson.belmont.ma.us/tth/), version 4.00.\
On 24 Sep 2017, 10:20.
