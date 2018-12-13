#Installing libraries
sudo apt-get install libpcre3-dev -y 
sudo apt-get install zlib1g-dev -y
sudo apt-get install libpcap-dev -y
sudo apt-get install libssl-dev -y
sudo apt-get isntall libnghttp2-dev -y 
sudo apt-get install libdumbnet-dev -y
sudo apt-get install bison flex -y
sudo apt-get install ethtool -y
sudo apt-get install build-essentials -y
sudo apt-get install make

#Installing Snort
mkdir ~/snort_src && cd ~/snort_src
wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
tar -xvzf daq-2.0.6.tar.gz
cd daq-2.0.6
./configure
sudo make
sudo sudo make install
cd ~/snort_src
wget http://www.snort.org/downloads/snort/snort-2.9.12.tar.gz
tar -xvzf snort-2.9.12.tar.gz
cd snort-2.9.12
./configure --enable-sourcefire --disable-open-appid
sudo make
sudo make install
sudo ldconfig
sudo ln -s /usr/local/bin/snort /usr/sbin/snort
cd etc
mkdir snort
cd snort
mkdir rules

