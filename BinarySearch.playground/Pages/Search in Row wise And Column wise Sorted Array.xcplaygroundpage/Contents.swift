/*
 SEARCH IN A ROW WISE AND COLUMN WISE SORTED MATRIX:

 Given an n x n matrix and a number x, find the position of x in the matrix if it is present in it. Otherwise, print “Not Found”. In the given matrix, every row and column is sorted in increasing order. The designed algorithm should have linear time complexity.
 Example :

 Input : mat[4][4] = { {10, 20, 30, 40},
                       {15, 25, 35, 45},
                       {27, 29, 37, 48},
                       {32, 33, 39, 50}};
               x = 29
 Output : Found at (2, 1)

 Problem Link - https://www.geeksforgeeks.org/search-in-row-wise-and-column-wise-sorted-matrix/
 */

import Foundation

func searchInARowWiseAndColumnWiseSortedMatrix(array: [[Int]], key: Int) -> (Int, Int) {
    let n = array.count
    let m = array[0].count
    var i = 0
    var j = array[0].count - 1
    
    while i >= 0 && i < n && j >= 0 && j < m {
        
        if array[i][j] == key {
            return (i, j)
        } else if array[i][j] > key {
            j -= 1
        } else if array[i][j] < key {
            i += 1
        }
    }
    return (-1, -1)
}

let array = [
    [10, 20, 30, 40],
    [15, 25, 35, 45],
    [27, 29, 37, 48],
    [32, 33, 39, 50]
];

print(searchInARowWiseAndColumnWiseSortedMatrix(array: array, key: 29))
