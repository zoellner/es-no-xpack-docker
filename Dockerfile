# initalize from official image. uses -oss image which comes without xpack
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.3.0
# un/install plugins
RUN bin/elasticsearch-plugin install --batch analysis-phonetic
# add default config
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch
# setup volume
VOLUME /usr/share/elasticsearch/data
