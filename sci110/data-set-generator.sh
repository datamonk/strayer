#!/bin/bash

# Generate sample dataset for db benchmarking assignment.

test_dataset="/home/afcamar/Desktop/test_data_20180120.csv"

touch ${test_dataset}

for k in {0..1000000}; do
  echo "${k},$((1 + RANDOM % 9))" >> ${test_dataset}
done
