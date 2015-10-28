FROM ubuntu
MAINTAINER huuloc.tran89@gmail.com 
LABEL Product="CacheHosting"

RUN	/bin/mkdir -p /zserver/memcached
	
ADD memcached /zserver/memcached
ADD cache.init /
ADD libevent-1.4.so.2 /usr/lib/

RUN \
	/sbin/ldconfig && \
	/bin/chmod +x /cache.init && \
        /usr/sbin/useradd -r zcache && \
        /bin/chown -R zcache. /zserver/memcached   

ENTRYPOINT ["/cache.init"]
