ARG branch=latest
FROM hadv/opera:$branch

RUN apk add --update bash curl jq
RUN /opera console --exec 'console.log(admin.nodeInfo.name)' --maxpeers=0 --nodiscover --dev 2>/dev/null | head -1 > /version.txt

# Inject the startup script
ADD run.sh /run.sh
ADD mapper.jq /mapper.jq
RUN chmod +x /run.sh

# Inject the enode id retriever script
RUN mkdir /hive-bin
ADD enode.sh /hive-bin/enode.sh
RUN chmod +x /hive-bin/enode.sh

ADD genesis.json /genesis.json

# Export the usual networking ports to allow outside access to the node
EXPOSE 18545 18546 18547 19090 5050/udp

ENTRYPOINT ["/run.sh"]
