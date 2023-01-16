#!/bin/bash

set -eu

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export fly_target=${fly_target:-tutorial}
echo "Concourse API target ${fly_target}"
echo "Tutorial $(basename $DIR)"

pushd $DIR
  fly -t tutorial set-pipeline -p pipeline-backhaul-switch-conf -c pipeline_backhaul_switch_conf.yml
  fly -t tutorial check-resource -r pipeline-backhaul-switch-conf/resource-output
  fly -t tutorial trigger-job -j pipeline-backhaul-switch-conf/job-generate-conf-file -w
popd
