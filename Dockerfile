# NAME:     discourse/base
# VERSION:  release
FROM discourse/base:release

# Arguments
ARG DISCOURSE_HOSTNAME
ARG DISCOURSE_DEVELOPER_EMAILS
ARG DISCOURSE_SMTP_ADDRESS
ARG DISCOURSE_SMTP_PORT
ARG DISCOURSE_SMTP_USER_NAME
ARG DISCOURSE_SMTP_PASSWORD
ARG LETSENCRYPT_ACCOUNT_EMAIL

# Set environments from ARGS
ENV DISCOURSE_HOSTNAME $DISCOURSE_HOSTNAME
ENV DISCOURSE_DEVELOPER_EMAILS $DISCOURSE_DEVELOPER_EMAILS
ENV DISCOURSE_SMTP_ADDRESS $DISCOURSE_SMTP_ADDRESS
ENV DISCOURSE_SMTP_PORT $DISCOURSE_SMTP_PORT
ENV DISCOURSE_SMTP_USER_NAME $DISCOURSE_SMTP_USER_NAME
ENV DISCOURSE_SMTP_PASSWORD $DISCOURSE_SMTP_PASSWORD
ENV LETSENCRYPT_ACCOUNT_EMAIL $LETSENCRYPT_ACCOUNT_EMAIL

ENV PG_MAJOR 12
ENV RUBY_ALLOCATOR /usr/lib/libjemalloc.so.1
ENV RAILS_ENV production

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update -y
RUN apt-get install iputils-ping -y

WORKDIR /var/discourse
COPY . .
RUN ./discourse-setup
# RUN ./launcher app
COPY boot.sh /usr/bin/
# ENTRYPOINT [ "/sbin/boot" ]
ENTRYPOINT [ "/bin/bash", "/usr/bin/boot.sh" ]
