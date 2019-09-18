#!/usr/bin/env bash

oci compute vnic-attachment list | jq '.data|.[]|.id' | \
xargs -n1 oci compute vnic-attachment get --vnic-attachment-id | jq '.data|.["vnic-id"]' | \
xargs -n1 oci network vnic get --vnic-id | jq '.data|.["public-ip"]' | \
tr -d "\"" > hosts
