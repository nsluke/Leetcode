//
//  Heap.swift
//
//
//  Created by Luke Solomon on 11/11/24.
//

import Foundation

// Implementing Heap
class Heap<T: Comparable> {

  var arr: [T]
  private var comparator: (_ a: T, _ b: T) -> Float

  init(comparator: @escaping (_ a: T, _ b: T) -> Float) {
    self.comparator = comparator
    self.arr = [T]()
  }

  func addElement(_ element: T) {
    // push to the end of the array
    // call helper function called "fix up"
    arr.append(element)
    fixUp(arr.count-1)
  }

  private func fixUp(_ index: Int) {
    if index == 0 {
      return
    }
    let parentIndex = (index-1)/2
    if comparator(arr[parentIndex], arr[index]) > 0 {
      swap(index, parentIndex)
      fixUp(parentIndex)
    }
  }

  private func swap(_ firstIndex: Int, _ secondIndex: Int) {
    let temp = arr[firstIndex]
    arr[firstIndex] = arr[secondIndex]
    arr[secondIndex] = temp
  }

  // Get the top element of the Heap
  func peek() -> T {
    return arr[0];
  }

  func pop() -> T? {
    if arr.count == 1 {
      return arr.popLast()
    }

    let temp = arr[0]
    arr[0] = arr.popLast()!
    fixDown(0)
    return temp
  }

  private func fixDown(_ index: Int) {
    // at a leaf
    // only left
    //   both children
    //   left is bigger
    //   right is bigger

    let left = (index*2)+1
    let right = left + 1

    if left > arr.count-1 {
      return
    } else if right > arr.count-1 || comparator(arr[right], arr[left]) > 0 {
      if comparator(arr[index], arr[left]) > 0 {
        swap(index, left)
        fixDown(left)
      }
    } else if comparator(arr[index], arr[right]) > 0{
      swap(index, right)
      fixDown(right)
    }
  }

}

let comparator: (_ a: Int, _ b: Int) -> Float = {
  return Float($1-$0)
}

let heap = Heap<Int>(comparator: comparator)

heap.addElement(2)
heap.addElement(3)
heap.addElement(1)
let _ = heap.pop()
print(heap.arr)
