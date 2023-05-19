# syntax=docker/dockerfile:1

FROM debezium/connect:2.2.0.Final as production
ARG ELASTIC_VERSION=7.17.10
ARG JACKSON_VERSION=2.15.1
ARG LUCENCE_VERSION=8.11.2
RUN mkdir /kafka/connect/kafka-connect-elasticsearch && \
    cd /kafka/connect/kafka-connect-elasticsearch && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/plugin/aggs-matrix-stats-client/$ELASTIC_VERSION/aggs-matrix-stats-client-$ELASTIC_VERSION.jar && \
    curl -sO https://packages.confluent.io/maven/io/confluent/common-utils/7.3.3/common-utils-7.3.3.jar && \
    curl -sO https://repo1.maven.org/maven2/commons-codec/commons-codec/1.15/commons-codec-1.15.jar && \
    curl -sO https://repo1.maven.org/maven2/commons-logging/commons-logging/1.2/commons-logging-1.2.jar && \
    curl -sO https://repo1.maven.org/maven2/com/github/spullara/mustache/java/compiler/0.9.10/compiler-0.9.10.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch/$ELASTIC_VERSION/elasticsearch-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-cli/$ELASTIC_VERSION/elasticsearch-cli-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-core/$ELASTIC_VERSION/elasticsearch-core-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-geo/$ELASTIC_VERSION/elasticsearch-get-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/co/elastic/clients/elasticsearch-java/$ELASTIC_VERSION/elasticsearch-java-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-lz4/$ELASTIC_VERSION/elasticsearch-lz4-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-plugin-classloader/$ELASTIC_VERSION/elasticsearch-plugin-classloader-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/client/elasticsearch-rest-client/$ELASTIC_VERSION/elasticsearch-rest-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/client/elasticsearch-rest-high-level-client/$ELASTIC_VERSION/elasticsearch-rest-high-level-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-secure-sm/$ELASTIC_VERSION/elasticsearch-secure-sm-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-x-content/$ELASTIC_VERSION/elasticsearch-x-content-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/hdrhistogram/HdrHistogram/2.1.12/HdrHistogram-2.1.12.jar && \
    curl -sO https://repo1.maven.org/maven2/com/carrotsearch/hppc/0.9.1/hppc-0.9.1.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/httpcomponents/httpasyncclient/4.1.5/httpasyncclient-4.1.5.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/httpcomponents/httpclient/4.5.14/httpclient-4.5.14.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/httpcomponents/httpcore/4.4.16/httpcore-4.4.16.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/httpcomponents/httpcore-nio/4.4.16/httpcore-nio-4.4.16.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/$JACKSON_VERSION/jackson-annotations-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/$JACKSON_VERSION/jackson-core-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/$JACKSON_VERSION/jackson-databind-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-cbor/$JACKSON_VERSION/jackson-dataformat-cbor-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-smile/$JACKSON_VERSION/jackson-dataformat-smile-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/$JACKSON_VERSION/jackson-dataformat-yaml-$JACKSON_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/glassfish/jakarta.json/2.0.1/jakarta.json-2.0.1.jar && \
    curl -sO https://repo1.maven.org/maven2/net/java/dev/jna/jna/5.13.0/jna-5.13.0.jar && \
    curl -sO https://repo1.maven.org/maven2/joda-time/joda-time/2.12.5/joda-time-2.12.5.jar && \
    curl -sO https://repo1.maven.org/maven2/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar && \
    curl -sO https://repo1.maven.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar && \
    curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-elasticsearch/14.0.3/kafka-connect-elasticsearch-14.0.3.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/plugin/lang-mustache-client/$ELASTIC_VERSION/lang-mustache-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.20.0/log4j-api-2.20.0.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-analyzers-common/$LUCENCE_VERSION/lucene-analyzers-common-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-backward-codecs/$LUCENCE_VERSION/lucene-backward-codecs-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/$LUCENCE_VERSION/lucene-core-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-grouping/$LUCENCE_VERSION/lucene-grouping-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-highlighter/$LUCENCE_VERSION/lucene-highlighter-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-join/$LUCENCE_VERSION/lucene-join-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-memory/$LUCENCE_VERSION/lucene-memory-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-misc/$LUCENCE_VERSION/lucene-misc-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-queries/$LUCENCE_VERSION/lucene-queries-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-queryparser/$LUCENCE_VERSION/lucene-queryparser-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-sandbox/$LUCENCE_VERSION/lucene-sandbox-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-spatial3d/$LUCENCE_VERSION/lucene-spatial3d-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/apache/lucene/lucene-suggest/$LUCENCE_VERSION/lucene-suggest-$LUCENCE_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/lz4/lz4-java/1.8.0/lz4-java-1.8.0.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/plugin/mapper-extras-client/$ELASTIC_VERSION/mapper-extras-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/plugin/parent-join-client/$ELASTIC_VERSION/parent-join-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/eclipse/parsson/parsson/1.1.1/parsson-1.1.1.jar && \
    curl -sO https://repo1.maven.org/maven2/org/elasticsearch/plugin/rank-eval-client/$ELASTIC_VERSION/rank-eval-client-$ELASTIC_VERSION.jar && \
    curl -sO https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.36/slf4j-api-1.7.36.jar && \
    curl -sO https://repo1.maven.org/maven2/com/tdunning/t-digest/3.3/t-digest-3.3.jar
