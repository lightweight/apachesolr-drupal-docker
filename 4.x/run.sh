#!/bin/bash

rm -f /opt/solr/example/solr/collection1/conf/schema.xml

# Check if partial search function should be enabled.
if [ "${PARTIAL_SEARCH_ENABLED}" == "false" ]; then
	cp search_api_solr/solr-conf/4.x/schema.xml /opt/solr/example/solr/collection1/conf/schema.xml
else
	cp partial_search/schema.xml /opt/solr/example/solr/collection1/conf/schema.xml
fi

exec /opt/solr/bin/solr -f -m ${SOLR_MEM_SIZE}
