FROM quay.io/pathfinder/pathfinder-ui:latest

RUN mkdir -p /opt/webserver/webapps/ROOT/ext \
	&& cd /opt/webserver/webapps/ROOT \
	&& jar xvf /opt/webserver/webapps/ROOT.war

#COPY ext /opt/webserver/webapps/ROOT/ext/
#COPY patch-resources.sh /opt/webserver/webapps/ROOT/
COPY *.sh /opt/webserver/webapps/ROOT/

RUN /opt/webserver/webapps/ROOT/patch-resources.sh \
	&& /opt/webserver/webapps/ROOT/collect-resources.sh \
	&& rm -f /opt/webserver/webapps/ROOT/*.sh

RUN jar cvf /opt/webserver/webapps/ROOT.war -C /opt/webserver/webapps/ROOT . \
	&& rm -rf /opt/webserver/webapps/ROOT

