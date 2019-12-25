import UIKit

struct MyStruct{
    
}

let s = MyStruct()

struct MyStructWithProperties{
    var str : String
    var intValue : Int?
}

var s1 = MyStructWithProperties(str: "a string", intValue: nil)
s1.str = "other string"

extension MyStructWithProperties{
    var twiceIntValue : Int?{
        guard let intValue = intValue else { return nil }
        return intValue * 2
    }
}
s1.intValue = 4
s1.twiceIntValue

struct Airplane {
    static let minAltitude : Double = -400
    private var _altitude : Double
    //-400 is min value
    var altitude : Double {
        set{
            self._altitude = max(newValue, Airplane.minAltitude)
        }
        get{
            return _altitude
        }
    }
    
    init(altitude : Double){
        self._altitude = max(altitude, Airplane.minAltitude)
    }
}

var myAirPlane = Airplane(altitude: -500)
myAirPlane.altitude = 40

struct Player {
    var isPlaying : Bool
    
    init(){
        self.isPlaying = false
    }
    
    mutating func play() {
        //self = Player()
        isPlaying = true
        print(#function)
        print(#file)
        print(#line)
    }
    
    func pause() {
        print(#function)
    }
    
}


let p = Player()
p.pause()
//p.play()

var player = Player()
player.play()
player.pause()

struct Person {
    var name : String
}

var p1 = Person(name: "Benny")
var p2 = p1
p2.name = "David"

p1.name

class Student {
    var alias : String = ""
}

let st1 = Student()
st1.alias = "st1"
let st2 = st1
st2.alias = "st2"
st1.alias




