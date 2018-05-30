#! /bin/bash 

dcos package install dcos-enterprise-cli

dcos security secrets create -v my_secret_erlrang_cookie  rabbitmq/cookie
dcos security secrets create -v my_secret_pass            rabbitmq/password
dcos security secrets list /

dcos marathon task list

dcos marathon app add rabbit.json

sleep 10

dcos marathon task list
echo
echo "Terminating Launch..."

