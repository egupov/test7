FROM ubuntu:18.04
RUN apt-get update \
  && apt-get install -y \
             apt-utils \
             python-all \
             python-pip
WORKDIR /tmp/
COPY requirements.txt .
RUN pip install -qr requirements.txt
WORKDIR /opt/webapp
COPY tests.py .
COPY Procfile .
COPY app.py .
EXPOSE 5000
CMD ["/opt/webapp/app.py"]
