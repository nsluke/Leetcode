//
//  Studying.swift
//  
//
//  Created by Luke Solomon on 11/7/24.
//

import Foundation

class Solution {

  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    return [findFirst(nums, target), findLast(nums, target)]
  }


  func findFirst(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
      return -1
    }

    var midpoint = nums.count/2
    if midpoint == nums.count-1 || midpoint == 0 {
      if nums[midpoint] == target {
        return midpoint
      }
    } else if nums[midpoint] == target && nums[midpoint+1] > target {
      return midpoint
    }

    if nums[midpoint] == target && nums[midpoint-1] < target {
      return midpoint
    }

    if nums[midpoint] > target {
      if midpoint+1 > nums.count-1 {
        return -1
      }
      return findFirst(Array(nums[midpoint+1...nums.count-1]), target)
    }

    if nums[midpoint] <= target {
      return findFirst(Array(nums[0..<midpoint]), target)
    }

    return -1
  }


  func findLast(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
      return -1
    }
    print(nums.count/2)
    var midpoint = nums.count/2
    if midpoint == nums.count-1 || midpoint == 0 {
      if nums[midpoint] == target {
        return midpoint
      }
    } else if nums[midpoint] == target && nums[midpoint+1] > target {
      return midpoint
    }

    if nums[midpoint] > target {
      return findLast(Array(nums[midpoint+1...nums.count-1]), target)
    }

    if nums[midpoint] <= target {
      return findLast(Array(nums[0..<midpoint]), target)
    }
    return -1
  }

}
