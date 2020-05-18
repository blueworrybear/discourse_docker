# NAME:     discourse/base
# VERSION:  release
FROM discourse/base:release

ENV PG_MAJOR 12
ENV RUBY_ALLOCATOR /usr/lib/libjemalloc.so.1
ENV RAILS_ENV production

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /var/discourse
COPY . .
RUN ./launcher bootstrap app
ENTRYPOINT [ "/sbin/boot" ]
