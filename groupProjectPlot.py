# -*- coding: utf-8 -*-
"""
Created on Tue Dec  4 18:47:31 2018

@author: bretl
"""


import pandas
from plotnine import *
#load dataset with no headers, add appropriate column names
fatmice=pandas.read_csv('hitTableFinalprotein.csv',header=None,sep=',',names=['Mouse','Transcript','Abundance'])
#give ggplot plotting information + clean up theme + axis labels + chart title + chart size
a=ggplot(fatmice, aes(x='Mouse', y='Abundance', fill="Transcript")) + theme_classic() + xlab('Transcript') + ylab('Abundance') + ggtitle('Transcript Abundance of Some Genes in Mice by Dietary Class') + theme(figure_size=(11, 6))
#just makes labels within x grouping line up with appropriate bars
dodge_text = position_dodge(width=0.9)
#create barplot without any statistical inference, space out the bars in each group + within-group labels below bars + y axis values above bars + adjust y axis values
finalPlot=a+geom_bar(stat='identity', position="dodge") + geom_text(aes(y=-.5, label='Transcript'),
position=dodge_text,color='gray', size=7, angle=70, va='top') + geom_text(aes(label='Abundance'),
position=dodge_text,size=8, va='bottom') + lims(y=(-15, 120))
finalPlot
#save plot as jpeg
ggsave(plot=finalPlot, filename='AbundancePlot.jpeg', dpi=1000)
