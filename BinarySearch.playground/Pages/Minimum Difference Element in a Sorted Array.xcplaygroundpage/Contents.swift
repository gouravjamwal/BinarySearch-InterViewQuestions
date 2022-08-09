/*
 Given a sorted array, find the element in the array which has minimum difference with the given number. .
 */

import Foundation

func minimumDifferenceElementInASortedArray(array: [Int], k: Int) -> Int {
    var start = 0
    var end = array.count - 1

    while start <= end {
        
        let mid = start + ((end - start)/2)
        
        if k == array[mid] {
            return array[mid]
        } else if k < array[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    let a1 = abs(array[start] - k)
    let a2 = abs(array[end] - k)

    if a1 > a2 {
        return a2
    }
    return a1
}

print(minimumDifferenceElementInASortedArray(array: [1, 3, 8, 10, 15], k: 12))
