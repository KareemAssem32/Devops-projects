FROM alpine:3.19

RUN apk update && \
    apk add --no-cache openssh bash && \
    mkdir /var/run/sshd

# Create user
RUN adduser -D dev && \
    echo "dev:dev" | chpasswd

# SSH config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

