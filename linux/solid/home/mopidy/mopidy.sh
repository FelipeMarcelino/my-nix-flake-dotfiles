#!/bin/bash

# Retrieve the username and password from GNOME Keyring
export CLIENT_ID="$(secret-tool lookup service spotify username spotify_username)"
export CLIENT_SECRET="$(secret-tool lookup service spotify username spotify_password)"
export SPOTIFY_USERNAME="$(secret-tool lookup service spotify username spotify_username)"
export SPOTIFY_PASSWORD="$(secret-tool lookup service spotify username spotify_password)"
