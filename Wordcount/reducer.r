#!/usr/bin/env Rscript
#
# Created by Youssef de Madeen Amadou on 23-May-2017
# R script to run wordcount on Hadoop framework
#
f <- file("stdin",open = 'r')
ds = readLines(f,warn = F)
sum = summary(factor(unlist(strsplit(ds,"\\s|\\s+"))))
do.call(function(x) write(paste(names(x),":",x), stdout(),append = TRUE),list(sum))
close(f)
#END
