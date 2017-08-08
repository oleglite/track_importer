# Ubuntu 14.04
FROM geodata/gdal:2.1.3

# Install the application.
ADD . /app/src
WORKDIR /app/src

# install python
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.6

# install pip
RUN wget "https://bootstrap.pypa.io/get-pip.py" -O /app/get-pip.py
RUN python3.6 /app/get-pip.py
RUN rm /app/get-pip.py

# install python dependencies
RUN python3.6 -m pip install -r requirements.txt

# Output version and capabilities by default.
CMD /bin/bash
