FROM alpine:3.3

MAINTAINER Pascal Brandt <pascal@openmrs.org>

ENV TOMCAT_MAJOR=7 \
    TOMCAT_VERSION=7.0.69 \
    TOMCAT_HOME=/etc/tomcat \
    CATALINA_HOME=/etc/tomcat \
    OPENMRS_HOME=/root/.OpenMRS

RUN apk add --update openjdk7 curl; \
    curl -L http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
      -o /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz; \
    tar -zxvf /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /etc; \
    ln -s /etc/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME}; \
    rm -f /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz; \
    rm -rf ${TOMCAT_HOME}/webapps/*; \
    curl -L https://bintray.com/psbrandt/generic/download_file?file_path=openmrs-1.11.5.war \
      -o ${TOMCAT_HOME}/webapps/openmrs.war; \
    curl -L https://bintray.com/psbrandt/generic/download_file?file_path=openmrs-2.3.1-modules.tgz \
      -o /tmp/openmrs-2.3.1-modules.tgz; \
    mkdir -p ${OPENMRS_HOME}/modules; \
    tar -zxvf /tmp/openmrs-2.3.1-modules.tgz -C ${OPENMRS_HOME}/modules; \
    rm -f /tmp/openmrs-2.3.1-modules.tgz; \
    apk del curl && rm -f /var/cache/apk/*

COPY openmrs-runtime.properties ${OPENMRS_HOME}/openmrs-runtime.properties
COPY setenv.sh ${TOMCAT_HOME}/bin/setenv.sh

EXPOSE 8080

CMD ${TOMCAT_HOME}/bin/catalina.sh run
