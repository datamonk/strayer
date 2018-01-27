# Run data-set-generator.sh to produce sample data set. Modify output file path and total entry records as needed.
$ touch test_data_20180120.csv && ./data-set-generator.sh

# Convert sample dataset as key/value and import to redis through cli. Record date before and after:
$ date && awk -F, 'NR > 1{ print "SET", "\""$1"\"", "\""$2"\"" }' test_data_20180120.csv | unix2dos | redis-cli --pipe && date

# Output all keys (redis):
$ ./redis-cli
> KEYS *

# Import sample dataset into SQLite:
$ ./sqllite3
> .mode csv
> .timer ON
> .import /home/afcamar/Desktop/test_data_20180120.csv test1
> .exit

# Turn on time duration timer and output all table values:
$ ./sqllite3
> .timer ON
> SELECT * FROM test1;
> .exit
