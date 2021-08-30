#!/bin/bash
#set -x

# Absurd_TBS_ServerInstallBeta

# update packages
sudo apt-get update && sudo apt-get upgrade

# prerequisites
sudo apt-get install -y less libpcre3 git

# clone htan to /usr/lib/htan
sudo git clone https://github.com/adminstock/htan.git /usr/lib/htan

# create symbolic links to htan
[[ -f /sbin/htan ]] || sudo ln -s /usr/lib/htan/run /sbin/htan
[[ -f /usr/sbin/htan ]] || sudo ln -s /usr/lib/htan/run /usr/sbin/htan

# set permissions
sudo chmod u=rwx /usr/lib/htan/run

# run
sudo htan

cd /usr/lib/htan/
sudo git fetch origin && \
sudo git reset --hard origin/master && \
chmod u=rwx /usr/lib/htan/run

wget https://raw.githubusercontent.com/ephidrineon/matrix-synapse-easy-install/main/matrix-synapse-easy-install.sh && chmod +x ./matrix-synapse-easy-install.sh && sudo ./matrix-synapse-easy-install.sh

[check_prerequisites|show_installed_versions|install|uninstall|help|
    export_config_file_template|show_status_of_services|Quit]

export BEHIND_NAT=yes/no ("no" if the server has a public IP on one of it's interfaces, else "yes")
export SERVER_FQDN="server's FQDN" (This will be used to access the web conferences)

export PUBLIC_IP="public ip of server" (mandatory only if BEHIND_NAT is "yes")
export PRIVATE_IP="private ip of server" (mandatory only if BEHIND_NAT is "yes")

export HOST_NAME=HOSTNAME_OF_SERVER (Default: Result of command 'hostname')
export SIP_USER_ID=SIPUSER@SIPHOST
export SIP_PASSWORD=PASSWORD_FOR_SIPUSER
export JIGASI_TRANSCRIPTS_DIR=/directory/to/store/transcripts (Default: "/etc/jitsi/transcripts") 
export JIBRI_RECORDINGS_DIR=/directory/to/store/transcripts (Deafault:  "/etc/jitsi/recordings")
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/google/credentials/file




