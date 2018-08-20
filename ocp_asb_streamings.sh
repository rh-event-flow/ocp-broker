#!/bin/bash

#
# Minimal example for deploying latest built 'Ansible Service Broker'
# on oc cluster up
#

PUBLIC_IP=${PUBLIC_IP:-"192.168.42.1"}
HOSTNAME=${PUBLIC_IP}.nip.io
ROUTING_SUFFIX="${HOSTNAME}"

echo "Starting Openshift Cluster"
oc cluster up --enable=service-catalog,template-service-broker,router,registry,web-console,persistent-volumes,sample-templates,rhel-imagestreams --routing-suffix=${ROUTING_SUFFIX} --public-hostname=${PUBLIC_IP};

#
# Logging in as system:admin so we can create a clusterrolebinding and
# creating ansible-service-broker project
#
echo "sytem:admin login"
oc login -u system:admin

echo "Applying Automation-Broker template"
oc apply -f ./install.yaml

# Set some permissions:
oc adm policy add-cluster-role-to-user access-asb-role developer
oc adm policy add-cluster-role-to-user cluster-admin developer

oc login -u developer -p developer
oc project myproject
