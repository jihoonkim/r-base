#!/bin/bash

#-----------------------------------------------------------------------------
# Filename   : provision.sh
# Author     : Jihoon Kim 
# Email      : j5kim@ucsd.edu
# Description: Install the most recent version of base R on Ubuntu machine
#-----------------------------------------------------------------------------

# add key to sign CRAN pacakges
# The Ubuntu archives on CRAN are signed with the key of 
#  "Michael Rutter <marutter@gmail.com>" with key ID E084DAB9. 
#   reference  http://cran.r-project.org/bin/linux/ubuntu/
apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys E084DAB9

# add CRAN (https://cran.r-project.org/) to sources.list
export CRAN_URL=http://cran.stat.ucla.edu
bash -c " echo -e '\n'deb ${CRAN_URL}/bin/linux/ubuntu xenial/ >>  /etc/apt/sources.list "

# update
apt-get update -y

# install tzdata before adding PPA to avoid 
#     interactive input of geographic area and time zone
apt-get install -y tzdata

# set the local time as Los Angeles, US
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# install dependant packages
apt-get install -y apt-utils dialog python-software-properties software-properties-common wget zip

# add specfic Personal Package Archive (PPA)
#  by #  "Michael Rutter <marutter@gmail.com>" 
add-apt-repository -y ppa:marutter/rdev

# update
apt-get update -y

# install R base version
apt-get install -y r-base
