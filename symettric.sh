#!/bin/bash

if [ -z "$2" ]; then
	echo "Poner la passphrase."
	exit
fi
pass="$2"

function encrypt {
	find ./ -type f -not -name "*.gpg" -exec echo {} \; -exec gpg --symmetric -o {}.gpg --passphrase $pass --yes {} \;
}

function clean {
	find ./ -not -name "*.gpg" -exec shred -n 3 -z -u {} \;
}


key="$1"


case $key in
    -e|--encrypt)
    echo "Cifrar"
    encrypt
    ;;
    -c|--clean)
    echo "Descifrar"
    clean
    ;;
    *)
	echo "Usage: [-c|--clean]] | [-e|--encrypt]"
    ;;
esac