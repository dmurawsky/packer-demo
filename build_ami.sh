#!/bin/bash -ex

## Build AMI using Packer
source_ami_id="ami-22ce4934"
AMI_PROFILE="apache" #this becomes the name of the ami
SSH_USERNAME="ec2-user"
REGION="us-east-1"
BUILD_NUMBER=1
VPC_ID="vpc-62f46004"
subnet_id="subnet-164ecc2a"
instance_type="t2.small"

single_AMI () {
# Run packer
    /usr/local/bin/packer build -debug \
    -machine-readable \
    -var hvm_amiid=$source_ami_id \
    -var build=$BUILD_NUMBER \
    -var ami_profile=$AMI_PROFILE \
    -var date=$DATE \
    -var vpc_id=$VPC_ID \
    -var subnet_id=$subnet_id \
    -var region=$REGION \
    -var instance_type=$instance_type \
    -var shellUser=$SSH_USERNAME \
    packer.json
}

single_AMI
