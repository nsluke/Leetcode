//
//  pivotIndex.swift
//
//
//  Created by Luke Solomon on 11/7/24.
//

import Foundation

// Find Pivot Index
// https://leetcode.com/problems/find-pivot-index/
class Solution {
  func pivotIndex(_ nums: [Int]) -> Int {

    let sum = nums.reduce(0, +)
    var leftSum = 0

    for i in 0..<nums.count {
      if leftSum == sum - leftSum - nums[i] {
        return i
      }

      leftSum += nums[i]
    }

    return -1
  }
}
