FROM gitpod/workspace-full-vnc

#Install Edge
## Setup
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
 && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' \
 && sudo rm microsoft.gpg \

# Install Cypress dependencies.
 && sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   xauth \
   xvfb \
   microsoft-edge-dev \
 && sudo rm -rf /var/lib/apt/lists/*
