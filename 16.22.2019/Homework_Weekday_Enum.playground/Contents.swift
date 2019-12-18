import UIKit

//UIColor(red: 0/255.0, green: 100/255.0, blue: 255/255.0, alpha: 1)
//UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)

enum Weekday : Int {
    case sunday = 1
    case monday
    case tuseday
    case wednesday
    case thursday
    case friday
    case saturday
    
    func getNextDay() -> Weekday {
        return Weekday(rawValue: self.rawValue + 1) ?? .sunday
    }
    
    func localizedString() -> String {
        switch self {
        case .sunday:
            return NSLocalizedString("WEEKDAY_SUNDAY", comment: "")
        default:
            return "NOT YET SUPPORTED"
        }
    }
}

let d : Weekday = .monday
print(d.getNextDay())
d.getNextDay().getNextDay().getNextDay().getNextDay()

Weekday.sunday.localizedString()

let val = Weekday.friday.rawValue
print(val)

let saturday = Weekday(rawValue: val + 1)
saturday?.localizedString()

func getNextDay(from day : Weekday) -> Weekday {
    
    if let result = Weekday(rawValue: day.rawValue + 1){
        return result
    } else {
        return .sunday
    }
    
    //return Weekday(rawValue: day.rawValue + 1) ?? .sunday
    
}

print(getNextDay(from: .wednesday))
print(getNextDay(from: .saturday))

