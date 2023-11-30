FROM python:3.10.13
RUN pip install spacy==3.6.0
RUN pip install spacy-huggingface-hub==0.0.10
RUN mkdir /app /app/model /app/out
WORKDIR /app
COPY ./run.sh /app/run.sh
RUN chmod +x /app/run.sh

