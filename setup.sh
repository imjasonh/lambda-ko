#!/usr/bin/env bash

set -euxo pipefail

X86_IMAGE=$(ko publish --bare --platform=linux/amd64 ./)
ARM_IMAGE=$(ko publish --bare --platform=linux/arm64 ./)

aws lambda create-function \
  --function-name=imjasonh-x86 \
  --role=${ROLE} \
  --package-type=Image \
  --code="ImageUri=${X86_IMAGE}"

aws lambda create-function \
  --function-name=imjasonh-arm \
  --role=${ROLE} \
  --package-type=Image \
  --code="ImageUri=${ARM_IMAGE}"
