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
