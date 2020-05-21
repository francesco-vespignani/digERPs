---
title: "A minimal schema template for digERPs"
author: ""
date: Thu May 21 19:20:26 2020
geometry: margin=2cm
output: pdf_document
---

This is a minimal schema template for json annotation of scientific papers within the digERPs project.

# Annotation schema

**paperid** *[type= string]*: paperid **(required)**

The id of the annotated paper, should be [last author family name][year of publication][first page].

*Examples:*
"KUTAS1984161"

**experiments** *[type= array of object]*: An array of Experiments **(required)**

Papers typically contain multiple experiments, please add an element array for each experiment, information about how to split data into experiments are refereed in the manual.

> **experiments elements:** *[type= object]*: An Experiment

> Specific annotations about the experiment.

> > **expname** *[type= string]*: Name of the experiment **(required)**

> > A label of the form exp[N], where N is an integer. We suggest to keep the original paper number, otherwise add a filed "note on name".

> > **content** *[type= string]*: Experiment description

> > A brief description of the experiment aims and possibly about its role within the aims of the specific secondary research that is currently pursued.

> > **eeg** *[type= object]*: EEG Section **(required)**

> > A collection of information about EEG recording and the analysis pipeline for ERPs extraction.

> > > **sites** *[type= array of string]*: Recorded Sites **(required)**

> > > An array of strings with the labels of the recorded EEG sites/channels .

> > > > **sites elements:** *[type= string]*: Channel/site label

> > > > Label of the channel/site.

> > **subjects** *[type= array of object]*: Subject Groups Section **(required)**

> > An array with information about the groups of subjects tested.

> > > **subjects elements:** *[type= object]*: A group of subjects

> > > A collection of relevant information about a single group of subjects.

> > > > **groupname** *[type= string]*: A label for this group **(required)**

> > > > A short and possibly informative label of the group of subjects

> > **procedure** *[type= object]*: Experimental Procedure Section **(required)**

> > A collection of information about the experimental procedure, including stimuli and behavioural tasks.

> > > **conditions** *[type= array of object]*: Experimental Conditions **(required)**

> > > An array with information about the tested experimental conditions.

> > > > **conditions elements:** *[type= object]*: An Experimental Condition

> > > > A collection of informations about a specific experimental condition.

> > > > > **condname** *[type= string]*: Condition label **(required)**

> > > > > A short and possibly informative label of the experimental condition.

> > **data** *[type= array of object]*: Data section **(required)**

> > An array of entries corresponding to plotted waveforms with information about where these can be found.

> > > **data elements:** *[type= object]*: Waveforms

> > > Information relative to a group of waveforms pertaining to a pool of sites/channel but to a signle condition and group of subjects. Sites will be a subset of the above field in the eeg section, otherwise add a field "note on sites"

> > > > **condition** *[type= string]*: Condition label **(required)**

> > > > An condition label instantiated above in the procedure section.

> > > > **subjects** *[type= string]*: Group label **(required)**

> > > > An subject-group label instantiated above in the subjects section.

> > > > **time** *[type= string]*: Time Range **(required)**

> > > > The (maximum) time range of the plotted data,  should be in the form "MIN, MAX".

> > > > **figure** *[type= string]*: Figure label **(required)**

> > > > A short label for the  figure from which the specific waveform should be extracted. Should be in the form "fig[N][A]", where N  in an integer and A an optional letter (e.g. "fig1A").  This label should match both the description in the paper and the name of the image file to be used for the digitalization (e.g "fig1A.png".

> > > > **figuredoi** *[type= string]*: Figure doi

> > > > A doi for the specific figure,  if available.

> > > > **page** *[type= string]*: Page number

> > > > The number of the page in which the figure appears.

> > > > **color** *[type= string]*: Line color

> > > > A verbal description of the color in which the waveform appears in the plot.

> > > > **type** *[type= string]*: Line  type

> > > > A verbal description of the graphic type of the line (e.g. continuous, dashed, dotted ...).

#  List of papers to be digitalized

- **KUTAS1984161:** Kutas, M., & Hillyard, S. A. (1984). Brain potentials during reading reflect word expectancy and semantic association. Nature, 307(5947), 161–163. doi:10.1038/307161a0

- **VANPETTEN1999394:** Van Petten, C., Coulson, S., Rubin, S., Plante, E., & Parks, M. (1999). Time course of word identification and semantic integration in spoken language. Journal of Experimental Psychology: Learning, Memory, and Cognition, 25(2), 394–417. doi:10.1037/0278-7393.25.2.394




