#!/bin/bash

# pip dependcies for juniper role
docker exec awx_task sh -c "pip install --upgrade pip"
docker exec awx_task sh -c "pip install junos-eznc"
docker exec awx_task sh -c "pip install jxmlease"