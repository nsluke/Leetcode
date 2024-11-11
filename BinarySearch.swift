//
//  BinarySearch.swift
//  
//
//  Created by Luke Solomon on 11/11/24.
//

import Foundation
class Solution {
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    return [binsearch(nums, target, true), binsearch(nums, target, false)]
  }

  func binsearch(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {

    print("nums: ", nums, "target: ", target, "leftBias: ", leftBias)
    if nums.count <= 0 {
      return -1
    }
    let midpoint = nums.count/2
    print("midpoint: ", midpoint)

    if midpoint == 0 && nums[midpoint] == target && leftBias {
      return midpoint
    }

    if midpoint == nums.count-1 && nums[midpoint] == target && !leftBias {
      return midpoint
    }

    if nums[midpoint] == target {
      if leftBias && nums[midpoint-1] < target {
        return midpoint
      } else if !leftBias && nums[midpoint+1] > target {
        return midpoint
      }
    }

    if nums[midpoint] < target {
      return binsearch(Array(nums[0..<midpoint]) , target, leftBias)
    }

    if nums[midpoint] > target {
      return binsearch(Array(nums[midpoint+1..<nums.count]), target, leftBias)
    }
    return -1
  }

}
