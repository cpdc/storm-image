FROM centos
MAINTAINER Xiaotian Wu <xiaotian.wu@chinacache.com>

RUN yum install -y wget
RUN yum install -y java
RUN yum install -y tar
RUN wget http://mirror.bit.edu.cn/apache/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz
RUN tar -zxvf apache-storm-0.9.2-incubating.tar.gz
RUN rm /apache-storm-0.9.2-incubating/conf/storm.yaml
ENV PATH $PATH:/apache-storm-0.9.2-incubating/bin
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.65-2.5.1.2.el7_0.x86_64/jre/
ENV CLASS_PATH /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.65-2.5.1.2.el7_0.x86_64/jre/lib/rt.jar:/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.65-2.5.1.2.el7_0.x86_64/jre/lib/dt.jar:/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.65-2.5.1.2.el7_0.x86_64/jre/lib/tools.jar
RUN echo -e "\n\
 storm.zookeeper.servers: \n\
     - \"ip1\"\n\
     - \"ip2\"\n\
     - \"ip3\"\n\
\n\
 nimbus.host: \"ip\"\n\
\n\
 storm.local.dir: \"/local_storm_home\"\n\
\n\
 supervisor.slots.ports: \n\
    - 6700\n\
    - 6701\n\
    - 6702\n\
    - 6703\n\
\n\
 storm.zookeeper.port : 2181\n\
 topology.debug: true\n\
\n\
 storm.messaging.transport: \"backtype.storm.messaging.netty.Context\"\n\
 storm.messaging.netty.server_worker_threads: 1\n\
 storm.messaging.netty.client_worker_threads: 1\n\
 storm.messaging.netty.buffer_size: 5242880\n\
 storm.messaging.netty.max_retries: 100\n\
 storm.messaging.netty.max_wait_ms: 1000\n\
 storm.messaging.netty.min_wait_ms: 100\n\
" > /apache-storm-0.9.2-incubating/conf/storm.yaml
ENV PATH $PATH:/apache-storm-0.9.2-incubating/bi
