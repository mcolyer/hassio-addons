ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache jq mosquitto-clients libffi ruby libffi-dev ruby-dev build-base libusb-compat-dev
RUN wget http://pkgs.fedoraproject.org/repo/pkgs/libftdi/libftdi-0.20.tar.gz/355d4474e3faa81b485d6a604b06951f/libftdi-0.20.tar.gz \
      && tar xfz libftdi-0.20.tar.gz \
      && cd libftdi-0.20 \
      && ./configure --without-examples \
      && make && make install
RUN gem install -N hacklet

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
