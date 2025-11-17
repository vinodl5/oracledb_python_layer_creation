FROM public.ecr.aws/lambda/python:3.11

# Install zip utility
RUN yum install -y zip

# Set working directory
WORKDIR /opt/python

# Install python-oracledb in thin mode
RUN pip install oracledb -t .

# Zip the layer
WORKDIR /opt
RUN zip -r9 /opt/oracledb-layer.zip .
