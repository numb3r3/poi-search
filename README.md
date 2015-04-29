POI search engine from scratch
==============================

A toy poi search engine based on Nutch and Elasticsearch

Install
-------

1. Set up vagrant

        vagrant up --provision
        vagrant ssh
        cd /vagrant

2. Download and install ant, nutch and es

        bin/wget-deps.bash
        bin/setup.bash

3. Build Nutch

        bin/build-nutch.bash


(Optional) Elasticsearch plugin
-------------------------------

1. Head - a web front end for browsing and interacting with an Elastic Search cluster

        bin/plugin --install mobz/elasticsearch-head

    access http://localhost:9200/_plugin/head/

2. Bigdesk - to see how your Elasticsearch cluster is doing

        bin/plugin -install lukas-vlcek/bigdesk

    access http://localhost:9200/_plugin/bigdesk/

Sequence of operation
---------------------

1. Inject - populates CrawlDB from seed urls

2. Generate - select URLS to fetch in segment

3. Fetch - fetch URL from segment

4. Parse - parse content (text + meta data)

5. UpdateDB - update CrawlDB (new URLs, new status)

6. InvertLinks - build web graph

7. ESIndex - send doc into ES

Database schema
---------------

* **index**: "poi"
* **type**: "qyer" # sources, e.g., place.qyer.com


References
----------

* [Simple Vagrant Tutorial](http://twang2218.github.io/tutorial/openstack/vagrant.html)
