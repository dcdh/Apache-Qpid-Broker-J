FROM java:8

RUN cd /usr/local \
  && wget https://www-us.apache.org/dist/qpid/broker-j/7.1.0/binaries/apache-qpid-broker-j-7.1.0-bin.zip \
  && unzip -q apache-qpid-broker-j-7.1.0-bin.zip

COPY config.json /usr/local

# TODO passer en argument les ports + utilisateur par defaut

CMD ["/usr/local/qpid-broker/7.1.0/bin/qpid-server", "-icp", "/usr/local/config.json", "-prop", "\"qpid.amqp_port=5672\"", "-prop", "\"qpid.a_amqp_port=5673\"", "-prop", "\"qpid.http_port=8080\""]

EXPOSE 5672 8080

