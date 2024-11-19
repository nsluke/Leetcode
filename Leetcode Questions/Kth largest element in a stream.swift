//
//  Kth largest element in a stream.swift
//  
//
//  Created by Luke Solomon on 11/18/24.
//

import Foundation

class KthLargest {
  var k: Int
  var nums: [Int]

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    self.nums = [Int]()
    for i in nums {
      let _ = add(i)
    }
    print("=== initial adds done ====")
  }

  func add(_ val: Int) -> Int {
    print("adding \(val)")
    self.nums.append(val)
    fixUp(nums.count-1)
    if nums.count > k {
      pop()
    }
    print(nums)
    let kth = nums[0]
    print(kth)
    print()
    return kth
  }

  func pop() {
    if nums.count > 1 {
      print("popping: \(nums[0])")
      nums[0] = nums.popLast()!
      fixDown(0)
    } else if nums.count == 1 {
      nums.remove(at: 0)
    }
  }

  private func swap(_ firstIndex: Int, _ secondIndex: Int) {
    let temp = nums[firstIndex]
    nums[firstIndex] = nums[secondIndex]
    nums[secondIndex] = temp
  }

  private func fixDown(_ index: Int) {
    if index > nums.count-1 {
      return
    }

    let left = index*2
    let right = left+1

    if left > nums.count-1 {
      return
    } else if right > nums.count-1 || nums[right] > nums[left] {
      if nums[index] > nums[left] {
        swap(index, left)
        fixDown(left)
      }
    } else if nums[index] > nums[right] {
      swap(index, right)
      fixDown(right)
    }
  }

  private func fixUp(_ index: Int) {
    if index == 0 {
      return
    }

    let parent = (index-1)/2

    if nums[parent] > nums[index] {
      swap(parent, index)
      fixUp(parent)
    }
  }

}
