FROM ubuntu:16.04
MAINTAINER jason
RUN apt-get update && \
	apt-get install -y wget gcc make
RUN wget -c http://www.softether-download.com/files/softether/v4.22-9634-beta-2016.11.27-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.22-9634-beta-2016.11.27-linux-x64-64bit.tar.gz -O vpnserver-v4.22-x64-64bit.tar.gz
RUN tar xzvf vpnserver-v4.22-x64-64bit.tar.gz
WORKDIR /vpnserver
RUN make i_read_and_agree_the_license_agreement
RUN rm -rf /vpnserver/vpnserver-v4.22-x64-64bit.tar.gz
ENTRYPOINT entrypoint.sh 
