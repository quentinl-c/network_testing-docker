FROM danielfrg/selenium
MAINTAINER Quentin LAPORTE-CHABASSE
RUN apt-get -y update && apt-get install -y \
    git \
    python3-pip

# Python dependencies
RUN pip3 install pika
RUN pip3 install selenium

# Pull repository
WORKDIR /home
RUN git clone https://github.com/quentinl-c/network_testing-client.git
WORKDIR /

# Launch Selenium (as background task)
RUN sh /opt/selenium/entrypoint.sh &

# Launch client
CMD ["./home/network_testing-client/client.py"]