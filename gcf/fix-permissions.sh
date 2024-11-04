#!/bin/bash

set -euo pipefail

source ../.env ||  fatal 2

set -x
# This I created manually.
# The SA is the Compute Service account.

for gcf_endpoint in gcs-gemini-v2b php_amarcord_generate_caption ; do 
    gcloud --project "$PROJECT_ID" functions add-invoker-policy-binding \
        "$gcf_endpoint" \
        --region="$GCP_REGION" \
        --member="serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com"
done