# elasticsearch 101

Setup:

```sh
# Start elasticsearch and Kibana
docker-compose up -d

# wait a bit for cluster to come up
sleep 10

# import demo data
./import.sh

```

After you're set up, open this link to the Kibana devtools with some prepopulated queries

http://localhost:5601/app/kibana#/dev_tools/console?load_from=https://raw.githubusercontent.com/bsander/elasticsearch-101/master/elasticsearch-101.console
