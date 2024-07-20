#!/bin/bash
source ./devel/setup.sh

roslaunch myep_bsae myep_base.launch & sleep 5;

roslaunch robot_decision mapping_tiantu.launch;

wait

