#!/usr/bin/env bash

yes "" | ssh-keygen -f mykey

sudo chmod 400 mykey
