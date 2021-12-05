FROM centos

RUN yum -y install openssh-server
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh 

COPY ssh_keys/remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys
RUN ssh-keygen -A
RUN yum -y install mysql
RUN dnf -y install python3 &&\
    ln -s /usr/bin/python3 /usr/bin/python
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

EXPOSE 22

RUN rm -rf /run/nologin

CMD ["/usr/sbin/sshd", "-D"]
