# syntax=docker/dockerfile:1

 

# use latest version of Node 18

FROM node:18-alpine

# set a directory for the app

WORKDIR /app

# copy all the files to the container (source followed by destination)

COPY . .

# install dependencies

RUN pip install -r requirements.txt

# execute the command

CMD python lbg.py --PORT 9000

# define the port number the container should expose

EXPOSE 9000
