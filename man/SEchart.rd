\name{SEchart}
\Rdversion{0.1}
\alias{SEchart}
\docType{data}
\title{Graphically display states and events in longitudinal data}

\description{Produces plots similar to event charts, with the additional option to include a 'state' variable (i.e., a time-varying variable), the values of which are displayed as line segments with different colors. The plots can be used to visualize associations between states and events. Furthermore, useful strategies for the vertical alignment of subjects are included in the function.}

\usage{
SEchart(data, idvar, timevar.start, timevar.stop, statevar = NULL,
	eventvar = NULL, eventtime= NULL, srt1 = NULL, srt2 = NULL,
	srt3 = NULL, srt4 = NULL, ord.ud = NULL, stratvar = NULL,
	xlim = NULL, xlab = "Time", ylim = NULL, ylab = NULL,
	grd = FALSE, grd.col = "grey", grd.lty = "dashed", idnum = 1,
	idnum.col = "black", idnum.cex = 1, l.base.col = "grey",
	l.base.lwd = 1,	lend = 1, l.state.col = "pal.heat.rev",
	l.state.lwd = 3, main = "SEchart", bg = "white", legnd = TRUE,
	legnd.x = "bottomright", legnd.y = NULL, legnd.cex = 1,
	legnd.txt.round = 2, legnd.bg = "white", strat.cex = 1,	
	strat.txt = NULL, strat.bg.col = "lightgrey", pch = NULL,
	p.col = NULL, p.cex = 1, p.lwd = 1, return.output = FALSE)
}

