#PATHS = ['Contributing','CEE321/Direct-stiffness','CEE421','CEE421/Doubly-Design']
#PDFS = [path+"/Main.pdf" for path in PATHS]

import os
import re

#Exclude these special paths from compiling
exclude = ['assets', 'TEMPLATE']


def viable_paths():
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
	return PATHS


def main_tex_files(PATHS):
	PDFS = []
	for path in PATHS:
		for subpath in os.listdir(path):
			if subpath.endswith('Main.tex'):
				PDFS.append('/'.join([path, subpath]))
			elif os.path.isdir(path + '/' + subpath):
				for subsubpath in os.listdir(path + '/' + subpath):
					if subsubpath.endswith('Main.tex'):
						PDFS.append('/'.join([path, subpath, subsubpath]))
	return PDFS

def pdfs_to_make(PDFS):
	# Replace .tex with .pdf to trigger rules
	for i, item in enumerate(PDFS):
		PDFS[i] = item.replace('.tex', '.pdf')

	return PDFS


def Main_py_files(PATHS):
	PYS = []
	for path in PATHS:
		for subpath in os.listdir(path):
			if subpath.endswith('Main.py'):
				PYS.append('/'.join([path, subpath]))
			elif os.path.isdir(path + '/' + subpath):
				for subsubpath in os.listdir(path + '/' + subpath):
					if subsubpath.endswith('Main.py'):
						PYS.append('/'.join([path, subpath, subsubpath]))
	return PYS
	
def find_py_output(PYS):
	reg = re.compile('savefig\([\'\"](Figures/\w+.pdf)[\'\"].+\)')
	matches = []
	for main in PYS:
		with open(main) as file:
			for line in file:
				match = reg.findall(line)
				# if match found, add to list of outputs
				if match != []:
					match = main.replace('Main.py', match[0])
					matches.append(match)
					
	return matches

def main():
	PATHS = viable_paths()
	TEXPATHS = main_tex_files(PATHS)
	PDFPATHS = pdfs_to_make(TEXPATHS)
	PYS = Main_py_files(PATHS)
	FIGPATHS = find_py_output(PYS)
	
	#FIGPATHS are python outputed figures
	#PDFPATHS are paths to outputed latex figures
	return FIGPATHS + PDFPATHS



if __name__ == "__main__":
	for path in main():
		print(path)
else:
	main()

