import os
import indicies

output = indicies.main()
print('The following files should be produced:')
for item in output:
    print(item)

rule all:
    input:
        output

rule python:
    input:
        '{path}/Main.py'
    output:
        '{path}/Figures/{figname}.pdf'
    shell:
        """
        cd {wildcards.path}
        python Main.py
        """

rule latex:
    input:
        '{path}/Main.tex'
    output:
        '{path}/Main.pdf'
    shell:
        """
        cd {wildcards.path}
        tectonic Main.tex
        """
