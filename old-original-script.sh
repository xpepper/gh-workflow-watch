#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: gh watch <workflow-name>"
  exit 1
fi

workflow_name="$1"
run_id=$(gh run list -w "$workflow_name" -L 1 --json databaseId --jq '.[0].databaseId')

if [ -z "$run_id" ]; then
  echo "No runs found for workflow '$workflow_name'"
  exit 1
fi

gh run watch "$run_id"
