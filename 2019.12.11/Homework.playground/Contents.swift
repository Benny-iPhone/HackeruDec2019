import UIKit

func solution1(_ arr : [String]) -> String?{
    var dict : [String:Int] = [:]
    
    for value in arr {
        let count = dict[value] ?? 0
        dict[value] = count + 1
    }
    
    //["a":2,"b":1]
    
    var mostFrequent : String?
    var mostFrequentCount = 0
    
    for (key,count) in dict{
        if count > mostFrequentCount {
            mostFrequentCount = count
            mostFrequent = key
        }
    }
    
    return mostFrequent
}

solution1([])
solution1(["a"])
solution1(["a","b","a"])
solution1(["c","d","c","d"])

func solution2(dict : [String:String]) -> Int {
    var sum = 0
    let vowels : [Character] = ["a","e","i","o","u","A","E","I","O","U"]
    
    for (key,val) in dict{
        
        for ch in (key + val){ //ch : Character
            if vowels.contains(ch){
                sum += 1
            }
        }
    }
    
    return sum
}

solution2(dict: [:])
solution2(dict: ["asdas hhdkjbjjnku4y59":"ASDADHKJKGDFDGT"])

extension Character{
    func isVowel() -> Bool{
        let vowels : [Character] = ["a","e","i","o","u","A","E","I","O","U"]
        return vowels.contains(self)
    }
}

extension String{
    func countVowels() -> Int{
        return self.reduce(0) { $0 + ($1.isVowel() ? 1 : 0)}
    }
}

"mAbeI".countVowels()


func solution2Alternative(dict : [String:String]) -> Int {
    return dict.reduce(0) { (resultSoFar, pair) -> Int in
        return resultSoFar + pair.key.countVowels() + pair.value.countVowels()
    }
}

let testDictionary = [
    "abc":"def",
    "z":"k",
    "aO0":"iPhone"
]
solution2Alternative(dict: testDictionary)

