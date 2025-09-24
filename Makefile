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
	dotenvx run -- ./scripts/sp-login.sh
sp-delete:
	dotenvx run -- ./scripts/sp-delete.sh
sp-loginx:
	dotenvx run --  ./scripts/sp-loginx.sh

###
#
# Security Management
#
management: management-up
management-up:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./up.sh)
management-down:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./down.sh)
management-serial:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./serial.sh)
management-info:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./info.sh)
management-ssh:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./ssh.sh)
management-api:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./api.sh)
management-secrets:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./secrets.sh)
management-ssh-add-key:
	(cd management; dotenvx run -f ../.env -fk ../.env.keys -- ./ssh-add-key.sh)

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
# VM access
# 
web-ssh:
	(cd singlegw/; ./web-ssh.sh)
app-ssh:
	(cd singlegw/; ./app-ssh.sh)

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


###
#
# vWAN
#

.PHONY: vwan-up vwan
vwan-up: vwan
vwan:
	(cd vwan; ./up.sh)
vwan-down:
	(cd vwan; ./down.sh)
