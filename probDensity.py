# -*- coding: utf-8 -*-
"""
Created on Sat Sep 23 20:00:49 2017

@author: James
"""

# -*- coding: utf-8 -*-
"""
Created on Mon Jun 12 02:16:02 2017

@author: James
"""

import csv, numpy, re, matplotlib.pyplot as plt, time, datetime as dt

with open('C:/Users/James/Desktop/hackthemachine-data/classC_ship1_MRG.csv') as f:
    reader = csv.reader(f)
    listData = list(reader)
    data1 = numpy.array(listData)
    
with open('C:/Users/James/Desktop/hackthemachine-data/classC_ship2_MRG.csv') as f:
    reader = csv.reader(f)
    listData = list(reader)
    data2 = numpy.array(listData)
    
timeCol = listData[0].index('DateTime')


def stampToDT(stamp):

    stamp = stamp.replace('-', '/')    
    txt = stamp.split(' ')
    
    t1 = txt[0].split('/')
    t2 = txt[1].split(':')
    
    if(len(txt) > 2 and txt[2] == 'PM' and int(t2[0]) < 12):
        hours = 12
    else:
        hours = 0
    
    if(int(t1[0]) > 1000):
        d = dt.date(int(t1[0]), int(t1[1]), int(t1[2]))
    else: 
        d = dt.date(int(t1[2]), int(t1[0]), int(t1[1]))
    
    t = dt.time(hours + int(t2[0]), int(t2[1]), int(t2[2]))
    
    return dt.datetime.combine(d, t)
    

columnNames = data1[0]
data1 = data1[1:]
data2 = data2[1:]



newCol1 = []
newCol2 = []

for i in range(1,3):# timeCol):
    
    newCol1 = []
    newCol2 = []
    
    for j in range(0, len(data1)):
        s = data1[j,i]
        if(not(s=='')):
            newCol1.append(float(s))    
        
        s = data2[j,i]
        if(not(s=='')):
            newCol2.append(float(s))    
    
    bins = numpy.histogram(numpy.hstack((newCol1, newCol2)))
    
    #vals1 =  Col2, bins, density=True)[0]
    #diffs = vals1 - vals2
    #figure()
    #plt.scatter(bins, diffs)
    #plt.hist(newCol1, bins, density=True)
    #plt.hist(newCol2, bins, density=True)
    
    
    

#    print(i)
#    plt.figure()
#    plt.hist(numpy.array(list(filter(None, data[:,i]))).astype(numpy.float))
#    plt.title(columnNames[i])
#    plt.savefig('C1MRG/Hist ' + columnNames[i] + '.png')
#    plt.close()
        
        
