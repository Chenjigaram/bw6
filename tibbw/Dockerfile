FROM debian:jessie

MAINTAINER Naveen Chenjigaram 

RUN apt-get update && apt-get install bc wget unzip openjdk-7-jre curl lib32z1 bc lib32ncurses5 lib32stdc++6 lib32z1 lib32z1-dev -y &&\ 
	groupadd -r tibgrp -g 433 && \
	useradd -u 431 -r -m -g tibgrp -d /home/tibusr -s /bin/bash -c "TIBCO Docker image user" tibusr && \
	chown -R tibusr:tibgrp /home/tibusr && \
	mkdir /opt/tibco && \
	chown -R tibusr:tibgrp /opt/tibco && \
	mkdir /tmp/install && \
	chown -R tibusr:tibgrp /tmp/install

USER tibusr	

ADD TIB_BW_6.*.zip /tmp/install/

RUN unzip /tmp/install/TIB_BW_6.*.zip -d /tmp/install/tibbw && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.*.silent && \
	sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/opt\/tibco<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.*.silent && \
	sed -i 's/<entry key="LGPLAssemblyPath">.*<\/entry>/<entry key="LGPLAssemblyPath">\/opt\/tibco\/thirdpartysoftware<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.*.silent && \
	sed -i 's/<entry key="selectedProfiles">.*<\/entry>/<entry key="selectedProfiles">Runtime<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-x86-64.bin -silent && \
	rm -rf /tmp/install/ /tmp/install/tibbw/TIB_BW_6.*.zip 
	
EXPOSE 5050 5060 5432 7222 5555 8079 8886 9091 5678 8777 2222 7500 7777



#command to build image docker (build -t bwbw6:1.0.0 . )