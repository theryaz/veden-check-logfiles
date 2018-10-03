FROM alpine

COPY ./files/check_logfiles-3.9.tar.gz /build/check_logfiles-3.9.tar.gz

RUN apk add make && apk add perl && apk add tar

RUN cd /build && tar -xvf /build/check_logfiles-3.9.tar.gz
RUN cd /build/check_logfiles-3.9 && ./configure && make install
RUN cd /build && rm -rf ./check_logfiles-3.9* && apk del tar

ENV PATH="/usr/local/nagios/libexec:${PATH}"

# CMD ['/usr/local/nagios/libexec/check_logfiles']
