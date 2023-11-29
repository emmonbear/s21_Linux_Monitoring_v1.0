#!/bin/bash

source ./variables.sh
source ./validation.sh

validation $@
print_report
