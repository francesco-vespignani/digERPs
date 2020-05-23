library(jsonlite)
library(knitr)
library(RefManageR)
library(rcrossref)


catElement <- function(var, element, req=0) {
	cat(paste('**',var,'**', sep=''))
	if ( any (names(element)== "type") ) {
		if (element$type=='array') {
			cat(paste(' *[type= ',element$type,' of ',element$items$type,']*', sep=''))
		} else {
			cat(paste(' *[type= ',element$type,']*', sep=''))
		}
	}
	if(req) {
		cat(paste(': ',element$title,' **(required)**\n\n', sep=''))
	} else {
		cat(paste(': ',element$title,'\n\n', sep=''))
	}
	cat(paste(element$description,'\n\n', sep=''))
	if ( any (names(element)== "enum") ) {
		cat(paste('*Possible values:*','\n\n', sep=''))
		cat(paste('\"',element$enum, '\"', sep=''), sep=', ')
		cat('\n\n')
	}
	if ( any (names(element)== "examples") ) {
		cat(paste('*Examples:*','\n\n', sep=''))
		cat(paste('\"',element$examples, '\"', sep=''), sep=', ')
		cat('\n\n')
	}
}

catElementRec <- function(var, element, level, req=0) {
	rec = 0 
	isobj = 0
	prefix = ''
	if (level >0) {
		for (i in 1:level) {
			prefix = paste('> ', prefix, sep='')
		}
	}
	cat(paste(prefix,'**',var,'**', sep=''))
	if ( any (names(element)== "type") ) {
		if (element$type=='array') {
			cat(paste(' *[type= ',element$type,' of ',element$items$type,']*', sep=''))
			rec = 1
			nvar = paste(var,'elements:')
			nel = element[['items']]

		} else if (element$type=='object') {
			cat(paste(' *[type= ',element$type,']*', sep=''))
			rec = 1 
			isobj = 1			
		} else {
			cat(paste(' *[type= ',element$type,']*', sep=''))
		
		}
	}
	if(req) {
		cat(paste(': ',element$title,' **(required)**\n',prefix,'\n', sep=''))
	} else {
		cat(paste(': ',element$title,'\n',prefix,'\n', sep=''))
	}
	cat(paste(prefix, element$description,'\n',prefix,'\n', sep=''))
	if ( any (names(element)== "enum") ) {
		cat(paste(prefix,'*Possible values:*','\n', sep=''))
		cat(paste('\"',element$enum, '\"', sep=''), sep=', ')
		cat(paste('\n',prefix,'\n', sep=''))
	}
	if ( any (names(element)== "examples") ) {
		cat(paste(prefix,'*Examples:*','\n', sep=''))
		cat(paste('\"',element$examples, '\"', sep=''), sep=', ')
		cat(paste('\n',prefix,'\n', sep=''))
	}
	if (rec) {
		if(isobj) {
			names = names(element$properties)
			req = names %in% element$required
			for (i in 1:length(names)) {	
				catElementRec(names[i], element$properties[[names[i]]], level+1, req[i])
			}
		} else {
			catElementRec(nvar, nel, level+1)
		}
	} else {
		cat('\n')
	}
}

example <- function () {
#schema = fromJSON(readLines('digERPs_minimal.schema.json'))

name = 'frontalPNP'
schema = fromJSON(readLines('digERPs_frontalPNP.schema.json'))
author = "Francesco Vespignani"
bib = ReadBib(paste(name,'.bib', sep=''))
apa = cr_cn(bib[]$doi, 'text','apa')

knit('schemaDoc1.Rmd')
knit('schemaDoc2.Rmd')
system('pandoc schemaDoc1.md -o schemaDoc1.pdf')
system('pandoc schemaDoc2.md -o schemaDoc2.pdf')
}

docProject <- function(name) {

schema = fromJSON(readLines(paste('digERPs_',name,'.schema.json', sep='')))
author = ""
bib = ReadBib(paste(name,'.bib', sep=''))
apa = cr_cn(bib[]$doi, 'text','apa')

knit('schemaDoc1.Rmd')
system(paste('pandoc schemaDoc1.md -o digERPs_',name,'.schema.pdf', sep=''))
system(paste('mv schemaDoc1.md digERPs_',name,'.schema.md', sep=''))

}
