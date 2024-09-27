#!/bin/bash

if ! command -v npm &> /dev/null; then
    echo "Npm not exists. Installing..."
    sudo apt update
    sudo apt install nodejs -y
fi

npm i -g demergi

PATTERN="^((y)|(д)|(yes)|(нуы)|(n)|(н)|(no)|(тщ))$"

while [[ -z "${RESPONSE}" ]]; do
    read -p "Do you want to create daemon?(y/n): " RESPONSE

    if [[ ! $RESPONSE =~ $PATTERN ]]; then
      echo "Please write y or n";
      RESPONSE=""
    fi
done

PATTERN="^((y)|(д)|(yes))$"

if [[ $RESPONSE =~ $PATTERN ]]; then
  sudo cp demergi.service /etc/systemd/system

  sudo sed -i "s|<HOME>|$HOME|" /etc/systemd/system/demergi.service
  sudo systemctl start demergi.service
  sudo systemctl enable demergi.service
  
  journalctl --no-pager -u demergi.service
fi
