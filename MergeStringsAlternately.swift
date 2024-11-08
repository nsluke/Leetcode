//
// MergeStringsAlternately.swift
//
//
//  Created by Luke Solomon on 11/7/24.
//

import Foundation

// Merge Strings Alternately
// https://leetcode.com/problems/merge-strings-alternately/submissions/1445928128/
class Solution {
  static func mergeAlternately(_ word1: String, _ word2: String) -> String {

    var top = 0
    var bottom = 0

    let maxLen = word1.count + word2.count

    var result = ""

    let topArr = Array(word1)
    let bottomArr = Array(word2)

    for _ in 0...maxLen {
      if top < word1.count && bottom < word2.count {
        result.append(topArr[top])
        result.append(bottomArr[bottom])
      } else if top >= word1.count && bottom < word2.count {
        result.append(bottomArr[bottom])
      } else if top < word1.count && bottom >= word2.count {
        result.append(topArr[top])
      }
      top += 1
      bottom += 1
    }


    return result

  }
}

print(Solution.mergeAlternately("abc", "pqr"))

//Input: word1 = "abc", word2 = "pqr"
//Output: "apbqcr"
