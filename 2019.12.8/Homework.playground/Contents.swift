import UIKit
/*
let intVal = Int("asdad")
if let intVal = intVal{
    
}
*/
func solution(arr : [Any]) -> [Any]
{
    var arr = arr
    
    let maxIndex = arr.count - 1
    for i in 0..<(arr.count / 2){
        let leftVal = arr[i]
        let rightVal = arr[maxIndex - i]
        
        arr[i] = rightVal
        arr[maxIndex - i] = leftVal
    }
    
    return arr
}

solution(arr: [1,2,3])
solution(arr: [1,1])
solution(arr: [4,5])
solution(arr: [])
print(solution(arr: (0...100).compactMap{$0}))


















