import os
import indicies

output = indicies.main()

rule all:
    input:
        output

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
