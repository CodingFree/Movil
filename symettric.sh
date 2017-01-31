#!/bin/bash -e

PARAM=$2

function chkpass {
    if [ -z "$PARAM" ]; then
        echo "Poner la passphrase."
        exit
    fi
    pass="$PARAM"
}

function encrypt {
    find ./ -type f -not -name "*.gpg" -exec echo {} \; -exec gpg --symmetric -o {}.gpg --passphrase $pass --yes {} \;
}

function cleanplain {
    find ./ -not -name "*.gpg" -not -name "\." -not -name "\.." -exec shred -n 3 -z -u {} \;
}

function cleangpg {
    find ./ -name "*.gpg" -exec shred -n 3 -z -u {} \;
}

function decrypt {
    find ./ -name "*.gpg" -exec gpg --passphrase $pass --yes {} \;
}


key="$1"


case $key in
    -e|--encrypt)
    echo "Cifrar"
    chkpass
    encrypt
    ;;
    -c1|--clean1)
    echo "Limpiar normales"
    cleanplain
    ;;
    -c2|--clean2)
    echo "Limpiar cifrados"
    cleangpg
    ;;
    -d|--decrypt)
    chkpass
    echo "Descifrar"
    decrypt
    ;;
    *)
    echo "Usage: [-c|--clean]] | [-e|--encrypt password] | [-d| --decrypt password]"
    ;;
esac