\arguments{
\item{data}{Data frame, consisting of data collected on multiple time points, in 'long' format.}
\item{idvar}{Name of the variable in \code{data} uniquely identifying the units under observation within which the longitudinal measurements are taken.}
\item{timevar.start}{Name of the variable in \code{data} specifying the beginning of each time interval.}
\item{timevar.stop}{Name of the variable in \code{data} specifying the end of each time interval.}
\item{statevar}{Name of the variable in \code{data} specifying a subject`s state in each interval. May contain \code{NA} values. If left unspecified, no state variable is plotted.}
\item{eventvar}{Name(s) of the variable(s) in \code{data} specifying whether event(s) took place in each interval. Should be coded \code{0}/\code{1}. May contain \code{NA}'s. If left unspecified, no events are plotted.}
\item{eventtime}{Vector of the same length as \code{eventvar}, specifying the time(s) of occurrence of event(s) within the time interval. Options are \code{"start"}, \code{"middle"} and \code{"end"}.}
\item{srt1}{Specifies the sorting strategy used on the first level. See Details for the available options. If left unspecified, subjects are sorted only on \code{idvar}.}
\item{srt2}{Similar to \code{srt1}, for the second level. If left unspecified, sorting is only performed on first level.}
\item{srt3}{Similar to \code{srt1}, for the third level. If left unspecified, sorting is only performed up to the second level.}
\item{srt4}{Similar to \code{srt1}, for the fourth level. If left unspecified, sorting is only performed up to the third level.}
\item{ord.ud}{Vector of unique values in \code{idvar}, specifying a user-defined ordering. Overrides \code{srt1}-\code{srt4}.}
\item{stratvar}{Name of numerical variable in \code{data}, the values of which are used to stratify the charts. \code{stratvar} should be time-independent.}
\item{xlim}{Limits of the X-axis of the plot.}
\item{xlab}{The label used for the X-axis.}
\item{ylim}{Limits of the Y-axis of the plot.}
\item{ylab}{The label used for the Y-axis. If left unspecified, \code{idvar} is used.}
\item{grd}{Logical. Should vertical grid lines be plotted?}
\item{grd.col}{Color of the grid lines.}
\item{grd.lty}{Line type used for the grid lines. See \code{\link{par}}.}
\item{idnum}{Specifies whether and where ID numbers should be located. \code{0}: No ID numbers, \code{1}: ID numbers in plot, \code{2}: ID numbers on Y-axis.}
\item{idnum.col}{Color used for the ID-numbers.}
\item{idnum.cex}{Numerical value giving the amount by which the ID-numbers should be magnified relative to the default.}
\item{l.base.col}{Color used for the line indicating the total time of follow-up.}
\item{l.base.lwd}{Numerical value specifying the width of the line indicating the total time of follow-up.}
\item{lend}{Line end style. See \code{\link{par}}.}
\item{l.state.col}{Either a string specifying a color palette (see Details), or a vector of length \code{length(unique(data[statevar][!is.na(data[statevar])]))} specifying the colors used to indicate states in the plot, sorted from low to high.}
\item{l.state.lwd}{Numerical value specifying the width of the lines that are used to indicate the states.}
\item{main}{Title of the chart.}
\item{bg}{Background color of the chart.}
\item{legnd}{Logical. Should a legend be included?}
\item{legnd.x}{X coordinates of the legend.}
\item{legnd.y}{Y coordinates of the legend.}
\item{legnd.cex}{Numerical value giving the amount by which the text in the legend should be magnified relative to the default.}
\item{legnd.txt.round}{Integer value specifying the number of decimals to which the values of \code{statevar} are rounded in the legend.}
\item{legnd.bg}{Background color of the legend.}
\item{strat.cex}{Numerical value giving the amount by which the text used to indicate the \code{stratvar} values should be magnified relative to the default.}
\item{strat.txt}{Vector with user specified text to indicate \code{stratvar} values. If left unspecified, the values of \code{stratvar} are used.}
\item{strat.bg.col}{Color of the bars used to stratify the chart according to \code{stratvar}.}
\item{pch}{Vector of \code{length(eventvar)} specifying the point character(s) used to indicate the event(s). See \code{par()}. If left unspecified, \code{c(1:length(eventvar))} is used.}
\item{p.col}{Vector of length \code{length(eventvar)} specifying the color(s) of the points used to indicate the event(s). If left unspecified, \code{"black"} is used for all points.}
\item{p.cex}{Numerical value giving the amount by which the points used to indicate the event(s) should be magnified relative to the default.}
\item{p.lwd}{Numerical value specifying the line width of the points used to indicate the event(s).}
\item{return.output}{Logical. Should the function return information on the used ordering and graphical options?}
}

\details{
\code{srt1} through \code{srt4} are used to vertically sort the subjects in the plot. Options are:
\describe{
\item{\code{"start.time"}}{Sorts the subjects by their start time.}
\item{\code{"end.time"}}{Sorts the subjects by their end time.}
\item{\code{"tot.time"}}{Sorts the subjects by their total duration of follow-up time.}
\item{\code{"midpoint.time"}}{Sorts the subjects by their midpoint follow-up time.}
\item{\code{"min.state"}}{Sorts the subjects by their minimum observed level of \code{statevar}.}
\item{\code{"max.state"}}{Sorts the subjects by their maximum observed level of \code{statevar}.}
\item{\code{"first.state"}}{Sorts the subjects by the level of \code{statevar} that was observed on first measurement.}
\item{\code{"last.state"}}{Sorts the subjects by the level of \code{statevar} that was observed on last measurement.}
\item{\code{"average.state"}}{Sorts the subjects by their average observed level of \code{statevar} per unit of time.}
\item{\code{"sum.(eventname)"}}{Sorts the subjects by the sum of the number of an event. Replace (eventname) with the name of the event as specified in \code{eventvar} (without brackets or quotation marks).}
\item{\code{"tf.(eventname)"}}{Sorts the subjects by whether the subject experienced an event or not. Replace (eventname) with the name of the event as specified in \code{eventvar} (without brackets or quotation marks).}
\item{\code{"time.(eventname)"}}{Sorts the subjects by the time of the first occurence of an event. Replace (eventname) with the name of the event as specified in \code{eventvar} (without brackets or quotation marks).}
}
Color palette options for \code{l.state.col} are \code{"pal.rainbow"}, \code{"pal.topo"}, \code{"pal.terrain"}, \code{"pal.heat"}, \code{"pal.cm"}, \code{"pal.topo"} and \code{"pal.gray"}. Adding \code{.rev} (e.g. \code{"pal.heat.rev"}) reverses the colors. See \code{\link{rainbow}} and \code{\link{gray.colors}}.
}

\value{
If \code{return.output == TRUE}, a list with objects \code{$ord.id}, \code{$col.statevar}, and \code{$p.inf}.
\describe{
\item{\code{$ord.id}}{A vector indicating the used ordering of the subjects.}
\item{\code{$col.statevar}}{A matrix with rows specifying the colors used for every level of \code{statevar}.}
\item{\code{$p.inf}}{A matrix with rows specifying the events and the corresponding values used for \code{pch}, \code{p.col}, \code{p.lwd} and \code{p.cex}.}
}
}

\author{Rutger M. van den Bor, Willem M. van der Wal}

\seealso{\code{\link[Hmisc]{event.chart}}}

\examples{
#Example using aids dataset from package JM
library(JM) 
data(aids)

#Assign class numeric to aids$patient and aids$prevOI (class factor is not allowed in function)
aids$patient <- as.numeric(aids$patient)
aids$prevOI.2 <- as.numeric(aids$prevOI)

#Categorize CD4
aids$CD4.cat <- cut(aids$CD4, breaks=10, labels=FALSE)

#For better results, use pdf()
# pdf(file = "PATH/SEchart_aids.pdf", width = 12, height = 20)

#Create SEchart for subset of aids data, with event=death and state=CD4. 
#Sort subjects by (1) occurrence of event "death" and (2) their observed end 
#time. The chart is stratified by "aids diagnosis at study entry" (variable 
#"prevOI.2").

SEchart(data=aids[aids$patient <= 100,],
	idvar="patient",
	timevar.start = "start",
	timevar.stop = "stop",
	statevar="CD4.cat",
	eventvar="event",
	eventtime="end",
	srt1="tf.event",
	srt2="end.time",
	stratvar="prevOI.2",
	strat.txt=c("No aids diagnosis at study entry", "Aids diagnosis at study entry"),
	l.state.col="pal.heat",
	idnum.cex=0.5,
	legnd = TRUE,
	)

#Close the graphics device to save as pdf
# graphics.off()
}

\keyword{event chart, longitudinal, plot}
