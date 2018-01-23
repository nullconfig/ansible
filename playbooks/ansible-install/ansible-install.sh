#!/bin/bash
# installing the latest version of ansible
# on Ubunut 16.04

CFG="./ansible-install.cfg"

if [ -f $CFG ]
then 
  . $CFG
  echo "Configuration file loaded[+]"
  ${UPDATE}
  ${INSTALL} software-properties-common python-pip python-dev python3-dev libssl-dev -y
  ${ADD} ppa:ansible/ansible
  ${UPDATE}
  ${PIP} pip --upgrade
  ${PIP} setuptools --upgrade
  ${INSTALL} ansible -y
fi


