# A minimal schema template for digERPs

This is a minimal schema template for json annotation of scientific papers within the digERPs project. Papers typically contain multiple experiments, please add an element array for each experiment, in this case the field expname becomes required.

# Description of the annotation schema

Annotators can add further information they think require some attention
by adding further fields. These extra fields should start with \"note\".

## Basic elements

**paperid** *[type= string]*: paperid **(required)**

The id of the annotated paper, should be [last author family name][year of publication][first page].

*Examples:*

"KUTAS1984161"

**expname** *[type= string]*: Name of the experiment **(required)**

A label of the form exp[N], where N is an integer. We suggest to keep the original paper number, otherwise add a filed "note on name".

**content** *[type= string]*: Experiment description **(required)**

A brief description of the experiment aims and possibly about its role within the aims of the specific secondary research that is currently pursued.

**eeg** *[type= object]*: EEG Section **(required)**

A collection of information about EEG recording and the analysis pipeline for ERPs extraction.

**subjects** *[type= array of object]*: Subject Groups Section **(required)**

An array with information about the groups of subjects tested.

**procedure** *[type= object]*: Experimental Procedure Section **(required)**

A collection of information about the experimental procedure, including stimuli and behavioural tasks.

**data** *[type= array of object]*: Data section **(required)**

An array of entries corresponding to plotted waveforms with information about where these can be found.

## EEG  section

An object with the following fields:

**sites** *[type= array of string]*: Recorded Sites **(required)**

An array of strings with the labels of the recorded EEG sites/channels .

> **sites elements:** *[type= string]*: Channel/site label
> 
> Label of the channel/site.
> 

## Subjects  section

An array of objects with the following fields:

**groupname** *[type= string]*: A label for this group **(required)**

A short and possibly informative label of the group of subjects

## Procedure  section

An object with the following fields:

**conditions** *[type= array of object]*: Experimental Conditions **(required)**

An array with information about the tested experimental conditions.

> **conditions elements:** *[type= object]*: An Experimental Condition
> 
> A collection of informations about a specific experimental condition.
> 
> > **condname** *[type= string]*: Condition label **(required)**
> > 
> > A short and possibly informative label of the experimental condition.
> > 

## Data  section

An array of objects with the following fields

**condition** *[type= string]*: Condition label **(required)**

An condition label instantiated above in the procedure section.


**subjects** *[type= string]*: Group label **(required)**

An subject-group label instantiated above in the subjects section.


**time** *[type= string]*: Time Range **(required)**

The (maximum) time range of the plotted data,  should be in the form "MIN, MAX".


**figure** *[type= string]*: Figure label **(required)**

A short label for the  figure from which the specific waveform should be extracted. Should be in the form "fig[N][A]", where N  in an integer and A an optional letter (e.g. "fig1A").  This label should match both the description in the paper and the name of the image file to be used for the digitalization (e.g "fig1A.png".


**figuredoi** *[type= string]*: Figure doi

A doi for the specific figure,  if available.


**page** *[type= string]*: Page number

The number of the page in which the figure appears.


**color** *[type= string]*: Line color

A verbal description of the color in which the waveform appears in the plot.


**type** *[type= string]*: Line  type

A verbal description of the graphic type of the line (e.g. continuous, dashed, dotted ...).


#  List of papers to be digitalized

**KUTAS1984161**: Kutas, M. and S. A. Hillyard (1984). "Brain potentials during reading
reflect word expectancy and semantic association". In: _Nature_
307.5947, pp. 161-163. DOI: 10.1038/307161a0.

**VANPETTEN1999394**: Van Petten, C, S. Coulson, S. Rubin, et al. (1999). "Time Course of
Word Identification and Semantic Integration in Spoken Language". In:
_Journal of Experimental Psychology: Learning Memory and Cognition_
25.2, pp. 394-417. DOI: 10.1037/0278-7393.25.2.394.


