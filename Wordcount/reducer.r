#!/usr/bin/env Rscript
#
# Created by Youssef de Madeen Amadou, 23-May-2017
# Reducer script for wordcount on HADOOP
#
f<-file("stdin",open = 'r')
ds = readLines(f,warn = F)
sum = summary(factor(unlist(strsplit(ds,"\\s|\\s+"))))
do.call(function(x) write(paste(names(x),":",x), stdout(),append = TRUE),list(sum))
close(f)
#END
