#!/usr/bin/env cwl-runner

# (Re)generated by BlueBee Platform

$namespaces:
  bb: http://bluebee.com/cwl/
  ilmn-tes: http://platform.illumina.com/rdf/iap/
cwlVersion: cwl:v1.0
class: CommandLineTool
bb:toolVersion: '1'
id: indexBam
requirements:
- class: InitialWorkDirRequirement
  listing:
  - $(inputs.bam_sorted)
- class: ShellCommandRequirement
hints:
- class: DockerRequirement
  dockerPull: clinical_metagenomics_preprocessing:latest
- class: ResourceRequirement
  ilmn-tes:resources:
    tier: standard
    type: standardHiCpu
    size: small
label: samtools_index
doc: Indexing BAM.
stderr: stderr.txt
inputs:
  bam_sorted:
    type: File
    doc: sorted bam input file
    inputBinding:
      position: 3
outputs:
  index:
    type: File
    outputBinding:
      glob:
      - '*.bai'
  error_log:
    type: stderr
arguments:
- position: 2
  valueFrom: -b
- position: 1
  prefix: -@
  valueFrom: \$(nproc --all)
  shellQuote: false
baseCommand:
- samtools
- index
