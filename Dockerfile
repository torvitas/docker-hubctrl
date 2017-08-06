FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get install git libusb-dev build-essential -y
RUN cd ~ && git clone https://github.com/codazoda/hub-ctrl.c && cd hub-ctrl.c && gcc -o hub-ctrl hub-ctrl.c -lusb

COPY ./src/ /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
