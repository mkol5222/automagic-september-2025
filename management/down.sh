#!/bin/bash

set -euo pipefail

terraform destroy -auto-approve

echo "Remaining resources (if any):"
terraform state list
echo "---"
