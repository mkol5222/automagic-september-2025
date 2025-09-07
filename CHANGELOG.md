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




