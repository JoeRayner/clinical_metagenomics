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
label: trim_galore
stdout: stdout.txt
stderr: stderr.txt
inputs:
  fastqs:
    type: File
    doc: pair of input fastqs
    inputBinding:
      position: 3
      prefix: --paired
  fastq2:
    type: File
    inputBinding:
      position: 4
  quality:
    type: int
    doc: quality score for threshold for timming
    default: 20
    inputBinding:
      position: 1
      prefix: -q
  length:
    type: int
    doc: |-
      Discard reads that became shorter than length INT because of either
      quality or adapter trimming. A value of '0' effectively disables
      this behaviour. Default: 20 bp.
    default: 25
    inputBinding:
      position: 2
      prefix: --length
outputs:
  fastq_R1:
    type: File
    outputBinding:
      glob:
      - '*val_1.fq.gz'
  fastq_R2:
    type: File
    outputBinding:
      glob:
      - '*val_2.fq.gz'
  report_1:
    type: File
    doc: trimming report r1
    outputBinding:
      glob:
      - '*R1*trimming_report.txt'
  report_2:
    type: File
    doc: trimming report r2
    outputBinding:
      glob:
      - '*R2*trimming_report.txt'
  error_log:
    type: stderr
  out_log:
    type: stdout
arguments:
- position: 5
  prefix: -o
  valueFrom: ./
- position: 8
  prefix: -j
  valueFrom: \$(nproc --all)
  shellQuote: false
baseCommand:
- trim_galore
