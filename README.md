# Apache Solr 4.x & 5.x for Drupal search
---

Apache Solr 4.x - 5.x docker image for Drupal search.

### How to use these images:

```sh
git clone https://github.com/mxr576/apachesolr-drupal-docker.git
cd apachesolr-drupal-docker
```
Choose your version and open its folder, then:

```sh
docker build -t drupal-solr .
docker run -id -p 8983:8983 -t drupal-solr
```

Also, you could specify the heap size of the JVM with the **SOLR_MEM_SIZE** variable (by default is set to 512 MB):

```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -t drupal-solr
```

If you would like store the data on the host:

Solr 4.x:

```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -v path_on_the_host:/opt/solr/example/solr/collection1/data -t drupal-solr
```
Solr 5.x
```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -v path_on_the_host:/opt/solr/server/solr/drupal/data -t drupal-solr
```

If you would like to use the Solr's built in partial search function, then this is available on the 4.x image:

Solr 4.x:

```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -e PARTIAL_SEARCH_ENABLED=true -v path_on_the_host:/opt/solr/example/solr/collection1/data -t drupal-solr
```

**HINT**: When you use the Solr 5.x version then the "Solr path" has to be set to `/solr/drupal` instead of `/solr` on Search API server settings page!
