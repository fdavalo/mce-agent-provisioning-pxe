set -x

node=$1
namespace=$2

found="no"
while [[ "$found" == "no" ]]; do
  #fetch agents in $namespace infra env
  oc get agent -n $namespace -o=jsonpath='{range .items[*]}{.metadata.name}{";"}{.status.inventory.interfaces[*].ipV4Addresses}{";"}{.spec.clusterDeploymentName.name}{";"}{.spec.approved}{";"}{.spec.hostname}{"\n"}{end}' > /tmp/agents
  #example output
  #1be53442-30c1-fd84-50ff-6c41dfc2ddd5;["10.6.82.204/24"];test1;true;ocp-node-4
  #42943442-01c1-8b1a-6ae8-d6a10607186a;["10.6.82.73/24"];;false;
  cat /tmp/agents
  
  #fetch ip by node
  ip=`grep $node /tmp/agents | awk -F\; '{print $2;}'`
  if [[ "$ip" != "" ]]; then
   found="yes"
  fi
done
ssh -i /workspace/credentials/privatekey core@$ip echo sudo wipefs -a /dev/sdb
