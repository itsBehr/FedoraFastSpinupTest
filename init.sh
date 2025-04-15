#!/bin/bash

curl -L https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/update >> ~/.local/FFS.sh
curl -L "https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/maincandidate-v2/pkg-install-preamble" >> ~/.local/FFS3.sh
echo "#!/bin/bash" >> ~/.local/FFS2.sh


echo "Let's get started! What type of CPU do you use?"
read -p '(a)md or (i)ntel | ' cpuType

echo "Do you have an Nvidia GPU?"
read -p '(y)es or (n)o | ' gpuType

echo "Do you want the optional Linux VR Jumpstart packages?"
read -p '(y)es or (n)o | ' vrOpt


if [ $cpuType = a ]
then
curl -L [AMDCPUFILE] >> ~/Desktop/fedoraquikstart.sh
elif [ $cpuType = i ]
then
curl -L [INTELCPU] >> ~/Desktop/fedoraquikstart.sh
else
echo "Please insert valid arguments." && exec "$ScriptLoc"
fi


if [ $gpuType = y ]
curl -L [NVIDIAGPU] >> ~/Desktop/fedoraquikstart.sh
elif [ $gpuType = n ]
then
curl -L [nostep2] >> ~/Desktop/fedoraquikstart.sh
else 
echo "Please insert valid arguments." && exec "$ScriptLoc"
fi

if [ $vrOpt = n ]
curl -L [NOVR] >> ~/Desktop/fedoraquikstart.sh
elif [ $vrOpt = y ]
then
curl -L https://github.com/itsBehr/FedoraFastSpinupTest/raw/refs/heads/itsBehr-maincandidate/Step_1I-NV >> ~/Desktop/fedoraquikstart.sh
else
echo "Please insert valid arguments." && exec "$ScriptLoc"
fi

