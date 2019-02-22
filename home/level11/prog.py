#! /usr/bin/env python3

#! /usr/bin/env python3
import os
from pathlib import Path
import sys
import base64
import json

encoded_password = b'TjRubzNzdFZyYTFtZW50UHI0dGlxdWUK'

filename = os.environ['LEVEL11_FILENAME']

with open(filename, "r") as f:
	content = json.load(f)
	if content["name"]:
		password = base64.b64decode(encoded_password).decode("UTF-8")
		print("Bienvenue {}. The password is {}".format(content["name"], password))
	else:
		print("Entrez votre nom entre les guillemets vides, avec nano, dans le fichier {}".format(filename))
