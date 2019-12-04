import UIKit

/*
 homework:
 1. check if array is palindrome
 2. write vending machine solition.
 a function receive price of product and the amount that being paid (for example, 0.99 and 5.00)
 and return the optimal change
 possible change coins:
 1$, 0.5$, 0.25$, 0.10$. 0.05$. 0.01$

 for the example mention above, result is:
 [4,0,0,0,0,1]
 3.  find max sub array in a given array
 */

//1

func isPalindrome1(arr : [Int]) -> Bool{
    
    let reversedArray = Array(arr.reversed())
    for i in 0..<(arr.count / 2){
        if reversedArray[i] != arr[i]{
            return false
        }
    }
    
    return true
    
}

func isPalindrome2(arr : [Int]) -> Bool{
    if arr.isEmpty{
        return true
    }
    let midIndex = arr.count / 2
    let maxIndex = arr.count - 1
    
    for i in 0..<midIndex{
        if arr[i] != arr[maxIndex - i]{
            return false
        }
    }
    
    return true
}

isPalindrome1(arr: [])
isPalindrome1(arr: [1])
isPalindrome1(arr: [1,1])
isPalindrome1(arr: [1,2,1])
isPalindrome1(arr: [1,2,2,1])
isPalindrome1(arr: [1,2,3])

isPalindrome2(arr: [])
isPalindrome2(arr: [1])
isPalindrome2(arr: [1,1])
isPalindrome2(arr: [1,2,1])
isPalindrome2(arr: [1,2,2,1])
isPalindrome2(arr: [1,2,3])


//2

func vendingMachine(price : Int, amount : Int) -> [Int]
{
    var change = amount - price
    
    let coins : [Int] = [100,50,25,10,5,1]
    var result = [Int](repeating: 0, count: coins.count)
    
    for i in 0..<coins.count{
        let coinCount = change / coins[i]
        result[i] = coinCount
        change = change % coins[i]
    }
    
    return result
}

vendingMachine(price: 99, amount: 500)
vendingMachine(price: 1, amount: 600)





















