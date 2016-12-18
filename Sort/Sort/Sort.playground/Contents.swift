//: Playground - noun: a place where people can play

import Cocoa

import Sort


//bubble sort
var bubbleArray = [4,5,1,34,0,9,3,8,22]
bubbleSort(&bubbleArray)

//quick sort
var quickArray = [4,5,1,34,0,9,3,8,22]
quickSort(&quickArray, left: 0, right: quickArray.count - 1)

//selection sort
var selectionArray = [4,5,1,34,0,9,3,8,22]
selectionSort(&selectionArray)

//counting sort
var countingArray = [4,5,1,34,0,9,3,8,22]
countingSort(&countingArray)

//insertion sort
var insertionArray = [4,5,1,34,0,9,3,8,22]
sampleInsertionSort(&insertionArray)

//reudce insertion sort
var reduceInsertionArray = [4,5,1,34,0,9,3,8,22]
reduceInsertionSort(&reduceInsertionArray)
