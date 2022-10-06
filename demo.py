#!/usr/bin/python

# Lab 1 - Setting up.
# Make sure your host and region are correct.

import sys
import ssl
from AWSIoTPythonSDK.MQTTLib import AWSIoTMQTTClient
import json
import time
import uuid

#Setup our MQTT client and security certificates
#Make sure your certificate names match what you downloaded from AWS IoT

clientId = str(uuid.uuid4())
mqttc = AWSIoTMQTTClient(clientId)

#Use the endpoint from the settings page in the IoT console
mqttc.configureEndpoint("a2cf8kt6n00n98-ats.iot.us-east-1.amazonaws.com",8883)
mqttc.configureCredentials("rootCA.pem","privateKey1.pem","certificate1.pem")

#Function to encode a payload into JSON
def json_encode(string):
        return json.dumps(string)

mqttc.json_encode=json_encode

#Declaring our variables
message ={
  'user': "<name>"
}

#Encoding into JSON
message = mqttc.json_encode(message)

#This sends our test message to the iot topic
def send():
    mqttc.publish("iot", message, 0)
    print("Message Published")


#Connect to the gateway
mqttc.connect()
print("Connected")

#Loop until terminated
while True:
    send()
    time.sleep(5)

mqttc.disconnect()

#To check and see if your message was published to the message broker go to the MQTT Client and subscribe to the iot topic and you should see your JSON Payload
