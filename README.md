## MapReduce jobs with R scripts

**[Wordcount](/Wordcount/)** : The "Hello World" of Hadoop framework

Use a R [wordcount](/Wordcount/wordcount.r) script on Hadoop framework to computes words frequencies in text data.

```
# copy datafile to hdfs
hadoop fs -put -f 200mots.txt 200mots.txt
# remove previous mapreduce jobs outputs
hadoop fs -rm streamout*/\* &&\
hadoop fs -rmdir streamout*
# run the hadoop streaming api :
# mapper process '/bin/cat' returns the text unchanged
# reducer process 'wordcount.r' computes the counts of words
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar \
-input 200mots.txt \
-output streamout \
-mapper /bin/cat \
-reducer wordcount.r \
-numReduceTasks 4 \
-file wordcount.r
# read the output files
hadoop fs -cat streamout/\*
```
