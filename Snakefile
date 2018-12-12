#PATHS = ['Contributing','CEE321/Direct-stiffness','CEE421','CEE421/Doubly-Design']
#PDFS = [path+"/Main.pdf" for path in PATHS]

import os

#Exclude these special paths from compiling
exclude = ['assets','TEMPLATE']

PATHS = []
#Find viable paths to search
for path in os.listdir():
	if os.path.isdir(path):
		if path.startswith('.'):
			pass
		elif path.startswith('_'):
			pass
		elif path in exclude:
			pass
		else:
			PATHS.append(path)

PDFS = []
for path in PATHS:
	for subpath in os.listdir(path):
		if subpath.endswith('Main.tex'):
			PDFS.append('/'.join([path,subpath]))
		elif os.path.isdir(path +'/'+subpath):
			for subsubpath in os.listdir(path+'/'+subpath):
				if subsubpath.endswith('Main.tex'):
					PDFS.append('/'.join([path,subpath,subsubpath]))

# Replace .tex with .pdf to trigger rules
for i, item in enumerate(PDFS):
    PDFS[i] = item.replace('.tex','.pdf')

rule all:
    input:
        PDFS

ruleorder:  tex2pdf_with_bib > tex2pdf_without_bib

rule tex2pdf_with_bib:
    input:
        '{path}/{name}.tex',
        '{path}/{name}.bib'
    output:
        '{path}/{name}.pdf'
    threads: 2
    shell:
        """
        cd {wildcards.path}
        pdflatex {wildcards.name}
        bibtex {wildcards.name}
        pdflatex {wildcards.name}
        pdflatex {wildcards.name}
        """
rule tex2pdf_without_bib:
    input:
        '{path}/{name}.tex'
    output:
        '{path}/{name}.pdf'
    threads: 2
    shell:
        """
        cd {wildcards.path}
        pdflatex {wildcards.name}
        pdflatex {wildcards.name}
        """
