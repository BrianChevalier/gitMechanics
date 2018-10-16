import os
import re
classes = []

for filename in os.listdir():
	if '.' not in filename:
		if '_layouts' not in filename:
			if 'assets' not in filename:
				classes.append(filename)

for clas in classes:
	os.chdir(clas)
	print(os.listdir())
	
	os.chdir('../')
	
	
os.chdir('CEE384')
os.chdir('Interpolation')
with open('Main.toc') as f:
	for line in f:
		print(line)
		# \contentsline {section}{\numberline {1}Quadratic Splines}{1}{section.1}
		re.match()
