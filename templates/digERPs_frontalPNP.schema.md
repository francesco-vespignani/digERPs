# "A schema template for the systematic review frontalPNP"

This is a proof of concept aimed to digitalize papers in table 2 of the paper by Van Petten and Luka (2012) Int. Jou. of Psychophy. 83, 176–190. In this review a number of ERPs papers on sentence processing are considered by looking at contrasts between higher- and lower-cloze congruent sentence completions. Papers typically contain multiple experiments, please add an element array for each experiment, in this case the field expname becomes required.

# Annotation schema

> **paperid** *[type= string]*: paperid **(required)**
> 
> The id of the annotated paper, should be [last author family name][year of publication][first page].
> 
> *Examples:*
"KUTAS1984161"
> 
> **expname** *[type= string]*: Name of the experiment
> 
> A label of the form exp[N], where N is an integer. We suggest to keep the original paper number, otherwise add a filed "note on name".
> 
> **content** *[type= string]*: Experiment description
> 
> A brief description of the experiment aims and possibly about its role within the aims of the specific secondary research that is currently pursued.
> 
> **eeg** *[type= object]*: EEG Section **(required)**
> 
> A collection of information about EEG recording and the analysis pipeline for ERPs extraction.
> 
> > **recording reference** *[type= string]*: Recording reference **(required)**
> > 
> > The EEG site used for reference electrode during recording (typical value are left/right/linked mastoids, average, Cz).
> > 
> > **analysis reference** *[type= string]*: Analysis reference
> > 
> > Describe the analysis reference in the case a rereference was done otherwise leave this field blank.
> > 
> > **sampling rate** *[type= number]*: Sampling rate **(required)**
> > 
> > Samplig rate of the EEG recording in Hz (number of EEG measures per second).
> > 
> > **final Low Pass** *[type= number]*: Final Low Pass filter
> > 
> > The cutoff frequency in Hz of the more severe low pass filter applied to the data prior to the plot.
> > 
> > **final High Pass** *[type= number]*: The final High Pass filter
> > 
> > The cutoff frequency in Hz of the more severe high pass filter applied to the data prior to the plot.
> > 
> > **epoch rejection** *[type= string]*: Epoch rejection method **(required)**
> > 
> > A verbal description of the way the epoch rejection was performed: can be any of "manual", "automatic"or "semiautomatic" or it can be also a more in depth description including the specific parameters used in the procedure.
> > 
> > **mean rejected** *[type= number]*: Mean rejected
> > 
> > The proportion of trials removed by the artifact rejection procedure (across different conditions), should be a number between 0 and 1.
> > 
> > **sites nomenclature** *[type= string]*: Sites nomenclature **(required)**
> > 
> > A description of the standard used to label the channel/sites. In case of non standard sites put "custom" and add a filed "note on sites" with the original description of the position of the electrodes should be provided.
> > 
> > **sites** *[type= array of string]*: Recorded Sites **(required)**
> > 
> > An array of strings with the labels used in the paper figures of the recorded EEG sites/channels.
> > 
> > > **sites elements:** *[type= string]*: Channel/site label
> > > 
> > > Label of the channel/site.
> > > 
> > **sites 5%** *[type= array of string]*: Sites 5%
> > 
> > In the case the paper does not use the standard nomenclature 5 per cent (or a subset of it like the 10-20) for each of the sites listed above the closest site in the 5 per cent standard should be provided. Otherwise leave this array empty.
> > 
> > > **sites 5% elements:** *[type= string]*: Channel/site standard label
> > > 
> > > Standard label of the channel/site.
> > > 
> > **baseline** *[type= string]*: Baseline **(required)**
> > 
> > The interval used for the baseline of the ERPs with reference to the onset of the critical word. It should in the form "MIN, MAX" in ms. In the case different baselines are used for different conditions or target words please add a field "note on baseline".
> > 
> > **epoch** *[type= string]*: Epoch inteval **(required)**
> > 
> > The epochs used of the ERPs extraction (may be larger than the plotted ones, time range plotted is reported in the data section) with reference to the onset of the critical word. It should in the form "MIN, MAX" in ms. In the case different epochs are used for different conditions or target words please add a field "note on epoch".
> > 
> > **hardware** *[type= string]*: Hardware
> > 
> > A description of the EEG system used (recording device and optionally recording software).
> > 
> > **active electrodes** *[type= boolean]*: Active electrodes
> > 
> > Active electrodes  were used (true/false)
> > 
> **subjects** *[type= array of object]*: Subject Groups Section **(required)**
> 
> An array with information about the groups of subjects tested.
> 
> > **subjects elements:** *[type= object]*: A group of subjects
> > 
> > A collection of relevant information about a single group of subjects.
> > 
> > > **groupname** *[type= string]*: A label for this group **(required)**
> > > 
> > > A short and possibly informative label of the group of subjects
> > > 
> > > **n** *[type= integer]*: Number of subjects **(required)**
> > > 
> > > An integer: the number of subject included in the final analysis. Put -1 if the information is not provided. If different subjects were used for different conditions or target words please add a field "note on n"
> > > 
> > > **mean age** *[type= number]*: Mean age
> > > 
> > > Mean age of this group of subject in years. Put -1 if not provided.
> > > 
> > > **age range** *[type= string]*: Age range
> > > 
> > > Age range in the form "MIN, MAX" in years, leave empty if not provided.
> > > 
> > > **num of females** *[type= integer]*: Number of females
> > > 
> > > The number of females in the sample,  put -1 if the information is not provided.
> > > 
> > > **language(s) spoken** *[type= string]*: Language(s) spoken **(required)**
> > > 
> > > First language of the subjects and possible information about further other language known, when provided.
> > > 
> > > **description** *[type= string]*: Group Descrirption **(required)**
> > > 
> > > Report other information reported about the group (e.g. about vision, hearing capability, cognitive and neurological state).
> > > 
> **procedure** *[type= object]*: Experimental Procedure Section **(required)**
> 
> A collection of information about the experimental procedure, including stimuli and behavioural tasks.
> 
> > **language** *[type= string]*: Language of the stimuli **(required)**
> > 
> > The language of the sentences or words presented to subjects during the experiment.
> > 
> > **modality** *[type= string]*: Presentation modality **(required)**
> > 
> > Modality of presentation of the stimuli.
> > 
> > *Possible values:*
"auditory", "visual", "unknown"
> > 
> > **task** *[type= string]*: Requested task **(required)**
> > 
> > The behavioral task which subjects were requested to perform.
> > 
> > *Examples:*
"silent reading", "reading for comprhension", "comprehension questions", "word monitoring"
> > 
> > **lists** *[type= string]*: Lists
> > 
> > A textual description of the type of counterbalancement of material across participants (e.g. latin squar design), number of different lists can also be reported.
> > 
> > **word duration**: Word duration
> > 
> > The time in ms for which the words were presented as a number. In case the duration was variable a textual description of duration estimates (e.g. mean minimum, maximum) can  be provided.
> > 
> > **woa**: Word Onset Asyncrony
> > 
> > The time in ms that occured between the onset of a word and the onset of the following word (e.g. word duration plus interstimulus interval) as a number. In case it is variable provide a description string.
> > 
> > **conditions** *[type= array of object]*: Experimental Conditions **(required)**
> > 
> > An array with information about the tested experimental conditions.
> > 
> > > **conditions elements:** *[type= object]*: An Experimental Condition
> > > 
> > > A collection of informations about a specific experimental condition.
> > > 
> > > > **condname** *[type= string]*: Condition label **(required)**
> > > > 
> > > > A short and possibly informative label of the experimental condition.
> > > > 
> > > > **cp**: Cloze Probability **(required)**
> > > > 
> > > > Fill with a number if the average cloze probability of the items in this condition, if available. In case an upper bound of the cloze probability is provided put this with a trailing minor sign (e.g. "<0.05"). A "note on cp" field can be added to give more information about how cp was estimated (e.g. number of participants in the pre-test) and possible measures of cp variability across items.
> > > > 
> > > > **items** *[type= number]*: Number of items **(required)**
> > > > 
> > > > The numeber of items (words/sentences) which was presented in this condition to each subject. If it is variable add a "note on items" field.
> > > > 
> > > > **description** *[type= string]*: Condition description **(required)**
> > > > 
> > > > A textual description of this experimental condition.
> > > > 
> > > > **example** *[type= string]*: Sentence example
> > > > 
> > > > If available provide an example of the sentence used in this experiment and condition by placing the target word  between asteriscs (e.g. "He spread the butter with a *sock*").
> > > > 
> > > > **wp** *[type= string]*: Word Position
> > > > 
> > > > A description of the word position in the sentence at which the ERPs were measured (e.g. "target", "post target", "end of sentence".
> > > > 
> **data** *[type= array of object]*: Data section **(required)**
> 
> An array of entries corresponding to plotted waveforms with information about where these can be found.
> 
> > **data elements:** *[type= object]*: Waveforms
> > 
> > Information relative to a group of waveforms pertaining to a pool of sites/channel but to a signle condition and group of subjects. Sites will be a subset of the above field in the eeg section, otherwise add a field "note on sites"
> > 
> > > **condition** *[type= string]*: Condition label **(required)**
> > > 
> > > An condition label instantiated above in the procedure section.
> > > 
> > > **subjects** *[type= string]*: Group label **(required)**
> > > 
> > > An subject-group label instantiated above in the subjects section.
> > > 
> > > **time** *[type= string]*: Time Range **(required)**
> > > 
> > > The (maximum) time range of the plotted data,  should be in the form "MIN, MAX".
> > > 
> > > **figure** *[type= string]*: Figure label **(required)**
> > > 
> > > A short label for the  figure from which the specific waveform should be extracted. Should be in the form "fig[N][A]", where N  in an integer and A an optional letter (e.g. "fig1A").  This label should match both the description in the paper and the name of the image file to be used for the digitalization (e.g "fig1A.png".
> > > 
> > > **figuredoi** *[type= string]*: Figure doi
> > > 
> > > A doi for the specific figure,  if available.
> > > 
> > > **page** *[type= string]*: Page number
> > > 
> > > The number of the page in which the figure appears.
> > > 
> > > **color** *[type= string]*: Line color **(required)**
> > > 
> > > A verbal description of the color in which the waveform appears in the plot.
> > > 
> > > **type** *[type= string]*: Line  type **(required)**
> > > 
> > > A verbal description of the graphic type of the line (e.g. continuous, dashed, dotted ...).
> > > 

#  List of papers to be digitalized

- **KUTAS1984161:** Kutas, M., & Hillyard, S. A. (1984). Brain potentials during reading reflect word expectancy and semantic association. Nature, 307(5947), 161–163. doi:10.1038/307161a0

- **KUTAS1993533:** Kutas, M. (1993). In the company of other words: Electrophysiological evidence for single-word and sentence context effects. Language and Cognitive Processes, 8(4), 533–572. doi:10.1080/01690969308407587

- **BESSON19973:** Besson, M. (1997). What’s in a pause: event-related potential analysis of temporal disruptions in written and spoken sentences. Biological Psychology, 46(1), 3–23. doi:10.1016/s0301-0511(96)05215-5

- **PETTEN1999394:** Van Petten, C., Coulson, S., Rubin, S., Plante, E., & Parks, M. (1999). Time course of word identification and semantic integration in spoken language. Journal of Experimental Psychology: Learning, Memory, and Cognition, 25(2), 394–417. doi:10.1037/0278-7393.25.2.394

- **MORENO2002188:** Moreno, E. M., Federmeier, K. D., & Kutas, M. (2002). Switching Languages, Switching Palabras (Words): An Electrophysiological Study of Code Switching. Brain and Language, 80(2), 188–207. doi:10.1006/brln.2001.2588

- **FEDERMEIER2005133:** Federmeier, K. D., & Kutas, M. (2005). Aging in context: Age-related changes in context use during language comprehension. Psychophysiology, 42(2), 133–141. doi:10.1111/j.1469-8986.2005.00274.x

- **FEDERMEIER2005871:** Federmeier, K. D., Mai, H., & Kutas, M. (2005). Both sides get the point: Hemispheric sensitivities to sentential constraint. Memory & Cognition, 33(5), 871–886. doi:10.3758/bf03193082

- **COULSON2007128:** Coulson, S., & Van Petten, C. (2007). A special role for the right hemisphere in metaphor comprehension? Brain Research, 1146, 128–145. doi:10.1016/j.brainres.2007.03.008

- **DIAZ200785:** Diaz, M. T., & Swaab, T. Y. (2007). Electrophysiological differentiation of phonological and semantic integration in word and sentence contexts. Brain Research, 1146, 85–100. doi:10.1016/j.brainres.2006.07.034

- **FEDERMEIER200775:** Federmeier, K. D., Wlotko, E. W., De Ochoa-Dewald, E., & Kutas, M. (2007). Multiple effects of sentential constraint on word processing. Brain Research, 1146, 75–84. doi:10.1016/j.brainres.2006.06.101

- **WLOTKO20073001:** Wlotko, E. W., & Federmeier, K. D. (2007). Finding the right word: Hemispheric asymmetries in the use of sentence context information. Neuropsychologia, 45(13), 3001–3014. doi:10.1016/j.neuropsychologia.2007.05.013

- **BOROVSKY2010289:** Borovsky, A., Kutas, M., & Elman, J. (2010). Learning to use words: Event-related potentials index single-shot contextual word learning. Cognition, 116(2), 289–296. doi:10.1016/j.cognition.2010.05.004

- **DELONG20111203:** Delong, K. A., Urbach, T. P., Groppe, D. M., & Kutas, M. (2011). Overlapping dual ERP responses to low cloze probability sentence continuations. Psychophysiology, 48(9), 1203–1207. doi:10.1111/j.1469-8986.2011.01199.x

- **THORNHILL2012382:** Thornhill, D. E., & Van Petten, C. (2012). Lexical versus conceptual anticipation during sentence processing: Frontal positivity and N400 ERP components. International Journal of Psychophysiology, 83(3), 382–392. doi:10.1016/j.ijpsycho.2011.12.007




