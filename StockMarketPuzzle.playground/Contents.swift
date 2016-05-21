//: Playground - noun: a place where people can play

import UIKit

var maxDiff:Int, maxPos:Int
var minValue:Int, minPos:Int


//Create your own custom stack using generic types in Swift
struct Stack {
    var items = [Int]()
    
    mutating func push(item: Int)  {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
}

//Helper functions
func min(a:Int, b:Int) -> Int {
    if a < b {
        return a
    } else if a >= b {
        return b
    }
    
    return -1
}

func max(a:Int, b:Int) -> Int {
    if a > b {
        return a
    } else if a >= b {
        return b
    }
    
    return -1
}

//Create a Stack variable
var buySell:Stack = Stack()

//Initialize private var's
minValue = 0
maxDiff = 0
maxPos = 0
minPos = 0



func solve(input:[Int]) {
    
    minValue = input[0]
    var diff:Int, newMax:Int, newMin:Int
    
    for (var i = 0; i < input.count; i++) {
        newMin = min(minValue, input[i])
        
        if newMin < minValue {
            minValue = newMin
            minPos = i
        }
        
        diff = input[i] - minValue
        newMax = max(diff, maxDiff)
        
        if newMax > maxDiff {
            maxDiff = newMax
            maxPos = i
            buySell.push(maxPos)
            buySell.push(minPos)
            
        }
        
    }
    
    let printMinPos:Int = buySell.pop()
    let printMaxPos:Int = buySell.pop()
    
    print("Max difference is \(maxDiff)")
    print("Max position is \(printMaxPos)")
    print("Min poition is \(printMinPos)")

}


solve([-1, 5, 0, 1, 8, -3])









