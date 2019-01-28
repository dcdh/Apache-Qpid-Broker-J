FROM java:8

RUN cd /usr/local \
  && wget https://www-us.apache.org/dist/qpid/broker-j/7.1.0/binaries/apache-qpid-broker-j-7.1.0-bin.zip \
  && unzip -q apache-qpid-broker-j-7.1.0-bin.zip

COPY config.json /usr/local

# TODO passer en argument les ports + utilisateur par defaut

ENV AMQP_PORT=5672
ENV HTTP_PORT=8080
ENV USERNAME=guest
ENV PASSWORD=guest

CMD ["/usr/local/qpid-broker/7.1.0/bin/qpid-server", "-icp", "/usr/local/config.json", "-prop", "\"qpid.amqp_port=${AMQP_PORT}\"", "-prop", "\"qpid.http_port=${HTTP_PORT}\"", "-prop", "\"qpid.username=${USERNAME}\"", "-prop", "\"qpid.password=${PASSWORD}\""]

EXPOSE 5672 8080

