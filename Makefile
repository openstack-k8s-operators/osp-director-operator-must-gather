IMAGE_REGISTRY ?= quay.io/openstack-k8s-operators
IMAGE_TAG ?= latest

# MUST_GATHER_IMAGE needs to be passed explicitly to avoid accidentally pushing to openstack-k8s-operators/must-gather
ifndef MUST_GATHER_IMAGE
$(error MUST_GATHER_IMAGE is not set.)
endif

build: podman-build podman-push

# check
check:
	shellcheck collection-scripts/*

podman-build:
	podman build -t ${IMAGE_REGISTRY}/${MUST_GATHER_IMAGE}:${IMAGE_TAG} .

podman-push:
	podman push ${IMAGE_REGISTRY}/${MUST_GATHER_IMAGE}:${IMAGE_TAG}

.PHONY: build podman-build podman-push