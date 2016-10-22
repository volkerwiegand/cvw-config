#!/bin/bash
# vim: set ts=8 tw=0 noet :

#################################################################################
######
###### Setup CVW-Config access
######
###### (c) 2016 Volker Wiegand <volker.wiegand@cvw.de>
######          This file is part of "CVW Config"
######          See LICENSE for copyright information
######
#################################################################################

# Exit on error
set -e -o pipefail

# Find real path
_dir=$( cd "$(dirname "$0")" ; pwd -P ) 


#################################################################################
######
###### Service functions
######
#################################################################################

function failure
{
	local text="$*"

	echo "" >&2
	if [[ -z $text ]] ; then
		echo "Failure." >&2
	else
		echo "$text" >&2
	fi
	echo "" >&2
	exit 1
}

[[ $HOME ]] || failure "missing HOME env-var"


function success
{
	echo ">>> All done, exit."
	echo ""
	exit 0
}


function say
{
	echo ">>> $* ..."
}


function say_s
{
	echo "    $* ..."
}


#################################################################################
######
###### Setup commands
######
#################################################################################

say "make sure $HOME/bin exists"
mkdir -p -m 0750 $HOME/bin

say "link files"
for _file in cvw ; do
	_src="$_dir/$_file"
	_dst="$HOME/bin/$_file"
	chmod 0750 $_src
	ln -nfs $_src $_dst
	say_s "$_dst"
done

success


