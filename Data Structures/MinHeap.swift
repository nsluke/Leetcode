//
//  MinHeap.swift
//  
//
//  Created by Luke Solomon on 11/11/24.
//

import Foundation

// Implementing "Min Heap"
class MinHeap {

  var arr: [Int] = [0]
  var heapSize: Int
  var realSize: Int

  init(heapsize: Int, realSize: Int) {
    self.heapSize = heapsize+1 // Will not use the 0th element of the array to better track indices!
    self.realSize = realSize
  }

  func addElement(_ element: Int) {
    realSize += 1
    if realSize > heapSize {
      print("heap got too big")
      realSize -= 1
      return
    }

    arr[realSize] = element
    var index = realSize
    var parent = index/2

    while arr[index] < arr[parent] && index > 1 {
      var temp = arr[index]
      arr[index] = arr[parent]
      arr[parent] = temp
      index = parent
      parent = index / 2
    }
  }

  // Get the top element of the Heap
  func peek() -> Int {
    return minHeap[1];
  }

  func pop() -> {
    if realSize < 1 {
      print("heap is empty")
      return Int.Max
    } else {
      var removeElement = arr[1]
      arr[1] = arr[realSize]
      realSize -= 1
      var index = 1

      while index <= realSize/2 {
        var left = index * 2
        var right = index * 2 + 1

        if arr[index] > arr[left] || arr[index] > arr[right] {

          if arr[left] < arr[right] {
            var temp = arr[left]
            arr[left] = arr[index]
            arr[index] = temp
            index = left
          } else {
            var temp = arr[right]
            arr[right] = arr[index]
            arr[index] = temp
            index = right
          }

        } else {
          break
        }
      }
      return removeElement
    }
  }

}
