#!/bin/bash
CARLA_BIN_URL="https://doc-08-2c-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/3m1uoja7mn7lb2o1d6qhj0588arim0a4/1536026400000/08261810080133743559/*/1JprRbFf6UlvpqX98hQiUG9U4W_E-keiv?e=download"

if [ ! -d "carla" ]; then
    curl -L -o CARLA_0.9.0.tar.gz $CARLA_BIN_URL
    mkdir -p carla
    tar xvf CARLA_0.9.0.tar.gz -C carla
fi
sudo docker build -t mycarla .

pip install -r requirements.txt

echo 'Finished preparations!'