import os
import indicies
import re

pdfs = indicies.outputpdfs()
reg = re.compile('\\\\coursenum\{(\w+)\}')
reg1 = re.compile('\\\\title\{(\w+)\}')
Data = {}
matches = []
for path in pdfs:
	path = path.replace('.pdf', '.tex')
	with open(path) as Main:
		for line in Main:
			match = reg.findall(line)
			title = reg1.findall(line)
			# if match found, add to list of outputs
			if match != []:
				Data[match[0]] = {}
				coursenum = match[0]""
			if title != []:
				Data[coursenum]['title'] = title[0]
			

text = """
---
layout: default
title: "Contributing"
---

{%- assign pdflink = "/Contributing/Main.pdf" -%}

<div markdown="1">
# {{ page.title }}
## 
 * 
</div>
"""
