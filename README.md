# sync-elasticsearch-mysql

Using Logstash to synchronize an Elasticsearch index with MySQL data

- [sync-elasticsearch-mysql](#sync-elasticsearch-mysql)
  - [Introduction](#introduction)
  - [Deployment](#deployment)
  - [Kubernetes Deployment](#kubernetes-deployment)
  - [Testing](#testing)
  - [Resources](#resources)

| Tag     | Dockerfile                          | Image Size                                                                                                                                                                                            |
| :------ | :---------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:          |
| `0.0.1` | [Dockerfile](./Dockerfile-logstash) | [![Logstash-JBDC Connector/J Image Size](https://img.shields.io/docker/image-size/barisgece/sync-elasticsearch-mysql/0.0.1.svg?logo=docker&color=2496ED "Logstash-JBDC Connector/J Image Size")][hub] |

## Introduction

This project is a working example demonstrating how to use Logstash to link Elasticsearch to a MySQL database in order to:

- Build an Elasticsearch index from scratch
- Continuously monitor changes on the database records and replicate any of those changes to Elasticsearch (`create`, `update`, `delete`)

It uses:

- MySQL as the main database of a given business architecture (version 8.0.23)
- JDBC Connector/J (version 8.0.23)
- Elasticsearch as a text search engine (version 7.10.2)
- Logstash as a connector or data pipe from MySQL to Elasticsearch (version 7.10.2)
- Kibana for monitoring, data visualization, and debuging tool (version 7.10.2)

> This project has been developed based on the [**`sync-elasticsearch-mysql`**](https://github.com/redouane-dev/sync-elasticsearch-mysql) project prepared by [Redouane Achouri](https://www.redouaneachouri.com/). ***More details in this article***: [How to synchronize Elasticsearch with MySQL](https://towardsdatascience.com/how-to-synchronize-elasticsearch-with-mysql-ed32fc57b339)

![Architecture of this project](./docs/sync-elasticsearch-mysql.png)

This repo is a valid prototype and works as it is, however it is not suitable for a production environment. Please refer to the official documentation of each of the above technologies for instructions on how to go live in your production environment.

## Deployment

On your development/local environment, run the following commands on a terminal:

> Note: Make sure to install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)

```bash
# Clone this project and cd into it
git clone https://github.com/BarisGece/sync-elasticsearch-mysql.git && cd sync-elasticsearch-mysql

# Start the whole architecture
docker-compose up --build # add -d for detached mode

# To keep an eye on the logs
docker-compose logs -f --tail 111 <service-name>
```

To start services separately or in a different order, you can run:

```bash
docker-compose up -d mysql
docker-compose up -d elasticsearch kibana
docker-compose up logstash
```

## Kubernetes Deployment

[**Deploy**](kubernetes/doc.md) `sync-elasticsearch-mysql` in k8s cluster.

## Testing

Please refer to the above article for testing steps.

## Resources

- Inspiration by [How to keep Elasticsearch synchronized with a relational database using Logstash and JDBC](https://www.elastic.co/blog/how-to-keep-elasticsearch-synchronized-with-a-relational-database-using-logstash). However the article does not deal with indexing from scratch and deleted records.
- Data used for this project is available in the Kaggle dataset [Goodreads-books](https://www.kaggle.com/jealousleopard/goodreadsbooks)
- [Logstash JDBC input plugin](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html)
- [Logstash Mutate filter plugin](https://www.elastic.co/guide/en/logstash/current/plugins-filters-mutate.html)
- [Logstash Elasticsearch output plugin](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-elasticsearch.html)

[hub]: https://hub.docker.com/repository/docker/barisgece/sync-elasticsearch-mysql
