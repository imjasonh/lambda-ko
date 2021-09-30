#!/usr/bin/env bash

set -euxo pipefail

X86_IMAGE=$(ko publish --bare --platform=linux/amd64 ./)
ARM_IMAGE=$(ko publish --bare --platform=linux/arm64 ./)

aws lambda update-function-code \
  --function-name=imjasonh-x86 \
  --image-uri=${X86_IMAGE}

aws lambda update-function-code \
  --function-name=imjasonh-arm2 \
  --image-uri=${ARM_IMAGE}
