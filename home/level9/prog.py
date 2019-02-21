#! /usr/bin/env python3
import os
from pathlib import Path
import sys
import base64

encoded_password = b'M252aXIwbm1lbnQ='

origin_p = os.environ['LEVEL9_FILENAME']
destination_p= os.environ['LEVEL9_DESTINATION']
origin_content = os.environ["LEVEL9_CONTENT"]

origin = Path(origin_p)
destination = Path(destination_p)

if origin.exists() or not destination.exists():
	print("Veuillez déplacer le fichier {} vers {}".format(origin_p, destination_p))
	sys.exit(1)

if destination.is_file():
	with open(destination_p, "r") as f:
		content = f.read()
		if content.strip() == origin_content.strip():
			password = base64.b64decode(encoded_password).decode("UTF-8")
			print("The password is {}".format(password))
