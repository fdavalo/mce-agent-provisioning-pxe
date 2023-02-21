# Provisioning Bare Metal servers for the creation/scale of Openshift clusters

## Use a Tekton Pipeline (Openshift Piepeline) to provision the servers

* LogIn with hpe_redhat user/login on bm1 cluster 

    cf https://console-openshift-console.apps.bm1.redhat.hpecic.net/pipelines/ns/hpe-redhat

* Start **the create-bm4-cluster-assets** pipeline (use empty dir workspace)

[![Start Pipeline](https://github.com/fdavalo/mce-agent-provisioning-pxe/blob/main/provisioning-bm4-pipeline-start.png?raw=true)](provisioning-bm4-pipeline-start.png)

* First task, clean already existing objets (bare metal hosts, agent CRD, ...)

* Then start in parallel, 3 tasks to create the servers

[![Create Servers](https://github.com/fdavalo/mce-agent-provisioning-pxe/blob/main/provisioning-bm4-pipeline-create-asset.png?raw=true)](provisioning-bm4-pipeline-create-asset.png)

* After each server creation ask, launch a task to register the server : bare metal host in Openshift, DHCPD config 

[![Register Servers](https://github.com/fdavalo/mce-agent-provisioning-pxe/blob/main/provisioning-bm4-pipeline-register-asset.png?raw=true)](provisioning-bm4-pipeline-register-asset.png)

* See resulting objects created

[![Agents and Hosts](https://github.com/fdavalo/mce-agent-provisioning-pxe/blob/main/provisioning-bm4-agents-hosts.png?raw=true)](provisioning-bm4-agents-hosts.png)

* And after some minutes, see the Hosts **Available** in the Infrastructure Env (bm4)

[![Infra Env](https://github.com/fdavalo/mce-agent-provisioning-pxe/blob/main/provisioning-bm4-infraenv-hosts.png?raw=true)](provisioning-bm4-infraenv-hosts.png)

