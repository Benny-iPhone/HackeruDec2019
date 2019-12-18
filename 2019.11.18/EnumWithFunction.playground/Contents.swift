import UIKit

enum State {
    
    case idle
    case inActive
    case inProcess
    case finished
    case failed
    
    //computed property
    var didEnd : Bool{
        switch self {
        case .finished, .failed:
            return true
        default:
            return false
        }
    }
    
    func doNothing() {
        
    }
    
}
