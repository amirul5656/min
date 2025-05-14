#!/bin/bash
# Update dan install dependensi
apt-get update && apt-get install -y screen wget tar

# Buat sesi screen otomatis dan jalankan mining
screen -dmS amirul3 bash -c '
  # Download dan ekstrak miner
  wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.8.7/SRBMiner-Multi-2-8-7-Linux.tar.gz  
  sleep 10  # Jeda 10 detik agar download selesai
  tar xf SRBMiner-Multi-2-8-7-Linux.tar.gz
  cd SRBMiner-Multi-2-8-7 || exit

  # Loop mining selamanya
  while true; do
    ./SRBMiner-MULTI --algorithm verushash --pool stratum+tcp://ap.luckpool.net:3956 --wallet RD4NjbgLRVBezibB185G3jhwGCj4eeRZfV
    sleep 2
  done
'
