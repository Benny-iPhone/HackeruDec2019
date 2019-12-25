import UIKit

class WiFiAppliance {
    let id : String
    let ipAddress : String
    let port : Int
    
    init(){
        self.id = ""
        self.ipAddress = ""
        self.port = 0
    }
    
    init(ipAddress : String, port : Int) {
        self.id = UUID().uuidString
        self.ipAddress = ipAddress
        self.port = port
    }
    
    func wakeUp() {
        print("waking up")
    }
}

WiFiAppliance()

class WiFiCamera : WiFiAppliance {
    
}

let camera = WiFiCamera(ipAddress: "10.10.0.201", port: 4000)

class MotionSensor : WiFiAppliance , Codable{
    var movement : Bool
    
    override init() {
        self.movement = false
        super.init()
    }
    
    init(ipAddress: String, movement : Bool) {
        self.movement = movement
        super.init(ipAddress: ipAddress, port: 8080)
    }
    
    override func wakeUp() {
        super.wakeUp()
        print("something")
    }
    
    func updateStatus() {
        
    }
}

let sensor = MotionSensor()
let sensor2 = MotionSensor(ipAddress: "10.10.0.201", movement: false)
sensor.updateStatus()
