Overview
========

PlotTbl is a general-purpose function for creating a figure from data
stored in a table. It was designed to be used with tables in which some
variables hold the X/Y values to be plotted and other variables hold
numeric codes that distinguish different conditions. With such data,
PlotTbl makes it easy to plot X/Y relationships for each condition
separately, with different conditions distinguished by different line
types (e.g., solid/dashed), marker types, colors, subplots, etc. Many
options are provided for control over titles, X and Y axis labels,
legends, etc.

Screenshots in the README.md file on GitHub show a set of example
figures produced with a data table. All but one of the figures were
produced by a single PlotTbl function call.

Users needing even more fine-grained control over individual subplots
can call the function SubplotTbl, which plots only one subplot within a
subplot-type figure.

Requirements
============

You need a version of MATLAB that supports the “table” data type. You
also need my MATLAB package ExtractNameVal available at
https://github.com/milleratotago/ExtractNameVal

License
=======

Copyright (C) 2017, Jeff Miller

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details.

You should have received a copy of the GNU General Public License along
with this program. If not, see http://www.gnu.org/licenses/

Syntax
======

PlotTbl is called with one of these four basic parameter configurations:

1.  PlotTbl(Tbl,Name,Value);

2.  PlotTbl(Tbl,sX,sY,Name,Value);

3.  PlotTbl(Tbl,sX,Name,Value);

4.  PlotTbl(Tbl,sY,Name,Value);

Tbl is the data table containing the data to be plotted.

sX and sY are strings indicating the names of the X and Y variables to
be plotted. In some cases the X and/or Y variable names are specified by
name-value pairs (see various option names ending in XVars and YVars
below), and in these cases the sX and/or sY parameters *must* be
omitted.

Name,Value represents a series of name-value pair arguments.

Examples
========

Suppose that you have a table AHWDat containing the average heights and
weights of male and female children of three different nationalities in
six different age groups (see Demo.m). Here is the format of the table
(the heights and weights are not intended to be realistic):


| Age | Gender | Nationality | AvgHeight | AvgWeight |
|:---:|:------:|:-----------:|:---------:|:---------:|
|  2  |    1   |      1      |    114    |     66    |
|  2  |    1   |      2      |    116    |     64    |
|  2  |    1   |      3      |    111    |     68    |
|  2  |    2   |      1      |    125    |     73    |
|  2  |    2   |      2      |    124    |     75    |
|  2  |    2   |      3      |    122    |     75    |
|  4  |    1   |      1      |    117    |     72    |
|  4  |    1   |      2      |    118    |     72    |
|  …  |    …   |      …      |     …     |     …     |
  ----- -------- ------------- ----------- ----------- --

AHWDat.Gender is 1/2 to code male/female, and AHWDat.Nationality is
1/2/3 to code three nationalities (e.g., Germany, France, Spain), and
AHWDat.Age holds the ages (2, 4, 6, 8, 10, 12). The variables
AHWDat.AvgWeight, and AHWDat.AvgHeight hold the average weights and
heights of the children of each gender, nationality, and age group.
Example:
*PlotTbl(AHWDat,’Age’,’AvgWeight’,’SubplotRowsCodeVar’,’Gender’,’SubplotColsCodeVar’,’Nationality’)*

This command produces a figure with six subplots (2 rows x 3 columns).
The two rows of subplots correspond to genders 1 and 2, and the three
columns of subplots correspond to the three nationalities. Each plot has
Age on the X axis and AvgWeight on the Y axis.

Example:
*PlotTbl(AHWDat,’Age’,’SubplotRowsYVars’,{’AvgWeight’,’AvgHeight’},…\
’SubplotColsCodeVar’,’Nationality’,’LineTypeCodeVar’,’Gender’)*

This command produces a figure with 6 subplots of AvgWeight versus Age
in the top row and AvgHeight versus Age in the bottom row. The three
nationalities are the three columns of subplots. There are two lines per
subplot—one for each Gender—with the lines distinguished by line type
(i.e., solid, dashed).

