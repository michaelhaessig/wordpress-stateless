# gcloud create new container cluster

- List the available zones
For easier command line use, we set our desired compute zone. This dictates in which data center the cluster is going to be started in.
> gcloud compute zones list

- Select a zone from the list
> gcloud config set compute/zone  <zone>"

- Create new cluster
To save costs we do provide some additional settings like image type and node count.

> gcloud container clusters create example-cluster --zone europe-west1-d  --machine-type g1-small --num-nodes 2 --no-enable-cloud-endpoints --no-enable-cloud-monitoring"

- Fetch credentials to allow to control the cluster via kubectl command line tool
> gcloud container clusters get-credentials example-cluster

# gcloud clean up
- To temporary stop the cluster
> gcloud container clusters resize example-cluster --size=0

- To delete the cluster
> gcloud container clusters delete example-cluster
