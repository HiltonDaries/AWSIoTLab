https://catalog.workshops.aws/aws-iot-immersionday-workshop/en-US/basics

Setup
1. Create stack - AWSIoTLabCloud9.yml 
2. Open C9 instance - URL in outputs tab in Cloudformation console
3. Navigate to the aws-iot-labs folder: `cd aws-iot-lab/`
4. Run the setup.sh - `sudo ./setup.sh`

IoT samples:
A:
1. In a terminal `cd aws-iot-lab`
2. Open demo.py, edit line 29 with your name/handle and save file
2. python demo.py

B:
1. Create thing, certificates and new policy (open policy) while stack is being created
2. Create thing “ratchet” with unnamed shadow, auto-generate certs, create new policy
3. Download cert, public and private keys
4. Extract certs and upload to C9 folder assets/lab1
5. Rename files to certificate.pem and privateKey.pem - make sure of filenames as code references it
6. Get your endpoint - `aws iot describe-endpoint` or `AWS IoT Console > Settings > Endpoints` 
7. Edit the ratchet.py file and paste the endpoint in the ratchet.py at line 18.
8. In a terminal `cd aws-iot-lab`
9. python ratchet.py
10. Open mqtt test console in IoT console and subscribe to # topic
11. See messages coming in

Shadow samples:

A:
1. Edit the shadow1.py to add your endpoint to line 23
2. python shadow1.py
3. Check the mqtt test console for messages 
4. Navigate to the shadow in the console for the "ratchet" thing

B:
1. Edit the shadow2.py to add your endpoint to line 23
2. python shadow2.py
3. Check the mqtt test console for messages 
4. Navigate to the shadow in the console for the ratchet thing and update the shadow using the contents of the shadowState.json file
5. See the changes in the C9 console
6. Change the state in the console between ON and OFF and see how it reacts
