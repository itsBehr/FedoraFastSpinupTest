#!/bin/bash

curl -L https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/update > ~/.local/FFS.sh
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/pkg-install-preamble" > ~/.local/FFS2.sh



echo "Let's get started! What type of CPU do you use?"
read -p '(a)md or (i)ntel | ' cpuType

echo "Do you have an Nvidia GPU?"
read -p '(y)es or (n)o | ' gpuType

echo "Do you want the optional Linux VR Jumpstart packages?"
read -p '(y)es or (n)o | ' vrOpt

if [ $cpuType = a ]
then
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/AMD-nugget" >> ~/.local/FFS2.sh
elif [ $cpuType = i ]
then
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/Intel-nugget" >> ~/.local/FFS2.sh
fi

curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/pkg-install-postamble" >> ~/.local/FFS2.sh

if [ $gpuType = y ]
then
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/NV-nugget" > ~/.local/FFS1.5_NV.sh
fi

if [ $vrOpt = y ]
then
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/VR-nugget" >> ~/.local/FFS2.sh
fi


curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/pkg-install-fin" >> ~/.local/FFS2.sh

bash ~/.local/FFS.sh

