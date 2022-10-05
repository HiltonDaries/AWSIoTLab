#!/bin/bash
#download IoT scripts 
#git clone https://github.com/HiltonDaries/AWSIoTLab.git

# install AWS IoT Python SDK 
pip install AWSIoTPythonSDK

# install jq
#yum install jq -y
apt install jq -y

# get endpoint address
aws iot describe-endpoint --region us-east-1 > endpoint.json

# set  endpoint environment variable
ENDPOINT=$(jq -r '.endpointAddress' endpoint.json)
echo $ENDPOINT
