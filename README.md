# ocp-broker sample

Running Openshift and Ansible Service Broker with two Strimzi APBs, for an easy provisioning from the Service Catalog

## Get going!

```
wget https://raw.githubusercontent.com/project-streamzi/ocp-broker/master/ocp_asb_streamings.sh
chmod +x ocp_asb_streamings.sh
./ocp_asb_streamings.sh
```

If you want to persist the state of your OpenShift cluster across restarts you can pass a parameter to the script which will be used as the `--host-data-dir` for `oc cluster up`.

**NOTE:** You mind need to do this before:

### Linux

```
ifconfig lo:0 192.168.42.1 netmask 255.255.255.0 up

```

### Mac

```
ifconfig lo0 alias 192.168.42.1
```
