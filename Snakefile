import os
import indicies
import snakemake

output = indicies.main()

#output = ['CEE384/taylor-series/Main.pdf',
#          'CEE384/taylor-series/Figures/3ordersin.pdf',
#          'CEE384/taylor-series/Figures/135ordersin.pdf']

output += ['CEE421/CEE421.tar.gz', 'MAE241/MAE241.tar.gz', 'CEE384/CEE384.tar.gz','Contributing/Contributing.tar.gz','CEE321/CEE321.tar.gz','gitMechanics.tar.gz']

rule all:
    input:
        output

rule python:
    input:
        '{path}/Main.py'
    output:
        expand("{{path}}/Figures/{{figname}}.pdf")
    shell:
        """
        cd {wildcards.path}
        python Main.py
        """

rule latex:
    input:
        indicies.findpys
    output:
        '{path}/Main.pdf'
    shell:
        """
        cd {wildcards.path}
        tectonic Main.tex
        """


rule zipbysubject:
    input:
        indicies.findPdfsInClass
    output:
        '{course}/{course}.tar.gz'
    shell:
        """
        tar -c -f {wildcards.course}/{wildcards.course}.tar.gz {input}
        """
rule zipall:
    input:
        indicies.allMainPdfs
    output:
        'gitMechanics.tar.gz'
    shell:
        """
        tar -c -f gitMechanics.tar.gz {input}
        """













