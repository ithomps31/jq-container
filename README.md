# jq Container

Simple repo for testing various container setups

## Standard
In build.sh, configure $REPO_NAME and $IMAGE_NAME to your own values
```
./build
```

## Minimal
From scratch option setup for RHEL 9
Configure $REPO_NAME and $IMAGE_NAME to your own values
```
sudo ./scratch-build.sh
```

## From Source
First build jq with static linking options, then set $JQ_BIN_LOC, $REPO_NAME, and $IMAGE_NAME to your local values
```
sudo ./binary-scratch.sh
```

## Running Images
Set $CONTAINER_BINARY, $REPO_NAME, and $IMAGE_NAME to local values
```
./run.sh
```

## Pushing to Container Repository
You can setup a free quay account and login with buildah, customize vars and run with
```
./push
```
