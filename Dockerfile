FROM opensuse/leap

RUN zypper refresh
RUN zypper --non-interactive install --no-recommends vim openssh python2 sudo less glibc-locale system-user-nobody python3 python-xml

RUN mkdir -p /root/.ssh
RUN chmod 0700 /root/.ssh
COPY ansible-ssh.key.pub /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/authorized_keys

RUN ssh-keygen -A

CMD [ "/usr/sbin/sshd", "-D" ]


