#!/bin/bash
#
# Usage:
#
# $ scripts/build-diff.sh 20190113_0951 20190114_2136
#

npop reuse -n -s \
  -x output/$1.full.trig.gz \
  -o output/$2-$1.new.trig.gz \
  -a output/$2.full.trig.gz \
  -c cache/$2.cache.txt.gz \
  -r stats/ctable.csv \
  -t '-h MetaboliteSpeciesTopics' \
  input/metaboliteSpecies_$2.trig.gz \
  &> reports/$2-$1.report.txt
#  -f '-h WikipathwaysFingerprints' \

npop ireuse -s \
  -x output/$1.index.trig.gz \
  -o output/$2-$1.index.trig.gz \
  -a output/$2.index.trig.gz \
  -r stats/itable.csv \
  -T "Wikidata Metabolite-Species Nanopublications, version $2" \
  -D "Nanopublications based on statements in Wikidata that specify in which species a particular molecule acts as metabolite, including reference on which that statement is based." \
  -C "0000-0001-7542-0286" \
  -C "0000-0002-1267-0234" \
  cache/$2.cache.txt.gz \
  &>> reports/$2-$1.report.txt

