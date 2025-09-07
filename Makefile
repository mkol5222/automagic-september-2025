###
#
# cpman = multiple Management deploymennt steps
#

cpman: management-up management-api  management-secrets policy-up management-info
cpman-up: cpman
cpman-down: management-down
cpman-serial: management-serial
cpman-ssh: management-ssh
cpman-info: management-info
cpman-api: management-api

###
#
# Service Principal
#

reader-test:
	./scripts/reader-test.sh
sp-login:
	./scripts/sp-login.sh
sp-delete:
	./scripts/sp-delete.sh

###
#
# Security Management
#
management: management-up
management-up:
	(cd management; ./up.sh)
management-down:
	(cd management; ./down.sh)
management-serial:
	(cd management; ./serial.sh)
management-info:
	(cd management; ./info.sh)
management-ssh:
	(cd management; ./ssh.sh)
management-api:
	(cd management; ./api.sh)
management-secrets:
	(cd management; ./secrets.sh)

###
#
# Policy
#

policy: policy-up
policy-up:
	(cd policy; ./up.sh)

###
#
# Single Gateway
#
singlegw: singlegw-up
singlegw-up:
	(cd singlegw; ./up.sh)
singlegw-down:
	(cd singlegw; ./down.sh)
singlegw-serial:
	(cd singlegw; ./serial.sh)
singlegw-info:
	(cd singlegw; ./info.sh)
singlegw-ssh:
	(cd singlegw; ./ssh.sh)
singlegw-cme:
	(cd singlegw; ./cme.sh)