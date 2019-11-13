#!/bin/sh

version=${TERRAFORM_VERSION:-0.11.8}

docker run --rm -it \
	-e AWS_ACCESS_KEY_ID \
	-e AWS_SECRET_ACCESS_KEY \
	-e AWS_SESSION_TOKEN \
	-e AWS_DEFAULT_REGION \
	-e ATLAS_TOKEN \
	-e TF_LOG \
	-v ~/.ssh:/root/.ssh:ro \
	-v $(pwd):/mnt \
	--workdir /mnt \
	hashicorp/terraform:$version "$@"
