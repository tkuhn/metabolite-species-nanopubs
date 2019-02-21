#!/bin/bash
#
# Usage:
#
# $ scripts/build-start.sh 20190113_0951
#

echo "file,reusableCount,inputCount,reuseCount,topicMatchCount,intopicDuplCount,outTopicDuplCount,topicMatchErrors" \
  >> stats/ctable.csv
echo "file,reuseCount" \
  >> stats/itable.csv

npop reuse -n -s \
  -o output/$1.full.trig.gz \
  -c cache/$1.cache.txt.gz \
  -r stats/ctable.csv \
  -t '-h MetaboliteSpeciesTopics' \
  input/metaboliteSpecies_$1.trig.gz \
  &> reports/$1.report.txt
#  -f '-h WikipathwaysFingerprints' \

npop ireuse -s \
  -o output/$1.index.trig.gz \
  -r stats/itable.csv \
  -T "Wikidata Metabolite-Species Nanopublications, version $1" \
  -D "Nanopublications based on statements in Wikidata that specify in which species a particular molecule acts as metabolite, including reference on which that statement is based." \
  -C "0000-0001-7542-0286" \
  -C "0000-0002-1267-0234" \
  cache/$1.cache.txt.gz \
  &>> reports/$1.report.txt
