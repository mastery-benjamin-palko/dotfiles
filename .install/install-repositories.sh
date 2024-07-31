#!/bin/bash

sudo apt-get install ca-certificates curl
sudo install -d -m 0755 /etc/apt/keyrings

# firefox
if [ ! -f /etc/apt/keyrings/packages.mozilla.org.asc ]; then
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
fi
if [ ! -f /etc/apt/sources.list.d/mozilla.list ]; then
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
  echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla
fi

#
# UPDATE APT
# 
sudo apt update


