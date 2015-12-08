// Dec 7 2015
// GOAL: Have a little fun with some recursive functions

import Foundation


var dict:Dictionary = [0:0, 1:1]
func memoizedFib(fib:Int) -> Int {
    if dict[fib] != nil {
        return dict[fib]!
    } else if fib < 0 {
        return 0
    }
    
    dict[fib] = (memoizedFib(fib - 1) + memoizedFib(fib - 2))
    return dict[fib]!
}

memoizedFib(55)