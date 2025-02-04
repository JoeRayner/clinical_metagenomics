#!/usr/bin/env cwl-runner

# (Re)generated by BlueBee Platform

$namespaces:
  bb: http://bluebee.com/cwl/
  ilmn-tes: http://platform.illumina.com/rdf/iap/
cwlVersion: cwl:v1.0
class: CommandLineTool
bb:toolVersion: '1'
id: '1'
requirements:
- class: InlineJavascriptRequirement
- class: ShellCommandRequirement
hints:
- class: DockerRequirement
  dockerPull: clinical_metagenomics_preprocessing:latest
- class: ResourceRequirement
  ilmn-tes:resources:
    tier: standard
    type: standardHiMem
    size: large
label: bowtie2
stderr: stderr.txt
inputs:
  reference:
    type: Directory
    inputBinding:
      position: 0
      prefix: '-x '
      valueFrom: $(self.path + "/" + self.basename)
  fastq_R1:
    type: File
    doc: read 1 fastq
    inputBinding:
      position: 2
      prefix: '-1'
  fastq_R2:
    type: File
    inputBinding:
      position: 2
      prefix: '-2'
outputs:
  sam:
    type: File
    streamable: true
    outputBinding:
      glob:
      - '*.sam'
  error_log:
    type: stderr
arguments:
- position: 0
  prefix: -p
  valueFrom: \$(nproc --all)
  shellQuote: false
- position: 4
  prefix: -S
  valueFrom: $(inputs.fastq_R1.nameroot).sam
baseCommand:
- bowtie2
