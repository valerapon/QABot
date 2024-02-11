FROM ubuntu:22.04

WORKDIR /ChatBot

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
        build-essential git python3 python3-pip wget \
        ffmpeg libsm6 libxext6 libxrender1 libglib2.0-0

COPY ./requirements.txt /ChatBot/requirements.txt

RUN pip3 install -U pip
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN mkdir /ChatBot/logs

COPY ./src /ChatBot/src
COPY ./docs /ChatBot/docs
COPY ./index /ChatBot/index

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]
