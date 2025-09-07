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
	(cd single-gw; ./up.sh)
singlegw-down:
	(cd single-gw; ./down.sh)
singlegw-serial:
	(cd single-gw; ./serial.sh)
singlegw-info:
	(cd single-gw; ./info.sh)
singlegw-ssh:
	(cd single-gw; ./ssh.sh)