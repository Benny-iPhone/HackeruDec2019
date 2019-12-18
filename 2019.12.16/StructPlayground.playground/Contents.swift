import UIKit

struct Point {
    let x : Double
    let y : Double
    
    //(p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2 = distance ^ 2
    //sqrt((p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2) = distance
    func distance(from point : Point) -> Double {
        return sqrt(pow(self.x - point.x, 2) + pow(self.y - point.y, 2))
    }
    
    init(x : Double = 0, y : Double = 0) {
        self.x = x
        self.y = y
    }
    
    init?(string : String){ //"1.5,2.0"
        let arr = string.components(separatedBy: ",") //a.k.a split
        /*
        if arr.count == 2 , let x = Double(arr[0]), let y = Double(arr[1]){
            self.x = x
            self.y = y
        } else {
            return nil
        }
        */
        
        guard arr.count == 2,
            let x = Double(arr[0]),
            let y = Double(arr[1]) else{
                return nil
        }
        
        self.x = x
        self.y = y
    }
}

let p1 = Point(x: 1.5, y: -2.5)
let p2 = Point(x: -1)
let p3 = Point(y: 50)
let p4 = Point()
print(p2.x)

print(p1.distance(from: p2))

if let strPoint = Point(string: "2,-25"){
    print(strPoint)
} else {
    print("2,-25 is not a valid point")
}

if let strPoint = Point(string: "a,-25"){
    print(strPoint)
} else {
    print("a,-25 is not a valid point")
}



struct Square {
    let origin : Point
    let size : Double
}

let s1 = Square(origin: p1, size: 100)
