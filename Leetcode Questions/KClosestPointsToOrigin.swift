//
//  kClosest.swift
//
//
//  Created by Luke Solomon on 11/7/24.
//

import Foundation

class Solution {
  func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    let comparator: (_ lhs: [Int], _ rhs: [Int]) -> Bool = { lhs, rhs in
      let distLhs = (lhs[0] * lhs[0]) + (lhs[1] * lhs[1])
      let distRhs = (rhs[0] * rhs[0]) + (rhs[1] * rhs[1])
      return distLhs > distRhs
    }

    let heap = Heap<[Int]>(comparator: comparator, size: k)

    for point in points {
      heap.add(point)
    }
    print("points: ", points)
    print("heap.arr: ", heap.arr)

    return heap.arr
  }
}


class Heap<T> {

  var arr: [T]
  var size: Int
  private var comparator: (_ lhs: T, _ rhs: T) -> Bool

  init(comparator: @escaping (_ lhs: T, _ rhs: T) -> Bool, size: Int) {
    self.comparator = comparator
    self.arr = [T]()
    self.size = size
  }

  func add(_ element: T) {
    arr.append(element)
    fixUp(arr.count-1)
    if arr.count > size {
      _ = self.pop()
    }
  }

  func pop() -> T? {
    if arr.count == 1 {
      return arr.popLast()!
    }

    if arr.count > 0 {
      let temp = arr[0]
      arr[0] = arr.popLast()!
      fixDown(0)
      return temp
    }
    return nil
  }

  private func fixUp(_ index: Int) {
    if index == 0 {
      return
    }

    let parent = (index - 1) / 2
    if comparator(arr[index], arr[parent]) {
      swap(index, parent)
      fixUp(parent)
    }
  }

  private func fixDown(_ index: Int) {
    let left = (index*2)+1
    let right = left + 1

    if left >= arr.count {
      return
    }

    var child = left
    if right < arr.count && comparator(arr[right], arr[left]) {
      child = right
    }

    if comparator(arr[child], arr[index]) {
      swap(index, child)
      fixDown(child)
    }
  }

  private func swap(_ index1: Int, _ index2: Int) {
    let temp = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = temp
  }
}


let points = [[68,97],[34,-84],[60,100],[2,31],[-27,-38],[-73,-74],[-55,-39],[62,91],[62,92],[-57,-67]]
let size = 5

print("solution: ", Solution().kClosest(points, size))

