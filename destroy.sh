#!/bin/bash

set -eu

fly -t tutorial destroy-pipeline --pipeline pipeline-backhaul-switch-conf
