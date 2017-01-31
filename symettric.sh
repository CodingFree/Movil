#!/bin/bash -e


function chkpass {
    if [ -z "$2" ]; then
    	echo "Poner la passphrase."
    	exit
    fi
    pass="$2"
}

function encrypt {
	find ./ -type f -not -name "*.gpg" -exec echo {} \; -exec gpg --symmetric -o {}.gpg --passphrase $pass --yes {} \;
}

function clean {
	find ./ -not -name "*.gpg" -not -name "\." -not -name "\.." -exec shred -n 3 -z -u {} \;
}

function decrypt {
    find ./ -name "*.gpg" -exec gpg {} \;
}


key="$1"


case $key in
    -e|--encrypt)
    echo "Cifrar"
    chkpass
    encrypt
    ;;
    -c|--clean)
    echo "Limpiar"
    clean
    ;;
    -d|--decrypt)
    chkpass
    echo "Descifrar"
    clean
    ;;
    *)
	echo "Usage: [-c|--clean]] | [-e|--encrypt password] | [-d| --decrypt password]"
    ;;
esac