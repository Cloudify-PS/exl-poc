# EXL

Work in progress sample blueprints/Terraform modules to provide as part of the EXL POC.

## Blueprints

### VPC

This [blueprint](./vpc.yaml) creates a VPC in AWS.  
See the [README](./vpc/README.md) for more information.

### EC2

This [blueprint](./ec2-instance.yaml) creates an EC2 instance in AWS.  
See the [README](./ec2/README.md) for more information.

### Ansible Tower

This [blueprint](./ansible_tower.yaml) runs a job deploying a playbook from Ansible Tower.  
See the [README](./ansible_tower/README.md) for more information.

### Ansible Tower Revert Playbook

This [blueprint](./ansible_tower_revert_playbook.yaml) runs a job deploying a playbook from Ansible Tower.  
It creates a job_template with credentials and then runs the job.  
An Ansible Playbook used for this job is by default a playbook that reverts changes introduced by [Ansible Tower blueprint](./ansible_tower.yaml).  
It deletes a file created by [Ansible Tower blueprint](./ansible_tower.yaml) on the EC2 instance.  

### EKS

This [blueprint](./eks.yaml) creates an EKS cluster with a single node group in AWS.
See the [README](./eks/README.md) for more information.
