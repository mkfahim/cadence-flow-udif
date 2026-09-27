#!/bin/bash

atsh_info() {
	local message=$1
	echo "INFO_ATSH_UDIF: $message"
}

atsh_error() {
	local message=$1
	echo "ERROR_ATSH_UDIF: $message"
	exit 1
}

