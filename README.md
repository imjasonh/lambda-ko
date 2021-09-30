# Demo: Using `ko` to build and run on AWS Lambda

### One time setup

1. Create an ECR repository
  - set `KO_DOCKER_REPO=[account-number].dkr.ecr.[region].amazonaws.com/[repository]`
1. Get the Lambda role URN
  - set `ROLE=[account-number]:role/service-role/[role-name]`
1. Build and create the functions
  - `./setup.sh` will build images and create the functions.

### Each code update

1. Build and update the functions
  - `./deploy.sh` will build images and update the functions.


### Known Issues

- For now, you can't use the `aws` CLI to create functions that specify CPU
  architectures (`--architectures`); this seems to only be available in the v1
  CLI. Until this is supported, create these functions in the console UI.

- Lambda doesn't seem to allow you to specify multi-arch images, so you need to
  build arch-specific images and deploy them to the correct function
  architecture.
