#!/usr/bin/env Rscript
#
# Created by Youssef de Madeen Amadou on 23-May-2017 R script to run wordcount on Hadoop framework
#
f <- file("stdin",open = 'r')
tmp1 = readLines(f,warn = F)
write.table(table(factor(unlist(strsplit(tmp1,"\\s|\\s+")))),quote = FALSE,row.names = FALSE,col.names = FALSE,sep = "\t")
close(f)
#END
