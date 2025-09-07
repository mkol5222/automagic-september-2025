# CHANGELOG

* 2025-09-07
  - Started new repo based on experience witth `mkol5222/automagic-june-2025`
  - Start with Terraform `.gitignore`
  - DevContainer/CodeSpaces configuration to include Terraform CLI and Azure CLI
  - ADMIN and READER service principals creation, test and login
  - basic Security Management setup using Check Point Terraform module in `management` folder
  - ability to monitor installation progress using `make management-serial`
  - access management with `make management-ssh`
  - info including IP and password with `make management-info`
  - script to wait for Management API to be available with `make management-api`
  - save management credentials for policy automation to `secrets/management.env` with `make management-secrets`
  - basic policy with `make policy-up`
  - single gateway scenario similar to Azure reference architecture sk109360 in `singlegw` folder
  - ability to monitor gateway installation progress using `make singlegw-serial`
  - access gateway with `make singlegw-ssh`
  - info including IP and password with `make singlegw-info`
  - "lite CME" experience with "add simple-gateway" based script `make singlegw-cme`
  - policy package `singlegw` and basic rulebase 
  - install policy on gateway with `make singlegw-install-policy`
  - main `README.md` with getting started and instructions for management and single gateway; and cleanup instructions




