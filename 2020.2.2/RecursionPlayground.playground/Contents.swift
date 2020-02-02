import UIKit

/*
 כתבו פונקציה המקבלת מערך בעומק לא ידוע ומחזירה אותו שטוח (עומק 1)
 למשל, אם קיבלתם את המערך

 [1,2,[3],[[4,5]]
 עליכם להחזיר
 [1,2,3,4,5]
 
 */

func solution(_ arr : [Any]) -> [Any] {
    var result : [Any] = []
    
    for obj in arr {
        //        if obj is [Any] {
        //            solution(obj as! [Any])
        //        }
        if let subArray = obj as? [Any] {
            result += solution(subArray)
        } else {
            result.append(obj)
        }

    }
    
    return result
}

func solution2(_ item : Any) -> [Any] {
    guard let subArray = item as? [Any] else {
        return [item]
    }
    
    var result : [Any] = []
    for obj in subArray {
        result += solution2(obj)
    }
    
    return result
}

let sampleArray : [Any] = [1,2,[3],[[4,5]],"str[]ing",3.4]
solution(sampleArray)
solution2(sampleArray)
