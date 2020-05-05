import json

def handler(event, context):
    print("Received event in undeployed lambda: " + json.dumps(event, indent=2))
