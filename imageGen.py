# -*- coding: utf-8 -*-
"""
Created on Mon Jun 12 02:16:02 2017

@author: James
"""

import csv, numpy, re, matplotlib.pyplot as plt, time, datetime as dt

with open('C:/Users/James/Desktop/hackthemachine-data/classC_ship1_MRG.csv') as f:
    reader = csv.reader(f)
    listData = list(reader)
    data = numpy.array(listData)
    
timeCol = listData[0].index('DateTime')


def stampToDT(stamp):

    stamp = stamp.replace('-', '/')    
    txt = stamp.split(' ')
    
    t1 = txt[0].split('/')
    t2 = txt[1].split(':')
    

    
    #print(stamp, t1)    
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
    

columnNames = data[0]
data = data[1:]



tempCols1 = [7,9,12,16,22,25,26,27,28,40,47,48,49]
tempCols2 = [4, 19, 23, 33, 38, 39, 41, 42, 44, 45, 51, 52, 56]

tempData1 = []
tempData2 = []

for row in data[:,tuple(tempCols1)]:
    if(not("" in row)):
        tempData1.append(row)

for row in data[:,tuple(tempCols2)]:
    if(not("" in row)):
        tempData2.append(row)

tempData1 = numpy.array(tempData1).astype(numpy.float)
tempData2 = numpy.array(tempData2).astype(numpy.float)

inds = []

for i in range(0, len(columnNames)):
    if 'TEMP' in columnNames[i]:
        inds.append(i)
        
columnNames[inds]

tempData = data[:,tuple(inds)]

#for i in range(0, 13):
#    for j in range(i+1, 13):
#       plt.figure()
#       plt.scatter(tempData2[:,i], tempData2[:,j])
#       plt.xlabel(columnNames[tempCols2[i]])
#       plt.ylabel(columnNames[tempCols2[j]])
#       plt.savefig('C2MRG/Second ' + str(i) + '_' + str(j) + '.png')
#       plt.close()
        

#for i in range(1, timeCol):
#    print(i)
#    plt.figure()
#    plt.hist(numpy.array(list(filter(None, data[:,i]))).astype(numpy.float))
#    plt.title(columnNames[i])
#    plt.savefig('C1MRG/Hist ' + columnNames[i] + '.png')
#    plt.close()
        
        
        
        
        
for i in range(0, len(data)):
    data[i, timeCol] = stampToDT(data[i, timeCol])
    
data = data[data[:,timeCol].argsort()]

#possibleEvents = {}

newData = [data[0]]

oldTime = stampToDT(data[0, timeCol])

newCol = []
stds = {}
avgs = {}
N = 5

for i in range(1, len(columnNames)):
    for j in range(0, len(data):
        s = data[j,i]
        if(not(s=='')):
            newCol.append(float(s))
    stds[i] = numpy.std(newCol)
    avgs[i] = numpy.mean(newCol)
    
    np.convolve(newCol, np.ones((N,))/N, mode='valid')

for row in data[1:]:
    
    time = stampToDT(row[timeCol])
    
    if((time - oldTime).seconds > 8 * 3600):
            #with open(str(counter) + '.txt', 'w') as f:
            #    f.write(columnNames.extend(newData))
                
            newData = []
    else:
        newData.append
        ### R NEW RUNNING PERIOD
#        possibleEvents[time] = 'time'
    
#    elif((time - oldTime).seconds < 60):
        ### E DEFINITELY AN EVENT
#        possibleEvents[time] = 'time'
    
#    elif((time - oldTime).seconds < 180):
        ### M SUB THREE MINUTE MEASUREMENTS. EVENT?
#        print('')
        
#    else:
        ### N NOT AN EVENT
#        print('')
        
#    oldTime = time


