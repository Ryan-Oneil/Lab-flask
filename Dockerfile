FROM python:2.7

MAINTAINER ryan

RUN apt-get update
RUN apt-get -y upgrade

# Copy the application folder inside the container
ADD /webapp /webapp

# Get pip to download and install requirements:
RUN pip install -r /webapp/requirements.txt

# Expose listener port
EXPOSE 5000

# Set the default directory where CMD will execute
WORKDIR /webapp

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "5000"]