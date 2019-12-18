import UIKit

enum Direction{
    case right
    case left
    case up, down
}

let dir1 = Direction.right
var dir2 : Direction = .left
dir2 = .up

enum OS : Int{
    case iOS = 1
    case android = 2
}

let myOS = OS.iOS
let myOSInt = myOS.rawValue //1
let os : OS? = OS(rawValue: 2)
OS(rawValue: 3)