Example:
*PlotTbl(AHWDat,’Age’,’SubplotRowsYVars’,{’AvgWeight’,’AvgHeight’},…\
’SubplotColsCodeVar’,’Nationality’,’LineTypeCodeVar’,’Gender’,’LineTypeLegend’,{’Male’,’Female’})*

This command produces the same plot as the previous one except that the
two Gender values are specified as “Male” and “Female” in the legend.

For more examples, see Demo.m.

Name-value Pairs for Design Element Control
===========================================

It is convenient to consider the name-value pairs as falling into three
groups: design element control, axis control, and legend control. The
largest and most important group provides design element control.

There are seven sets of name-value pair options to control the
organization of the figure in terms of its design elements, namely:

-   line types, such as solid versus dotted (LineType)

-   marker types, such as squares versus circles (MarkerType)

-   color (Color)

-   line width (LineWidth)

-   marker size (MarkerSize)

-   subplot rows (SubplotRows)

-   subplot columns (SubplotCols)

All seven are controlled with basically the same set of options.

Name-value pairs for line type control
--------------------------------------

Name-value pair: *LineTypeCodeVar — variable name*

This name-value pair indicates that a different line type should be used
for each different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

Example: *PlotTbl(…,’LineTypeCodeVar’,’Gender’)*

In this example different line types will be used to plot the data for
males versus females (i.e., Gender==1 versus Gender==2).

Name-value pair: *LineTypeXVars — cell array of variable names*

This name-value pair indicates that different line types should be used
to distinguish different variables in the table, with those variables
being used as X’s in the X/Y plots.

