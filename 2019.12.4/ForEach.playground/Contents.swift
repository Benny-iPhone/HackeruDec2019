import UIKit

let arr = ["a","b","c","e"]

for str in arr{
    print(str)
}

arr.forEach {
    print($0)
}

//Int.random(in: 60...100)
func randromGradeFrom60To100() -> Int{
    //arc4random_uniform(41) => randrom number in range of 0...40
    //return Int(arc4random_uniform(41) + 60)
    //return Int.random(in: 60...100)
    return Int(Int64(Date().timeIntervalSince1970 * 1_000_000) % 41 + 60)
}

class Student{
    let name : String = ""
    var grade : Int = randromGradeFrom60To100()
}

let students = [Student](repeating: Student(), count: 100)



//students.forEach { (st) in
//    st.grade = randromGradeFrom60To100()
//}
//students.forEach{ $0.grade = randromGradeFrom60To100() }

students[38].grade
students[99].grade

















