#!/bin/bash

apt update
apt install -y software-properties-common
echo | apt add-repository ppa:ansible/ansible 
apt update
apt install -y ansible
