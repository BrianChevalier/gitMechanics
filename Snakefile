import os
import indicies

output = indicies.main()
print('The following files should be produced:')
for item in output:
    print(item)

output = ['CEE384/taylor-series/Main.pdf',
          'CEE384/taylor-series/Figures/3ordersin.pdf',
          'CEE384/taylor-series/Figures/135ordersin.pdf']
rule all:
    input:
        output

rule python:
    input:
        '{path}/Main.py'
    output:
        '{path}/Figures/{file}.pdf',
        '{path}/Figures/{figure}.pdf'
    shell:
        """
        cd {wildcards.path}
        python Main.py
        """

rule latex:
    input:
        '{path}/Main.tex',
        '{path}/Figures/{file}.pdf',
        '{path}/Figures/{figure}.pdf'
    output:
        '{path}/Main.pdf'
    shell:
        """
        cd {wildcards.path}
        tectonic Main.tex
        """
