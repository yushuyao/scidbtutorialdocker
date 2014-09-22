#SciDB Tutorial Over Docker

#when testing only
#FROM centos:centos6scidb148base

#when building from scratch
FROM centos:centos6

MAINTAINER Yushu Yao <yao.yushu@gmail.com>

ADD context /tmp/context

RUN sh -vx /tmp/context/installall.sh

EXPOSE 8888 8787 22

ENTRYPOINT ["/tmp/context/startall.sh"]

