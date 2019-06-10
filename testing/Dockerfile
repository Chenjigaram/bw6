FROM bwbw6:1.0.0

ADD docker-entrypoint.sh /opt/tibco/docker-entrypoint.sh
ADD *.ear /
RUN ln -s /*.ear /opt/tibco/bw/6.5/bin/bwapp.ear
ENTRYPOINT [ "sh","/opt/tibco/docker-entrypoint.sh" ]

# command to build ( docker build -t bwtest:1.0.0 .)
# command to run (docker run --name test -p 7777:7777 -p 8080:8080 -d bwtest:1.0.0 )