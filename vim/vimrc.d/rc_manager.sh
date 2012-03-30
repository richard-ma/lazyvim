#!/usr/bin/env bash
set -o errexit

enableSuffix="vimrc"
disableSuffix="disable"

op="$1"
realFileName="$2"

case "$1" in
    # enable a vimrc configration file
    "enable")
        if [[ -e "$realFileName" ]]; then
            realFileName=`basename "$realFileName" ".$disableSuffix"`
        fi

        if [[ -e "$realFileName.$disableSuffix" ]]; then
            mv "$realFileName.$disableSuffix" "$realFileName.$enableSuffix"
        else
            # no such file
            echo "No such file."
            exit 1
        fi
        ;;
    # disable a vimrc configration file
    "disable")
        if [[ -e "$realFileName" ]]; then
            realFileName=`basename "$realFileName" ".$enableSuffix"`
        fi

        if [[ -e "$realFileName.$enableSuffix" ]]; then
            mv "$realFileName.$enableSuffix" "$realFileName.$disableSuffix"
        else
            # no such file
            echo "No such file."
            exit 1
        fi
        ;;
    # params error
    *)
        echo "No such operation."
        ;;
esac
