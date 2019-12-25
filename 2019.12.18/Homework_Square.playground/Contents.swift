import UIKit

struct Point {
    let x : Double
    let y : Double
}

struct Square {
    let origin : Point //Left top point
    var size : Double
    
    var area : Double{
        get{
            return pow(size, 2)
        }
        set (newArea){
            guard newArea >= 0 else{
                return
            }
            print("new value for area: \(newArea)")
            size = sqrt(newArea)
            //when typing 'set {...}' with no name for the value
            //size = sqrt(newValue)
        }
    }
    
        //get-only computed property
    //    var area : Double{
    //        return pow(size, 2)
    //    }
    
    var diameter : Double{
        /*return*/ size * 4
    }
    
    var allPoints : [Point]{
        return [
            origin,
            Point(x: origin.x + size, y: origin.y),
            Point(x: origin.x, y: origin.y + size),
            Point(x: origin.x + size, y: origin.y + size)
        ]
    }
    
}

var s = Square(origin: Point(x: 0, y: 0), size: 10)

s.allPoints
print(s.area)
print(s.diameter)
s.area = 144
print(s.size)

s.area = -1
s.size
