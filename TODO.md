# TODO

- singlegw scenario - add Linux machines to web and app subnets
- auto add authorized SSH keys to VMs - including `management` and `singlegw` scenarios
- password reset for `admin` user on `singlegw`
- make singlegw-up fails on missing SSH key, if no previous SSH session like make management-ssh
- reset password, add key also on `singlegw`
- accept license with `az vm image terms accept --publisher checkpoint --offer check-point-cg-r82 --plan mgmt-byol`
- start with direct Internet access and enable firewall via `singlegw` later
- address localhost before first `make policy-up`


