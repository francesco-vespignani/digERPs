For each project the four files are provided with the name starting as 'digERPs_' and different extensions:

- *.schema.json*: the json schema 
- *.md*: the documentation of the json schema in markdown
- *.pdf*: the documentation of the json schema in pdf for easy printing
- *.json": an empty json file following the schema

Usage:

Within a json editor which supports schema load the empty json file and 
ask to verify it against the specific schema,  this will allow to have online help
for the compilation of the json annotation file of a specific paper.

Tested editors:

[JSON Editor online (classic)](https://jsoneditoronline.org/classic/index.html)

[Visual Studio Code](https://code.visualstudio.om/)

Codes:

docProject.R and schemaDoc1.Rmd allow to create the documentation of newly implemented schema
on the basis of the schema.json file and of the respective bibliography. 
