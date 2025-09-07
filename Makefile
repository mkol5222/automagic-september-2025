###
#
# cpman = multiple Management deploymennt steps
#

cpman: management-up management-api  management-secrets policy-up management-ssh-add-key management-info
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
management-ssh-add-key:
	(cd management; ./ssh-add-key.sh)

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
singlegw-install-policy:
	(cd management; ./ssh.sh mgmt_cli -r true install-policy policy-package singlegw)
singlegw-sic:
	(cd singlegw; ./sic.sh)
singlegw-pass-reset:
	(cd singlegw; ./pass-reset.sh)
singlegw-ssh-add-key:
	(cd singlegw; ./ssh-add-key.sh)


###
#
# Experiments
#

# works with: make run ARG=hello
# or: export ARG=hello; make run
# or: ARG=hello make run
# ARG has a default value if not set
ARG ?= default_value
run:
	@echo "Running with argument: $(ARG)"
