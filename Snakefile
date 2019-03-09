import os
import indicies
import snakemake

output = indicies.main()


output += ['CEE421/CEE421.tar.gz', 'MAE241/MAE241.tar.gz', 'CEE384/CEE384.tar.gz','Contributing/Contributing.tar.gz','CEE321/CEE321.tar.gz','gitMechanics.tar.gz']

# for jupyterblog
output += ['_jupyterblog/' + each.replace('.ipynb','.md') for each in os.listdir('_jupyterblog') if each.endswith('.ipynb')]

# for octave blog
output += ['_octaveblog/' + each.replace('.ipynb','.md') for each in os.listdir('_octaveblog') if each.endswith('.ipynb')]


print(output)

rule all:
    input:
        output

rule python:
    input:
        '{path}/Main.py'
    output:
        expand("{{path}}/Figures/{{figname}}.pdf")
    conda:
        "envs/other.yaml"
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
    conda:
        "envs/other.yaml"
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

rule pythonNotebookTomd:
    input:
        '_jupyterblog/{name}.ipynb'
    output:
        '_jupyterblog/{name}.md'
    conda:
        "envs/other.yaml"
    shell:
        """    
        jupyter nbconvert --to notebook --inplace --execute _jupyterblog/{wildcards.name}.ipynb
        jupyter nbconvert --to markdown _jupyterblog/{wildcards.name}.ipynb
        """


rule octaveNotebookTomd:
    input:
        '_octaveblog/{name}.ipynb'
    output:
        '_octaveblog/{name}.md'
    conda:
        "envs/octave.yaml"
    shell:
        """
        jupyter nbconvert --ExecutePreprocessor.kernel_name=octave --to notebook --inplace --execute _octaveblog/{wildcards.name}.ipynb
        jupyter nbconvert --to markdown _octaveblog/{wildcards.name}.ipynb
        """


