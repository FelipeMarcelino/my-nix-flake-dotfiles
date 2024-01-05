#!/bin/bash

# Retrieve the username and password from GNOME Keyring
export SPOTIFY_USERNAME="$(secret-tool lookup service spotify username spotify_username)"
export SPOTIFY_PASSWORD="$(secret-tool lookup service spotify username spotify_password)"
