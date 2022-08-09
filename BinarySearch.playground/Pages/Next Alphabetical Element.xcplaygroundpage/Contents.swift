/*
 Given an array of letters sorted in ascending order, find the smallest letter in the the array which is greater than a given key letter. . 
 */

import Foundation

var greeting = "Hello, playground"

func nextAlphabeticalElement(array: [Character], key: Character) -> Character {
    var start = 0
    var end = array.count - 1
    var res: Character  = Character.init("0")
    
    while start <= end {
        
        let mid = start + ((end - start)/2)
        
        if array[mid] == key {
            start = mid + 1
        } else if array[mid] < key {
            start = mid + 1
        } else if array[mid] > key {
            res = array[mid]
            end = mid - 1
        }
    }
    return res
}

let array = Array("acfh")
let key = Character.init("f")
print(nextAlphabeticalElement(array: array, key: key))
