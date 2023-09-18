FROM intland/codebeamer:21.09-SP13 as SRCBIN
RUN dnf list installed|cut -f1 -d' '|grep -v "ImageMagick"|grep -v "LibRaw"|grep -v "libraqm" > /tmp/installed.txt
RUN sed -i 's/\.x86_64//g' /tmp/installed.txt 

FROM oraclelinux:8

COPY --from=SRCBIN /tmp/installed.txt /tmp/packages.txt
COPY install.sh /tmp/install.sh 
RUN /tmp/install.sh /tmp/packages.txt
COPY --chmod=0755 phantomjs /usr/bin/phantomjs
COPY --chmod=0755 identify /usr/bin/identify
RUN useradd --uid 1001 -m -d /home/appuser appuser

COPY --chmod=0755 --from=SRCBIN /home/appuser/endpoint.sh  /home/appuser/healthcheck.sh  /home/appuser/redirect.jsp /home/appuser/run.sh /home/appuser/
COPY --chmod=0755 --from=SRCBIN /wait /wait
COPY --chmod=0755 --from=SRCBIN /usr/local/bin/sempl /usr/local/bin/sempl 
COPY --from=SRCBIN /home/appuser/codebeamer /home/appuser/codebeamer
RUN chown -R appuser /home/appuser/codebeamer
ADD --chown=1001:1001 https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.25/mysql-connector-java-8.0.25.jar /home/appuser/codebeamer/tomcat/webapps/ROOT/WEB-INF/lib/
#should be copyied from src
ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true
ENV GC_LOGGING_ENABLED=false
ENV HOME=/home/appuser
ENV JHICCUP_ENABLED=false
ENV catalina.base=/home/appuser/codebeamer/tomcat
ENV SAFEPOINT_LOGGING_ENABLED=false
user appuser

ENTRYPOINT [ "/home/appuser/endpoint.sh" ]
CMD [ "/home/appuser/run.sh" ]
