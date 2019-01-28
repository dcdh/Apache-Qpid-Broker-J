#!/bin/bash
docker run -p 5672:5672 -p 8080:8080 --rm damdamdeo/apache-qpid-broker-j:7.1.0