Example: *PlotTbl(…,’LineTypeXVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different line types will be used to distinguish lines
whose X values are AvgHeight versus lines whose X values are AvgWeight.

Name-value pair: *LineTypeYVars — cell array of variable names*

This name-value pair indicates that different line types should be used
to distinguish different variables in the table, with those variables
being used as Y’s in the X/Y plots.

Example: *PlotTbl(…,’LineTypeYVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different line types will be used to distinguish lines
whose Y values are AvgHeight versus lines whose Y values are AvgWeight.

Note: You should never specify *more than one* of the three options
LineTypeCodeVar, LineTypeXVars, and LineTypeYVars. That is, line types
can only be distinguished in one way or the other—not several. If you
want the line types to be distinguished in more than one way, use other
design elements.

Name-value pair: *LineTypeSpecs — cell array of line type
specifications*

This name-value pair indicates that you want to replace PlotTbl’s
default set of line type specifications with a new set. Use MATLAB’s
standard line type specifications in whatever order you prefer. The line
types will be used in order by values of the CodeVar or the order of the
variables listed for LineTypeXVars or LineTypeYVars.

Example: *PlotTbl(…,’LineTypeSpecs’,{’:’ ’-.’})*

In this example the first line will be dotted and the second line will
be dash/dot.

Name-value pair: *LineTypeLegend — cell array of legend labels*

This name-value pair indicates that you want to replace PlotTbl’s
default labels of the line types with the new labels indicated in your
cell array.

Example: *PlotTbl(…,’LineTypeLegend’,{’Male’ ’Female’})*

In this example the legends for the first and second line types will be
“Male” and “Female”, respectively, rather than the defaults of
“Gender=1” and “Gender=2”. Obviously, this option would make sense if
used in combination with the name-value pair
“’LineTypeCodeVar’,’Gender”’.

Note: Name-value pairs analogous to LineTypeCodeVar, LineTypeXVars,
LineTypeYVars, LineTypeSpecs, and LineTypeLegend, are available for
controlling marker types, colors, line widths, marker sizes, and
subplots as described in the following subsections.

Name-value pairs for marker type control
----------------------------------------

Name-value pair: *MarkerTypeCodeVar — variable name*

This name-value pair indicates that a different marker type should be
used for each different value of the indicated variable. The variable
name is specified as a character vector, say sVar.

Example: *PlotTbl(…,’MarkerTypeCodeVar’,’Gender’)*

In this example different marker types will be used to plot the data for
males versus females (i.e., Gender==1 versus Gender==2).

Name-value pair: *MarkerTypeXVars — cell array of variable
names*

This name-value pair indicates that different marker types should be
used to distinguish different variables in the table, with those
variables being used as X’s in the X/Y plots.

Example: *PlotTbl(…,’MarkerTypeXVars’,{’AvgHeight’
’AvgWeight’})*

In this example different marker types will be used to distinguish lines
whose X values are AvgHeight versus lines whose X values are AvgWeight.

Name-value pair: *MarkerTypeYVars — cell array of variable
names*

This name-value pair indicates that different marker types should be
used to distinguish different variables in the table, with those
variables being used as Y’s in the X/Y plots.

Example: *PlotTbl(…,’MarkerTypeYVars’,{’AvgHeight’
’AvgWeight’})*

In this example different marker types will be used to distinguish lines
whose Y values are AvgHeight versus lines whose Y values are AvgWeight.

Note: You should never specify *more than one* of the three options
MarkerTypeCodeVar, MarkerTypeXVars, and MarkerTypeYVars. That is, marker
types can only be distinguished in one way or the other—not several. If
you want the marker types to be distinguished in more than one way, use
other design elements.

Name-value pair: *MarkerTypeSpecs — string list of marker type
specifications*

This name-value pair indicates that you want to replace PlotTbl’s
default set of marker type specifications with a new set. Use MATLAB’s
standard marker type specifications in whatever order you prefer. The
marker types will be used in order by values of the CodeVar or the order
of the variables listed for MarkerTypeXVars or MarkerTypeYVars.

Example: *PlotTbl(…,’MarkerTypeSpecs’,’so\*’)*

In this example the first marker will be the square, the second will be
the circle, and the third will be the asterisk.

Name-value pair: *MarkerTypeLegend — cell array of legend
labels*

This name-value pair indicates that you want to replace PlotTbl’s
default labels of the marker types with the new labels indicated in your
cell array.

Example: *PlotTbl(…,’MarkerTypeLegend’,{’Male’ ’Female’})*

In this example the legends for the first and second marker types will
be “Male” and “Female”, respectively, rather than the defaults of
“Gender=1” and “Gender=2”. Obviously, this option would make sense if
used in combination with the name-value pair
“’MarkerTypeCodeVar’,’Gender”’.

Name-value pairs for color control
----------------------------------

Name-value pair: *ColorCodeVar — variable name*

This name-value pair indicates that a different color should be used for
each different value of the indicated variable. The variable name is
specified as a character vector, say sVar.

Example: *PlotTbl(…,’ColorCodeVar’,’Gender’)*

In this example different colors will be used to plot the data for males
versus females (i.e., Gender==1 versus Gender==2).

Name-value pair: *ColorXVars — cell array of variable names*

This name-value pair indicates that different colors should be used to
distinguish different variables in the table, with those variables being
used as X’s in the X/Y plots.

Example: *PlotTbl(…,’ColorXVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different colors will be used to distinguish lines whose
X values are AvgHeight versus lines whose X values are AvgWeight.

Name-value pair: *ColorYVars — cell array of variable names*

This name-value pair indicates that different colors should be used to
distinguish different variables in the table, with those variables being
used as Y’s in the X/Y plots.

Example: *PlotTbl(…,’ColorYVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different colors will be used to distinguish lines whose
Y values are AvgHeight versus lines whose Y values are AvgWeight.

Note: You should never specify *more than one* of the three options
ColorCodeVar, ColorXVars, and ColorYVars. That is, colors can only be
distinguished in one way or the other—not several. If you want the
colors to be distinguished in more than one way, use other design
elements.

Name-value pair: *ColorSpecs — string list of color
specifications*

This name-value pair indicates that you want to replace PlotTbl’s
default set of color specifications with a new set. Use MATLAB’s
standard color specifications in whatever order you prefer. The colors
will be used in order by values of the CodeVar or the order of the
variables listed for ColorXVars or ColorYVars.

Example: *PlotTbl(…,’ColorSpecs’,’rgbk’)*

In this example the first line will be red, the second green, the third
blue, and the fourth black.

Name-value pair: *ColorLegend — cell array of legend labels*

This name-value pair indicates that you want to replace PlotTbl’s
default labels of the colors with the new labels indicated in your cell
array.

Example: *PlotTbl(…,’ColorLegend’,{’Male’ ’Female’})*

In this example the legends for the first and second colors will be
“Male” and “Female”, respectively, rather than the defaults of
“Gender=1” and “Gender=2”. Obviously, this option would make sense if
used in combination with the name-value pair “’ColorCodeVar’,’Gender”’.

Name-value pairs for line width control
---------------------------------------

Name-value pair: *LineWidthCodeVar — variable name*

This name-value pair indicates that a different line width should be
used for each different value of the indicated variable. The variable
name is specified as a character vector, say sVar.

Example: *PlotTbl(…,’LineWidthCodeVar’,’Gender’)*

In this example different line widths will be used to plot the data for
males versus females (i.e., Gender==1 versus Gender==2).

Name-value pair: *LineWidthXVars — cell array of variable names*

This name-value pair indicates that different line widths should be used
to distinguish different variables in the table, with those variables
being used as X’s in the X/Y plots.

Example: *PlotTbl(…,’LineWidthXVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different line widths will be used to distinguish lines
whose X values are AvgHeight versus lines whose X values are AvgWeight.

Name-value pair: *LineWidthYVars — cell array of variable names*

This name-value pair indicates that different line widths should be used
to distinguish different variables in the table, with those variables
being used as Y’s in the X/Y plots.

Example: *PlotTbl(…,’LineWidthYVars’,{’AvgHeight’ ’AvgWeight’})*

In this example different line widths will be used to distinguish lines
whose Y values are AvgHeight versus lines whose Y values are AvgWeight.

Note: You should never specify *more than one* of the three options
LineWidthCodeVar, LineWidthXVars, and LineWidthYVars. That is, line
widths can only be distinguished in one way or the other—not several. If
you want the line widths to be distinguished in more than one way, use
other design elements.

Name-value pair: *LineWidthSpecs — vector of line widths*

This name-value pair indicates that you want to replace PlotTbl’s
default set of line width specifications with a new set. Use MATLAB’s
standard line width specifications in whatever order you prefer. The
line widths will be used in order by values of the CodeVar or the order
of the variables listed for LineWidthXVars or LineWidthYVars.

Example: *PlotTbl(…,’LineWidthSpecs’,\3 5 8 12\)*

In this example the first line will have width 3, the next width 5, etc.

Name-value pair: *LineWidthLegend — cell array of legend labels*

This name-value pair indicates that you want to replace PlotTbl’s
default labels of the line widths with the new labels indicated in your
cell array.

Example: *PlotTbl(…,’LineWidthLegend’,{’Male’ ’Female’})*

In this example the legends for the first and second line widths will be
“Male” and “Female”, respectively, rather than the defaults of
“Gender=1” and “Gender=2”. Obviously, this option would make sense if
used in combination with the name-value pair
“’LineWidthCodeVar’,’Gender”’.

Name-value pairs for marker size control
----------------------------------------

Name-value pair: *MarkerSizeCodeVar — variable name*

This name-value pair indicates that a different marker size should be
used for each different value of the indicated variable. The variable
name is specified as a character vector, say sVar.

Example: *PlotTbl(…,’MarkerSizeCodeVar’,’Gender’)*

In this example different marker sizes will be used to plot the data for
males versus females (i.e., Gender==1 versus Gender==2).

Name-value pair: *MarkerSizeXVars — cell array of variable
names*

This name-value pair indicates that different marker sizes should be
used to distinguish different variables in the table, with those
variables being used as X’s in the X/Y plots.

Example: *PlotTbl(…,’MarkerSizeXVars’,{’AvgHeight’
’AvgWeight’})*

In this example different marker sizes will be used to distinguish lines
whose X values are AvgHeight versus lines whose X values are AvgWeight.

Name-value pair: *MarkerSizeYVars — cell array of variable
names*

This name-value pair indicates that different marker sizes should be
used to distinguish different variables in the table, with those
variables being used as Y’s in the X/Y plots.

Example: *PlotTbl(…,’MarkerSizeYVars’,{’AvgHeight’
’AvgWeight’})*

In this example different marker sizes will be used to distinguish lines
whose Y values are AvgHeight versus lines whose Y values are AvgWeight.

Note: You should never specify *more than one* of the three options
MarkerSizeCodeVar, MarkerSizeXVars, and MarkerSizeYVars. That is, marker
sizes can only be distinguished in one way or the other—not several. If
you want the marker sizes to be distinguished in more than one way, use
other design elements.

Name-value pair: *MarkerSizeSpecs — vector of marker sizes*

This name-value pair indicates that you want to replace PlotTbl’s
default set of marker size specifications with a new set. Use MATLAB’s
standard marker size specifications in whatever order you prefer. The
marker sizes will be used in order by values of the CodeVar or the order
of the variables listed for MarkerSizeXVars or MarkerSizeYVars.

Example: *PlotTbl(…,’MarkerSizeSpecs’,\7 10\)*

In this example the first marker will have size 7 and the second will
have size 10.

Name-value pair: *MarkerSizeLegend — cell array of legend
labels*

This name-value pair indicates that you want to replace PlotTbl’s
default labels of the marker sizes with the new labels indicated in your
cell array.

Example: *PlotTbl(…,’MarkerSizeLegend’,{’Male’ ’Female’})*

In this example the legends for the first and second marker sizes will
be “Male” and “Female”, respectively, rather than the defaults of
“Gender=1” and “Gender=2”. Obviously, this option would make sense if
used in combination with the name-value pair
“’MarkerSizeCodeVar’,’Gender”’.

Name-value pairs for subplot row and column control
---------------------------------------------------

Name-value pair: *SubplotRowsCodeVar — variable name*\
Name-value pair: *SubplotColsCodeVar — variable name*

Each of these two name-value pairs indicates that a different subplot
row or subplot column should be used for each different value of the
indicated variable. The variable name is specified as a character
vector, say sVar.

Example: *PlotTbl(…,’SubplotRowsCodeVar’,’Gender’)*

This name-value pair indicates that the data for males and females
should be plotted in two different rows of subplots. The figure might
have just one column, or there might be several columns distinguished by
the values of some other variable or by the variable plotted on the X or
Y axis.

Name-value pair: *SubplotRowsXVars — cell array of variable
names*\
Name-value pair: *SubplotColsXVars — cell array of variable
names*

Each of these two name-value pairs indicates that a different subplot
row or column should be used for X/Y plots with each of the indicated
variable names on the X axis.

Name-value pair: *SubplotRowsYVars — cell array of variable
names*\
Name-value pair: *SubplotColsYVars — cell array of variable
names*

Each of these two name-value pairs indicates that a different subplot
row or column should be used for X/Y plots with each of the indicated
variable names on the Y axis.

Note: You should never specify *more than one* of the three options
SubplotRowsCodeVar, SubplotRowsXVars, and SubplotRowsYVars, and never
more than one of the three corresponding SubplotCols options. But you
can specify both SubplotRows and SubplotCols in any combination that you
want—that is, these “design elements” can be controlled independently.

Name-value pair: *SubplotRowsLegend — cell array of legend
labels*\
Name-value pair: *SubplotColsLegend — cell array of legend
labels*

Each of these two name-value pairs indicates that you want to replace
the default labels of these subplots with the new labels indicated in
your cell array. (Strictly speaking, these are not legends, but rather
titles at the tops of the subplots.)

Example: *PlotTbl(…,’SubplotRowsLegend’,{’Male’ ’Female’})*

In this example the first subplot will be labelled “Male” and the second
will be labelled “Female”, rather than the defaults of “Gender=1” and
“Gender=2”. This would make sense in combination with the option
Example: *PlotTbl(…,’SubplotRowsCodeVar’,’Gender’)*

Name-value Pairs for Control of Axis Labels
===========================================

Name-value pair: *XLabel — vector of subplot numbers*\
Name-value pair: *YLabel — vector of subplot numbers*

Each of these two name-value pairs indicates that you want an X or Y
axis label to appear on the subplot corresponding to one of the numbers
in the vector. By default, all axes are labelled; this option is used
when you want to turn off some of the labels. The subplots are numbered
using the standard numbering scheme for MATLAB’s subplot command.

Example: *PlotTbl(…,’XLabel’,\7 8 9\,’YLabel’,\1 4 7\)*

In this example, with a 3x3 arrangement of subplots, the X axes will be
labelled for the plots in the bottom row (i.e., subplot numbers 7-9) and
the Y axes will be labelled for the subplots in the left-most column
(i.e., subplot numbers 1, 4, and 7).

Name-value pair: *XLabelStr — cell array of X labels for the
subplots*\
Name-value pair: *YLabelStr — cell array of Y labels for the
subplots*

Each of these two name-value pairs allows you to specify the text of the
X and Y axis labels for the subplots, which can be used to override the
defaults (i.e., the X and Y variable names). This capability is needed
when the desired axis label is not a legal MATLAB variable name. The
length of the cell array is the number of subplots (i.e., you must
specify one X or Y axis label for each subplot).

Example: *PlotTbl(…,’XLabelStr’,{’\\alpha’ ’\\alpha’ ’\\alpha’
’\\alpha’})*

In this example the X axes of all four subplots will be labelled
*α*{.math .inline}.

Name-value Pairs for Control of Legends
=======================================

Name-value pair: *Legend — vector of subplot numbers*

This name-value pair provides a list of numbers of the subplots for
which you want the legends to be displayed.

Example: *PlotTbl(…,’Legend’,\1 3\)*

In this example legends will be displayed on the first and third
subplots.

Name-value pair: *LegendLoc — string*

This name-value pair can be used to override MATLAB’s default choice of
where to put the legend(s) on the plot(s). Use MATLAB’s standard
location specifications (e.g., ’Northeast’, ’Best’) to indicate where
you want the legend(s).

Name-value pair: *LegendPos — vector of four position numbers*

Alternatively, this name-value pair can be used to override MATLAB’s
default choice of where to put the legend(s) on the plot(s). The option
indicates that the legend(s) should be placed in the custom position
indicated by the four numerical values in the vector (i.e., left bottom
width height). Use MATLAB’s standard position specification, determined
by its units (e.g., see https://www.mathworks.com/matlabcentral/answers/
80980-what-does-the-four-vector-mean-in-matlab-legend-position ).

Note: To override the default legen positioning, you can specify
LegendLoc or LegendPos, but not both.

Name-value pair: *LegendBox — ’boxon’ or ’boxoff’*

This name-value pair indicates whether you want the box on the
legend(s). I think boxes just add clutter, so the default is ’boxoff’.

Tips
====

-   PlotTbl plots the data from all of the rows in whatever table is
    passed to it. If you just want to plot some of the rows of a given
    table, just pass the desired row subset using MATLAB’s standard
    row-selection methods.

    Example:
    *PlotTbl(AHWDat(AHWDat.Gender==2,:),’Age’,’AvgWeight’,’LineTypeCodeVar’,’Nationality’);*

    In this example, data are just plotted for Gender 2.

-   For any design element that does *not* vary across your plots,
    PlotTbl uses the first of the default “Specs” options for that
    design element. If you would prefer something else, you can change
    this just by setting the Specs for that design element, even though
    you are not using it to distinguish between lines. You can include
    the Specs option for any design element, whether that element
    appears anywhere else in the PlotTbl command or not.

    Example: *PlotTbl(…,’MarkerTypeSpecs’,’ ’,…);*

    In this example, all lines will be drawn without markers (as
    indicated by the blank marker type specification). By default,
    PlotTbl’s first MarkerTypeSpec is the square, so the lines would be
    drawn with square markers if this option were not specified.

Appendix: Complete List of Name-value Pairs
===========================================

*ColorCodeVar — variable name*\
*ColorLegend — cell array of legend labels*\
*ColorSpecs — string list of colors*\
*ColorXVars — cell array of variable names*\
*ColorYVars — cell array of variable names*\
*Legend — vector of subplot numbers where you want the legend*\
*LegendBox — ’boxon’ or ’boxoff’*\
*LegendLoc — string such as ’Northeast’*\
*LegendPos — \left bottom width height\*\
*LineTypeCodeVar — variable name*\
*LineTypeLegend — cell array of legend labels*\
*LineTypeSpecs — cell array of line type specifications*\
*LineTypeXVars — cell array of variable names*\
*LineTypeYVars — cell array of variable names*\
*LineWidthCodeVar — variable name*\
*LineWidthLegend — cell array of legend labels*\
*LineWidthSpecs — vector of line widths*\
*LineWidthXVars — cell array of variable names*\
*LineWidthYVars — cell array of variable names*\
*MarkerSizeCodeVar — variable name*\
*MarkerSizeLegend — cell array of legend labels*\
*MarkerSizeSpecs — vector of marker sizes*\
*MarkerSizeXVars — cell array of variable names*\
*MarkerSizeYVars — cell array of variable names*\
*MarkerTypeCodeVar — variable name*\
*MarkerTypeLegend — cell array of legend labels*\
*MarkerTypeSpecs — string list of marker type specifications*\
*MarkerTypeXVars — cell array of variable names*\
*MarkerTypeYVars — cell array of variable names*\
*SubplotColsCodeVar — variable name*\
*SubplotColsLegend — cell array of legend labels*\
*SubplotColsXVars — cell array of variable names*\
*SubplotColsYVars — cell array of variable names*\
*SubplotRowsCodeVar — variable name*\
*SubplotRowsLegend — cell array of legend labels*\
*SubplotRowsXVars — cell array of variable names*\
*SubplotRowsYVars — cell array of variable names*\
*XLabel — vector of subplot numbers*\
*XLabelStr — vector of subplot numbers*\
*YLabel — vector of subplot numbers*\
*YLabelStr — vector of subplot numbers*

Appendix: Line Types in MATLAB
==============================

In PlotTbl’s default order:

-   ’-’: Solid line

-   ’–’: Dashed line

-   ’:’: Dotted line

-   ’-.’: Dash-dot line

Appendix: Marker Types in MATLAB
================================

In PlotTbl’s default order:

-   ’square’ or ’s’: Square

-   ’o’: Circle

-   ’diamond’ or ’d’: Diamond

-   ’‘\^{}’: Upward-pointing triangle

-   ’v’: Downward-pointing triangle

-   ’+’: Plus sign

-   ’x’: Cross

-   ’\*’: Asterisk

-   ’.’: Point

-   ’&gt;{.math .inline}’: Right-pointing triangle

-   ’&lt;{.math .inline}’: Left-pointing triangle

-   ’pentagram’ or ’p’: Five-pointed star (pentagram)

-   ’hexagram’ or ’h’: Six-pointed star (hexagram)

Appendix: Colors in MATLAB
==========================

In PlotTbl’s default order:

-   k: Black

-   r: Red

-   g: Green

-   b: Blue

-   c: Cyan

-   m: Magenta

-   y: Yellow

-   w: White


