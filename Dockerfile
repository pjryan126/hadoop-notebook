#TODO CHANGE HADOOP TO 2.6.0 AND DOWNLOAD/TAR FROM HTTP
#TODO CHECK CLOUDERA HADOOP CONFIG FILES AND COMPARE TO EDGE NODE FILES
FROM jupyter/datascience-notebook

USER root

EXPOSE 8889

RUN apt-get update
RUN apt-get install -y default-jdk
RUN apt-get install -y wget

RUN wget http://apache.mirrors.tds.net/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
RUN tar -xzvf hadoop-2.6.0.tar.gz
RUN mv hadoop-2.6.0 /usr/local/hadoop
RUN rm hadoop-2.6.0.tar.gz
ADD config/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
ADD config/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
ADD config/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

USER jovyan

ENV JAVA_HOME "/usr/lib/jvm/java-7-openjdk-amd64"
ENV HADOOP_HOME "/usr/local/hadoop"
ENV PATH "$PATH:$HADOOP_HOME/bin"
ENV PATH "$PATH:$HADOOP_HOME/sbin"
ENV HADOOP_COMMON_LIB_NATIVE_DIR "$HADOOP_HOME/lib/native"
ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_HOME/lib/native"




