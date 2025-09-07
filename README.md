
# Automagic Check Point - automation tools and labs

###  Getting started

Usually, start by creating a service principal in Azure, and then deploying the management server:
- follow credentials creation instructions in [creds/README.md](creds/README.md)
    * this step happens in [Azure Portal](https://portal.azure.com)
    * resulting credentials are stored in `secrets/` folder of your Codespace/DevContainer of this repo

- we recommend to [fork](https://github.com/mkol5222/automagic-septemper-2025/fork) this repo and contiue in [CodeSpace](https://github.com/codespaces/)/DevContainer on your fork

### Security Management

```bash
# login with previously created Azure creds
make sp-login

# depploy Management server with policy one shot, meassure time spent
time make cpman

# optional: monitor VM preparation progress in another terminal
make cpman-serial

# how to login from SmartConsole
make cpman-info
```

### Single Gateway aka CloudGuard Reference Azure Architecture sk109360

```bash
# login with previously created Azure creds
make sp-login

# deploy single gateway scenario
time make singlegw-up

# optional: monitor VM preparation progress in another terminal
make singlegw-serial

# wait for SIC porrt available
make singlegw-sic

# get how to add gateway to management with CLI
make singlegw-cme

# GW creds and IP info
make singlegw-info

# install policy on gateway
make singlegw-install-policy
```


### Cleanup

```bash
# remove Single Gateway
make singlegw-down

# remove Management
make management-down

# remove Azure creds - in Azure Portal - instructions via:
make sp-delete
```