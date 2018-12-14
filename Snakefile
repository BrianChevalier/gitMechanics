import os 
import indicies

output = indicies.main()

rule all:
    input:
        output

rule run_python:
    input:
        '{path}/{name}.py'
    output:
        '{path}/Figures/{figure_name}.pdf'
    threads: 2
    shell:
        """
        cd {wildcards.path}
        python {wildcards.name}.py
        """

rule tex2pdf_without_py:
    input:
        '{path}/{name}.tex'
    output:
        '{path}/{name}.pdf'
    threads: 2
    run:
        shell("cd {wildcards.path}")
        try:
            shell("cd {wildcards.path} && python {wildcards.name}.py")
        except:
            pass
        shell("cd {wildcards.path} && tectonic {wildcards.name}.tex")
