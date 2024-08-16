#!/bin/bash

if ! command -v curl &> /dev/null; then
    echo "Curl not exists. Installing..."
    sudo apt update
    sudo apt install curl -y
fi

curl -fsSL https://raw.githubusercontent.com/xvzc/SpoofDPI/main/install.sh | bash -s linux-amd64

echo ""
echo ""
echo ""
echo =======================================================
echo ""
echo spoof-dpi was installed to ~/.spoof-dpi/bin
echo ""
echo =======================================================
echo ""
echo ""
echo ""

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
  sudo cp spoof-dpi.service /etc/systemd/system

  sudo sed -i "s|<HOME>|$HOME|" /etc/systemd/system/spoof-dpi.service
  sudo systemctl start spoof-dpi.service
  sudo systemctl enable spoof-dpi.service
  
  journalctl --no-pager -u spoof-dpi.service
fi
