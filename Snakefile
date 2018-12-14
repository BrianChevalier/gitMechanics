
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

PYS = []
for path in PATHS:
	for subpath in os.listdir(path):
		if subpath.endswith('Main.py'):
			PYS.append('/'.join([path,subpath]))
		elif os.path.isdir(path +'/'+subpath):
			for subsubpath in os.listdir(path+'/'+subpath):
				if subsubpath.endswith('Main.py'):
					PYS.append('/'.join([path,subpath,subsubpath]))

for i, item in enumerate(PYS):
    PYS[i] = item.replace('Main.py','Figures/figurename.pdf')

rule all:
    input:
        PDFS

rule pytex:
    input:
        'mathshortcuts.sty'
        'TitlePage.sty'
        'ExampleProblem.cls'
        '{path}/{name}.tex'
    output:
        '{path}/{name}.pdf'
    threads: 2
    run:
        try:
            shell("cd {wildcards.path} && python {wildcards.name}.py")
        except:
            pass
        shell("cd {wildcards.path} && tectonic {wildcards.name}.tex")
