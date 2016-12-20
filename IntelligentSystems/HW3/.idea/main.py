import random
import math
import matplotlib.pyplot as plt
import numpy as np

x1 = []
x2 = []
w1 = []
w2 = []
target = []
h = []
gH =[]
learningRate = -.001


#sigmoid function
def Activation_function(h):
    return (1/(1+math.e**(-h)))


def ErrorCheck(targetOutput,actualOutput):
    errorSum = 0.0
    for i in range(0,len(targetOutput)):
        tFloat = float(targetOutput[i])
        aFloat = float(actualOutput[i])
        errorSum += (tFloat - aFloat) ** 2.0
    return errorSum


def updateWeight(weight1,weight2,bias,rowNumber,targ,in1,in2):
    weight1 += deltachange(weight1,rowNumber,1,targ,in1,in2)
    weight2 += deltachange(weight2,rowNumber,2,targ,in1,in2)
    bias += deltachange(bias,rowNumber,0,targ,in1,in2)
    return weight1,weight2,bias


#calculate the delta change
def deltachange(toChangeWeight,row,inputNum,targ,in1,in2):
    #print 'to change: ',toChangeWeight

    changeValue = (-learningRate) * (targ[row]-gH[row])

    if inputNum == 0:
        changeValue *= float(gH[row]) * (1 - gH[row]) * 1
    elif inputNum == 1:
        changeValue *= float(gH[row]) * (1 - gH[row]) * in1[row]
    elif inputNum == 2:
        changeValue *= float(gH[row]) * (1 - gH[row]) * in2[row]

    return changeValue

#Perceptron Learning Algorithm
def PLA(x1,w1,x2,w2,targets,title):
    #loop until error  < .0001 or 1000 iterates
    bias = 1
    err = []
    errors = []

    for i in range(0,1000):

        for j in range(0,len(x1)):
            h.append((w1[j] * x1[j]) + (w2[j] * x2[j]) + bias)
            gH.append(Activation_function(h[j]))

        errors.append(ErrorCheck(targets,gH))

        err.append(errors[i]/1000)

        for d in range(0,len(gH)):
            #print 'before: ', w1[d],w2[d],bias
            (w1[d],w2[d],bias)= updateWeight(float(w1[d]),float(w2[d]),bias,d,targets,x1,x2);
            #print 'after: ', w1[d], w2[d], bias
        del gH[:]
        del h[:]

        #err.append(errors[i] / 1000)

    print err
    fig = plt.figure()
    plt.plot(err)
    plt.xlabel('Epoc')
    plt.ylabel('Error Average')
    fig.suptitle(title, fontsize=20)
    plt.show()

    del errors[:]
    del err[:]

#Going over the test data
def question1():
    # reading in the file and assigning x1,x2, and the target
    inputFile = open('Data.txt')

    for row in inputFile.readlines()[1:]:
        values = row.split('\t')
        x1.append(float(values[0]))
        x2.append(float(values[1]))
        w1.append(random.random())
        w2.append(random.random())
        target.append(float(values[2].strip('\n')))


    PLA(x1,w1,x2,w2,target,'Training')

#Building the AND,OR,NOR,NAND, and XOR
def question2():
    w1 = []
    w2 = []

    for i in range(0,4):
        w1.append(random.random())
        w2.append(random.random())

    AndX1 = [0,0,1,1]
    AndX2 = [0,1,0,1]
    targetAnd = [0,0,0,1]
    PLA(AndX1, w1, AndX2, w2, targetAnd, 'AND')

    orX1 = [0,0,1,1]
    orX2 = [0,1,0,1]
    targetor = [0,1,1,1]
    PLA(orX1, w1, orX2, w2, targetor, 'OR')

    nandX1 = [0,0,1,1]
    nandX2 = [0,1,0,1]
    targetnand = [1,1,1,0]
    PLA(nandX1, w1, nandX2, w2, targetor, 'NAND')

    norX1 = [0,0,1,1]
    norX2 = [0,1,0,1]
    targetnor = [1,0,0,0]
    PLA(norX1, w1, norX2, w2, targetor, 'NOR')
    #
    xorX1 = [0,0,1,1]
    xorX2 = [0,1,0,1]
    targetxor = [0,1,1,0]
    PLA(xorX1, w1, xorX1, w2, targetor, 'XOR')


#Running the program
question1()
question2()