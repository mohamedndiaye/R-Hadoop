## MapReduce jobs with R scripts

**[Wordcount](/Wordcount/)** : The "Hello World" of Hadoop framework

Use R [reducer](/Wordcount/reducer.r) script on Hadoop framework to computes words frequencies in text data.

```
# copy datafile to hdfs
hadoop fs -put -f 200mots.txt 200mots.txt
# remove previous mapreduce jobs outputs
hadoop fs -rm streamout*/\* &&\
hadoop fs -rmdir streamout*
# run the hadoop streaming api :
# mapper process '/bin/cat' returns the text unchanged
# reducer process 'reducer.r' computes the counts of words
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar -input 200mots.txt -output streamout -mapper /bin/cat -reducer reducer.r -numReduceTasks 4 -file reducer.r
# read the output files
hadoop fs -cat streamout/\*
```
