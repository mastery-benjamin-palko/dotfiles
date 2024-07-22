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

# Google chrome
if [ ! -f /etc/apt/trusted.gpg.d/google.asc ]; then
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /etc/apt/trusted.gpg.d/google.asc >/dev/null
fi
if [ ! -f /etc/apt/sources.list.d/google.list ]; then
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

# pgadmin4 repo
if [ ! -f /usr/share/keyrings/packages-pgadmin-org.gpg ]; then
  curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
fi
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# spotify
if [ ! -f /etc/apt/trusted.gpg.d/spotify.gpg ]; then
  curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
fi
if [ ! -f /etc/apt/sources.list.d/spotify.list ]; then
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
fi

# teams-for-linux
if [ ! -f /etc/apt/keyrings/teams-for-linux.asc ]; then
  sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
fi
if [ ! -f /etc/apt/sources.list.d/teams-for-linux-packages.list ]; then
  echo "deb [signed-by=/etc/apt/keyrings/teams-for-linux.asc arch=$(dpkg --print-architecture)] https://repo.teamsforlinux.de/debian/ stable main" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.list
fi

# Insomnia
curl -1sLf \
  'https://packages.konghq.com/public/insomnia/setup.deb.sh' \
  | sudo -E distro=ubuntu codename=focal bash

#
# UPDATE APT
# 
sudo apt update


