# set base image (host OS)
FROM python:3.8-alpine

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

RUN apk add --no-cache gcc=10.2.1_pre1-r3 musl-dev=1.2.2-r0 linux-headers=5.7.8-r0

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
ENTRYPOINT ["python"]
CMD ["app.py"]