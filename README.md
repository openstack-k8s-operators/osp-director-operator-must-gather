# osp-director-operator-must-gather
OCP must-gather scripts for osp-director-operator logs/data collection

## Usage

(optional) Build and push the must-gather image to a registry:

```
git clone ssh://git@github.com/openstack-k8s-operators/osp-director-operator-must-gather.git
cd osp-director-operator-must-gather
IMAGE_TAG=<tag> IMAGE_REGISTRY=<registry> MUST_GATHER_IMAGE=must-gather make
```

On a machine where you have `oc adm` access, do the following:

```
oc adm must-gather --image=<registry>/must-gather:<tag>
```

When generation is finished, you will find the dump in the current directory under `must-gather.local.XXXXXXXXXX`.  The directory
structure will look something like this (truncated for readability):

```
must-gather.local.7079684121838056125/
└── XXXXXXX-must-gather-sha256-4f688c549604a1ca3b0afdfe5adc26d525a1ba6a16c23b7a7445212a3839e1c2
    ├── apiservices
    ├── cluster-scoped-resources
    │   ├── apiextensions.k8s.io
    │   │   └── customresourcedefinitions
    │   ├── metal3.io
    │   │   └── provisionings
    │   ├── nmstate.io
    │   │   ├── nodenetworkconfigurationenactments
    │   │   ├── nodenetworkconfigurationpolicies
    │   │   └── nodenetworkstates
    ├── namespaces
    │   ├── openshift-cnv
    │   ├── openshift-machine-api
    │   ├── openshift-marketplace
    │   ├── openshift-operator-lifecycle-manager
    │   ├── openshift-sriov-network-operator
    │   └── openstack
    │       ├── cdi.kubevirt.io
    │       │   └── datavolumes
    │       ├── controller-cloudinit
    │       ├── controller-controller-0-networkdata
    │       ├── core
    │       │   ├── configmaps
    │       │   ├── pods
    │       │   └── secrets
│   │       ├── crs
│   │       │   ├── openstackbackuprequests.osp-director.openstack.org
│   │       │   ├── openstackbackups.osp-director.openstack.org
│   │       │   ├── openstackbaremetalsets.osp-director.openstack.org
│   │       │   ├── openstackclients.osp-director.openstack.org
│   │       │   ├── openstackconfiggenerators.osp-director.openstack.org
│   │       │   ├── openstackcontrolplanes.osp-director.openstack.org
│   │       │   ├── openstackephemeralheats.osp-director.openstack.org
│   │       │   ├── openstackipsets.osp-director.openstack.org
│   │       │   ├── openstackmacaddresses.osp-director.openstack.org
│   │       │   ├── openstacknetattachments.osp-director.openstack.org
│   │       │   ├── openstacknetconfigs.osp-director.openstack.org
│   │       │   ├── openstacknets.osp-director.openstack.org
│   │       │   ├── openstackprovisionservers.osp-director.openstack.org
│   │       │   └── openstackvmsets.osp-director.openstack.org
    │       ├── hco.kubevirt.io
    │       ├── heat-env-config
    │       ├── image.openshift.io
    │       ├── k8s.cni.cncf.io
    │       │   └── network-attachment-definitions
    │       ├── kubevirt.io
    │       │   ├── virtualmachineinstances
    │       │   └── virtualmachines
    │       ├── openstackclient
    │       ├── openstackclient-sh
    │       ├── openstack-f7898fddb-jhvwk
    │       ├── openstack-httpd-config
    │       ├── openstackplaybook-script-default
    │       ├── operators.coreos.com
    │       │   ├── catalogsources
    │       │   └── clusterserviceversions
    │       ├── osp-controlplane-ssh-keys
    │       ├── osp-director-operator-controller-manager-6f4d44bf6-qmjhd
    │       ├── osp-director-operator-index-nlrvj
    │       ├── osp-director-operator-openstackplayboo-4750bfb2-dockercfg-xhvmr
    │       ├── pods
    │       │   ├── openstackclient
    │       │   ├── openstack-f7898fddb-jhvwk
    │       │   ├── osp-director-operator-controller-manager-6f4d44bf6-qmjhd
    │       │   ├── osp-director-operator-index-nlrvj
    │       │   └── virt-launcher-controller-0-7tvhg
    │       ├── snapshot.kubevirt.io
    │       ├── tripleo-deploy-config
    │       ├── tripleo-tarball-config
    │       └── virt-launcher-controller-0-7tvhg
    └── webhooks
        ├── mutating
        └── validating
```
