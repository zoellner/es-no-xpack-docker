# initalize from official image
FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.3
# un/install plugins
RUN bin/elasticsearch-plugin remove x-pack
RUN bin/elasticsearch-plugin install --batch analysis-phonetic
# add default config
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch
# setup volume
VOLUME /usr/share/elasticsearch/data
