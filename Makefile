.PHONY: inject-app-id

inject-app-id:
	echo "const String applicatonId = '${APP_ID}';" > ./lib/secrets.dart