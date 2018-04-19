#!/usr/bin/env bash

useradd boardd
passwd boardd
gpasswd -a boardd wheel
su - boardd
cd
git clone http://github.com/dpboard/dpblinconf
dpblinconf/setup.sh

mkdir -p ~/.ssh
echo "sh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjdFwetGni8T+Dw1DLoS0AzXgTnyBBIu8K3q8+waA2V/t5KabyZbsrb+3t+oKb+113d6iX3Uwpgp7lb9f8Pb8Dc9XiQqOWVAB1FgrUwdgUZECQrOHvEKgiZZOlrhYiFO2Cm748PpaM4BaQr8OgBdJZyTCxA1BLLuUpOc7jA23cSMrZPxdejBzQPb/jaDDJU6PLOeeTY+/Ff5ADEfeSAY86jiyA9YDB37gwIL3T+j7vF4U6SXuJnMKPqvUTYm2W8bN/S+cgQyPRDli1vFXqSRuvydZGayhFTagc3P2DqUuEbcJK61zNUnS+kITsHYNXWHJm72JOtyQXHEVRfI1Bz35Xw== rsa-key-20171108" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
