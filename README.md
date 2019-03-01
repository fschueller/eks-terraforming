# EKS on AWS using Terraform

This recipe automates setup of an Elastic Kubernetes Service (EKS) on AWS. It was created to simplify deployment of [SUSE Cloud Foundry](https://github.com/SUSE/scf) which takes Kubernetes as a foundation. 

:warning: Please note the SCF specific security groups in `eks/terraform/eks-worker.tf`

===
 1. Go to folder `eks/terraform`
 2. Run `terraform apply` to create the cluster in AWS
 3. Make sure you have the [latest `kubectl` ready](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
 4. Make sure you have the [latest `helm` ready](https://github.com/helm/helm/releases).
 5. Make sure you have the [`aws-iam-authenticator` binary ready](https://github.com/kubernetes-sigs/aws-iam-authenticator).
 6. Run `terraform output config-map-auth` and save the output to a `<filename>.yml`.
    NOTE: make sure it's correctly formatted. See an example of the correct format in `eks/terraform/config-map-auth.yaml.example`.
 7. Run `kubectl apply -f <filename>.yml` to create a configmap to connect to your EKS cluster.
 8. Check the health of your workers with `kubectl get nodes`.
 9. (OPTIONAL) Have a look at [this guide](https://github.com/SUSE/scf/wiki/Deployment-on-Amazon-EKS) for setting up SUSE Cloud Application Platform on top of it.


Don't hesistate to contribute or open issues if configuration becomes outdated or is no longer functional!
