#!/bin/bash

echo "FROM python:3" > Dockerfile
echo "COPY requirements.txt /home/." >> Dockerfile
echo "RUN pip install -r /home/requirements.txt" >> Dockerfile
echo "WORKDIR /home/app/" >> Dockerfile
echo "COPY server.py . " >> Dockerfile
echo "RUN mkdir templates" >> Dockerfile
echo "COPY ./templates/index.html ./templates" >> Dockerfile
echo "RUN mkdir static" >> Dockerfile
echo "COPY ./static/css/styles.css ./static/css" >> Dockerfile
echo "EXPOSE 8090 " >> Dockerfile
echo "CMD python3 server.py" >> Dockerfile

docker stop samrun
docker rm samrun
docker build -t sample .
docker run -t -d -p 8080:8080 --name samrun sample
docker ps -a 
