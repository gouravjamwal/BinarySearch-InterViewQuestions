/*
 ALLOCATE MINIMUM NUMBER OF PAGES:

 Given number of pages in n different books and m students. The books are arranged in ascending order of number of pages. Every student is assigned to read some consecutive books. The task is to assign books in such a way that the maximum number of pages assigned to a student is minimum.

 Example :

 Input : pages[] = {12, 34, 67, 90}
         m = 2
 Output : 113
 Explanation:
 There are 2 number of students. Books can be distributed
 in following fashion :
   1) [12] and [34, 67, 90]
       Max number of pages is allocated to student
       2 with 34 + 67 + 90 = 191 pages
   2) [12, 34] and [67, 90]
       Max number of pages is allocated to student
       2 with 67 + 90 = 157 pages
   3) [12, 34, 67] and [90]
       Max number of pages is allocated to student
       1 with 12 + 34 + 67 = 113 pages

 Of the 3 cases, Option 3 has the minimum pages = 113.
 
 Problem Link : https://www.geeksforgeeks.org/allocate-minimum-number-pages/
 
 Related Problems For Practice :
 Book Allocation Problem (GFG)
 Aggressive cow (spoj)
 Prata and roti (spoj)
 EKO (spoj)
 Google kickstart A Q-3 2020
 
 */

import Foundation

func allocateMinimumNumberOfPages(array: [Int], key: Int) -> Int {
    
    if array.count <= 1 {
        return -1
    }

    var start = array[0]
    var end = array.reduce(0, { x, y in
        x + y
    })
    
    var res = -1
    let n = array.count
    
    while start <= end {
        let mid = start + ((end - start)/2)
        if isValid(array: array, key: key, mid: mid, n: n) {
            res = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return res
}

func isValid(array: [Int], key: Int, mid: Int, n: Int) -> Bool {
    var student = 1
    var sum = 0
    
    for i in 0..<n {
        sum += array[i]
        
        if sum > mid {
            student += 1
            sum = array[i]
        }
        if student > key {
            return false
        }
    }
    return true
}

print(allocateMinimumNumberOfPages(array: [10, 20, 30, 40], key: 2))
