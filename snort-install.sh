sudo apt install -y gcc libpcre3-dev zlib1g-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet
mkdir ~/snort_src && cd ~/snort_src
wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
tar -xvzf daq-2.0.6.tar.gz
cd daq-2.0.6
./configure && make && sudo make install
cd ~/snort_src
wget http://www.snort.org/downloads/snort/snort-2.9.12.tar.gz
tar -xvzf snort-2.9.12.tar.gz
cd snort-2.9.12
./configure --enable-sourcefire --disable-open-appid && make && sudo make install
#sudo ldconfig
#sudo ln -s /usr/local/bin/snort /usr/sbin/snort
#sudo groupadd snort
#sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
#sudo mkdir -p /etc/snort/rules
#sudo mkdir /var/log/snort
#sudo mkdir /usr/local/lib/snort_dynamicrules
#sudo chmod -R 5775 /etc/snort
#sudo chmod -R 5775 /var/log/snort
#sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
#sudo chown -R snort:snort /etc/snort
#sudo chown -R snort:snort /var/log/snort
#sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules
#sudo touch /etc/snort/rules/white_list.rules
#sudo touch /etc/snort/rules/black_list.rules
#sudo touch /etc/snort/rules/local.rules
#sudo cp ~/snort_src/snort-2.9.12/etc/*.conf* /etc/snort
#sudo cp ~/snort_src/snort-2.9.12/etc/*.map /etc/snort
