# base image
FROM ubuntu:24.04

# install packages
RUN apt-get update && apt-get install -y bc

# working directory
WORKDIR /src

# copy files
COPY . /src

# make script executable
RUN chmod 755 /src/system_monitor.sh

CMD [ "/src/system_monitor.sh" ]