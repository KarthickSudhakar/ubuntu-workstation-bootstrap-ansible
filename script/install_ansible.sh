#!/usr/bin/env bash

set -euo pipefail
clear 

# Colors for output
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

# Virtualenv directory
PY_VENV_DIR=${HOME}/.venv

echo "

  ____   ____   ____ _______ _____ _______ _____            _____  
 |  _ \ / __ \ / __ \__   __/ ____|__   __|  __ \     /\   |  __ \ 
 | |_) | |  | | |  | | | | | (___    | |  | |__) |   /  \  | |__) |
 |  _ <| |  | | |  | | | |  \___ \   | |  |  _  /   / /\ \ |  ___/ 
 | |_) | |__| | |__| | | |  ____) |  | |  | | \ \  / ____ \| |     
 |____/ \____/ \____/  |_| |_____/   |_|  |_|  \_\/_/    \_\_|     
                                                                   
                                                                   
"
echo "
==> THIS SCRIPT DOES TWO THINGS

    1. INSTALL ANSIBLE IN PYTHON VIRTUALENVIRONMENT 
    2. RUN THE 'bootstrap.yml' file which will take care of setting up the workstation.

"
# Print the current python version
echo -e "${BOLDGREEN}==> PYTHON 3 VERSION      = $(python3 --version)${ENDCOLOR}"
echo -e "${BOLDGREEN}==> VIRTUAL ENVIRONMENT   = virtualenv${ENDCOLOR}"
echo -e "${BOLDGREEN}==> VENV DIRECTORY        = ${PY_VENV_DIR}${ENDCOLOR}"

# Check and install pip system wide.
echo -e "${BOLDGREEN}==> PIP VERSION           = $(python3 -m pip --version)${ENDCOLOR}" && \
python3 -m pip --version 1>/dev/null 2>/dev/null || \
{ 
    echo -e "${ITALICRED}==> PIP NOT FOUND INSTALLING ....\n\n${ENDCOLOR}" && \
    sudo apt install python3-pip -y 
}

# Check and install pip system wide.
echo -e "${BOLDGREEN}==> VIRTUALENV VERSION    = $(virtualenv --version)${ENDCOLOR}" && \
virtualenv --version 1>/dev/null 2>/dev/null || \
{ 
    echo -e "${ITALICRED}==> VIRTUALENV NOT FOUND INSTALLING ....\n\n${ENDCOLOR}" && \
    sudo apt install python3-virtualenv -y 
}

# Create venv dir
mkdir -p ${PY_VENV_DIR} && echo -e "\n${BOLDGREEN}==> [ CREATED ] ${PY_VENV_DIR}${ENDCOLOR}"
python3 -m virtualenv ${PY_VENV_DIR} && echo -e "${BOLDGREEN}==> [ CREATED ] Virtual Environment${ENDCOLOR}\n"

# Install ansible
echo -e "\n${BOLDGREEN}==> INSTALLING ANSIBLE${ENDCOLOR}\n"
${PY_VENV_DIR}/bin/python -m pip install ansible 

# Check ansible version
echo -e "\n\n${BOLDGREEN}==> ANSIBLE VERSION${ENDCOLOR}\n"
${PY_VENV_DIR}/bin/ansible --version

# Run the playbook command to bootstrap the machine.
echo -e "\n

 ____  __     __   _  _  ____   __    __  __ _ 
(  _ \(  )   / _\ ( \/ )(  _ \ /  \  /  \(  / )
 ) __// (_/\/    \ )  /  ) _ ((  O )(  O ))  ( 
(__)  \____/\_/\_/(__/  (____/ \__/  \__/(__\_)

"
read -p "==> PRESS [Y|y] TO START THE PLAYBOOK 'bootstrap.yml' :: " USER_RESPONSE
if [[ ${USER_RESPONSE} = [Yy] ]]; then
    ${PY_VENV_DIR}/bin/ansible-playbook ../bootstrap.yml -K -b -i ../hosts
else
    echo "==> EXIT SCRIPT ...."
fi
