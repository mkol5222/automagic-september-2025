#!/bin/bash

set -euo pipefail

terraform destroy

echo "Remaining resources (if any):"
terraform state list
echo "---"
