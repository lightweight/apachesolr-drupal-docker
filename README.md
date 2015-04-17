# Apache Solr for Drupal docker image
==============

Apache Solr docker image for Drupal search.

### How to use:

```sh
git clone git@github.com/mxr576/apachesolr-drupal-docker.git 
cd apachesolr-drupal-docker

docker build -t drupal-solr .
docker run -id -p 8983:8983 -t drupal-solr
```

Also, you could specify the heap size of the JVM with **SOLR_MEM_SIZE** variable (by default it is 512 MB):

```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -t drupal-solr
```

If you would like store the data on the host:

```sh
docker run -id -p 8983:8983 -e SOLR_MEM_SIZE=1g -v path_on_the_host:/opt/solr/example/solr/collection1/data -t drupal-solr
```
