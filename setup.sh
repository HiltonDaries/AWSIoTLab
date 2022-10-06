#!/bin/bash
#download IoT scripts 
#git clone https://github.com/HiltonDaries/AWSIoTLab.git

# install AWS IoT Python SDK 
pip install AWSIoTPythonSDK

# install jq
sudo yum install jq -y
#apt-get install jq -y

#get key and cert for demo.py
wget -O certificate1.pem "https://iot-training-thing.s3.us-west-2.amazonaws.com/certificate1.pem?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLWVhc3QtMSJHMEUCIEwZiJ5CWOXLBEHKGWSFA8YXQCnwoQ0zO0tVfV%2FPyFX%2BAiEAk%2F3M1t697WpmnnRy87Ao7NlHIGMdX6vH2AGIzgmgg%2BIq7gII6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARADGgw0NDU3MTgwODc3NzIiDNskQ0rV1C9xDg9fcirCAt3%2BZeQboZU92FqIqGUNfdWOZ3lAC3FT31K%2FWeljDYk0HXzRQR3lOeKNAz5BonNdooImlVX1urH4rExGLgo%2B1E4huUBJuM1BhLZp%2FSkViWQX6EtxIb49W%2FRSqH6ajg4DQGG0zVLbFkvZ5mjINMmmejX11ClYMIpDpl8bbqZs3ET4y0%2B2rHwoNgccd78AXCl%2F33fyBCz73rP8bZt6PFFuUkd%2B9v6tzLD%2Bh7NdF0nFEI2RtwpXZ%2Bhh5ItJosW7eG%2Fy%2By97z9FEwxNET4U3DkM7qR%2BdcWAAeskU8SGzN1TZMofS5P1hIzsJSkWHglbOY21b%2Fy%2BwHNJ1FtckTGrmBYaHeOUzskqb%2BHXgMYB13BgS%2BaHAJeERFSAVQmL5uGfnPrr78x5TApR2TNYeMUQseQrIxwRdskPAoRVG5yjt%2B19J%2BHWQ0wgwsOP5mQY6hwKPY8ED9KTAVymaPMpTNnmoDVJy5jhG0Jwustx%2BIUv0ioOJ6aZJhohYlBiDZ1nRoEwRTvrz5vEWoLSRFM2OTBLp1xYGcSFgQXXG9Qg4EkhZcskXH%2BCRI6bL1k8su6PKEJhSte9i87cBVhbC5GEAGDv7XB7PqopRLoJbl0G05RKWEOqkttelty1adgqP2R%2FGQKCk15qOvXs1wcD%2FuRPQk4834%2BDJN3cEesaN2LVt2PRmdzLaN0Pwu%2FQOM2c2m1%2BaL9p%2Fj6wkMmmx2Micz3ym2bVksn4%2BqgWRRPl3fFimbOPx7eVXocn%2FykOaaiNhjGBgRZ3vCRTllyPMVRODJS0KNmZ0UQOO282mKg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221006T063550Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAWPRW6JBOPNMQWKZM%2F20221006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=8bb6f8f80b61e4cb278d6021182f0345f6adcfa18da7384d91f27b94a4a124bd"
wget -O privateKey1.pem "https://iot-training-thing.s3.us-west-2.amazonaws.com/privateKey1.pem?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLWVhc3QtMSJHMEUCIEwZiJ5CWOXLBEHKGWSFA8YXQCnwoQ0zO0tVfV%2FPyFX%2BAiEAk%2F3M1t697WpmnnRy87Ao7NlHIGMdX6vH2AGIzgmgg%2BIq7gII6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARADGgw0NDU3MTgwODc3NzIiDNskQ0rV1C9xDg9fcirCAt3%2BZeQboZU92FqIqGUNfdWOZ3lAC3FT31K%2FWeljDYk0HXzRQR3lOeKNAz5BonNdooImlVX1urH4rExGLgo%2B1E4huUBJuM1BhLZp%2FSkViWQX6EtxIb49W%2FRSqH6ajg4DQGG0zVLbFkvZ5mjINMmmejX11ClYMIpDpl8bbqZs3ET4y0%2B2rHwoNgccd78AXCl%2F33fyBCz73rP8bZt6PFFuUkd%2B9v6tzLD%2Bh7NdF0nFEI2RtwpXZ%2Bhh5ItJosW7eG%2Fy%2By97z9FEwxNET4U3DkM7qR%2BdcWAAeskU8SGzN1TZMofS5P1hIzsJSkWHglbOY21b%2Fy%2BwHNJ1FtckTGrmBYaHeOUzskqb%2BHXgMYB13BgS%2BaHAJeERFSAVQmL5uGfnPrr78x5TApR2TNYeMUQseQrIxwRdskPAoRVG5yjt%2B19J%2BHWQ0wgwsOP5mQY6hwKPY8ED9KTAVymaPMpTNnmoDVJy5jhG0Jwustx%2BIUv0ioOJ6aZJhohYlBiDZ1nRoEwRTvrz5vEWoLSRFM2OTBLp1xYGcSFgQXXG9Qg4EkhZcskXH%2BCRI6bL1k8su6PKEJhSte9i87cBVhbC5GEAGDv7XB7PqopRLoJbl0G05RKWEOqkttelty1adgqP2R%2FGQKCk15qOvXs1wcD%2FuRPQk4834%2BDJN3cEesaN2LVt2PRmdzLaN0Pwu%2FQOM2c2m1%2BaL9p%2Fj6wkMmmx2Micz3ym2bVksn4%2BqgWRRPl3fFimbOPx7eVXocn%2FykOaaiNhjGBgRZ3vCRTllyPMVRODJS0KNmZ0UQOO282mKg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221006T063625Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAWPRW6JBOPNMQWKZM%2F20221006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=ae541ed59dd38a5fdeccbdac6d987089925851d126fa6bc6631e06b206b182a2"  


# get endpoint address
# aws iot describe-endpoint --region us-east-1 > endpoint.json

# set  endpoint environment variable
#ENDPOINT=$(jq -r '.endpointAddress' endpoint.json)
#echo $ENDPOINT

# Clone the repository
git clone https://github.com/aws/aws-iot-device-sdk-python-v2.git
# Install using Pip (use 'python' instead of 'python3' on Windows)
python3 -m pip install ./aws-iot-device-sdk-python-v2
