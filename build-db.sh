#!/usr/bin/env bash
#
# Original from dtos-core-repo
# Script name: build-db.sh
# Description: Script for rebuilding the database for fluxrepo.
# GitLab: https://www.gitlab.com/dwt1/fluxrepo
# Contributors: Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

echo "###########################"
echo "Building the repo database."
echo "###########################"

## Arch: x86_64
cd x86_64
rm -f fluxrepo*

echo "###################################"
echo "Building for architecture 'x86_64'."
echo "###################################"

## repo-add
## -s: signs the packages
## -n: only add new packages not already in database
## -R: remove old package files when updating their entry
repo-add -s -n -R fluxrepo.db.tar.gz *.pkg.tar.zst

# Removing the symlinks because GitLab can't handle them.
rm fluxrepo.db
rm fluxrepo.db.sig
rm fluxrepo.files
rm fluxrepo.files.sig

# Renaming the tar.gz files without the extension.
mv fluxrepo.db.tar.gz fluxrepo.db
mv fluxrepo.db.tar.gz.sig fluxrepo-db.sig
mv fluxrepo.files.tar.gz fluxrepo.files
mv fluxrepo.files.tar.gz.sig fluxrepo.files.sig

echo "#######################################"
echo "Packages in the repo have been updated!"
echo "#######################################"
