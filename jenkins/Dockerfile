FROM jenkins/jenkins:lts-jdk11 AS builder

#ENV JENKINS_OPTS="--prefix=/jenkins"

USER root

RUN apt-get update
RUN apt-get install -y iputils-ping

USER jenkins