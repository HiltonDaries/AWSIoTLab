# AWSIoTLab

Workshop and code samples from the AWS IoT Workshop - https://catalog.workshops.aws/aws-iot-immersionday-workshop/en-US/aws-iot-core/lab1-gettingstarted

Setup and IoT sample:

1. Create stack - takes about 10 minutes 
2. Create thing, certificates and new policy (open policy) while stack is being created
3. Create thing “ratchet” with unnamed shadow, auto-generate certs, create new policy
4. Download cert, public and private keys
5. Extract certs and upload to C9 folder assets/lab1
6. Rename files to certificate.pem and privateKey.pem - make sure of filenames
7. Edit the ratchet.py file and paste code from the workshop
8. aws iot describe-endpoint --region us-east-1 and paste the endpoint in the ratchet.py at line 18.
9. In a terminal cd to assets/lab1
10. pip install AWSIoTPythonSDK
11. python ratchet.py
12. Open mqtt test console in IoT console and subscribe to # topic
13. See messages coming in

Shadow sample:

1. Edit the shadow1.py to add your endpoint to line 23
2. python shadow1.py
3. Check the mqtt test console for messages 
4. Navigate to the shadow in the console for the ratchet thing

1. Edit the shadow2.py to add your endpoint to line 23
2. python shadow2.py
3. Check the mqtt test console for messages 
4. Navigate to the shadow in the console for the ratchet thing and update the shadow using the contents of the shadowState.json file
5. See the changes in the C9 console
6. Change the state in the console between ON and OFF and see how it reacts
