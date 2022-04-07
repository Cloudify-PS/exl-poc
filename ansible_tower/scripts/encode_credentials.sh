#!/bin/bash


encoded=`echo -n "${ANSIBLE_TOWER_USERNAME}:${ANSIBLE_TOWER_PASSWORD}" | base64`
ctx instance runtime-properties credentials $encoded
