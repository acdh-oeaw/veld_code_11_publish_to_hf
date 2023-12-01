FROM python:3.10.13
RUN pip install spacy==3.6.0
RUN pip install spacy-huggingface-hub==0.0.10
# sadly, spaCy also needs the base models installed. So they must be downloaded as well. These 
# pip installs however can also be changed individually
RUN pip install de_dep_news_trf@https://github.com/explosion/spacy-models/releases/download/de_dep_news_trf-3.5.0/de_dep_news_trf-3.5.0.tar.gz
RUN mkdir -p /app/ /veld/input/model/ /tmp/out/
COPY ./run.sh /app/run.sh
RUN chmod +x /app/run.sh
WORKDIR /app

