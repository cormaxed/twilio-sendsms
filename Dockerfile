FROM python:3

RUN pip3 install twilio_sendsms

ENTRYPOINT ["sendsms"]


