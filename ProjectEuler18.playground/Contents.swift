// Dec 8 2015
// GOAL: https://projecteuler.net/problem=18

import Foundation

var pyramid =
[[75],
[95, 64],
[17, 47, 82],
[18, 35, 87, 10],
[20, 04, 82, 47, 65],
[19, 01, 23, 75, 03, 34],
[88, 02, 77, 73, 07, 63, 67],
[99, 65, 04, 28, 06, 16, 70, 92],
[41, 41, 26, 56, 83, 40, 80, 70, 33],
[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,],
[63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
[04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]]


func bottomUp() -> Int {
    pyramid = pyramid.reverse()

    for (rowIndex, rowArr) in pyramid.enumerate() {
        
        if rowIndex == pyramid.count - 1 {
            // break if its at top of pyramid
            break
        }
        
        for (colIndex, colVal) in pyramid[rowIndex].enumerate() {
            if (colIndex == rowArr.count - 1) {
                // break if it's on the last col
                break
            }
            
            var max:Int
            let a = colVal
            let b = pyramid[rowIndex][colIndex + 1]
            
            if a > b {
                max = a
            } else {
                max = b
            }
            
            pyramid[rowIndex + 1][colIndex] += max
        }
        
        print(pyramid[rowIndex])
        print("")
        
    }
    
    return pyramid.reverse()[0][0]
}


func recursive(row: Int, index: Int, sum: Int) -> Int {
    if row == pyramid.count - 1 {
        return sum + pyramid[row][index]
    }

    let pathA = recursive(row + 1, index: index, sum: sum + pyramid[row][index])
    let pathB = recursive(row + 1, index: index + 1, sum: sum + pyramid[row][index])

    if (pathA > pathB) {
        return pathA
    } else {
        return pathB
    }
}

//recursive(0, index: 0, sum: 0)
bottomUp()
