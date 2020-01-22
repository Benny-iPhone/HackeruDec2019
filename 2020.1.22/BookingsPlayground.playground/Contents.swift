import UIKit

//https://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
extension Character {
    // An emoji can either be a 2 byte unicode character or a normal UTF8 character with an emoji modifier
    // appended as is the case with 3️⃣. 0x238C is the first instance of UTF16 emoji that requires no modifier.
    // `isEmoji` will evaluate to true for any character that can be turned into an emoji by adding a modifier
    // such as the digit "3". To avoid this we confirm that any character below 0x238C has an emoji modifier attached
    var isEmoji: Bool {
        guard let scalar = unicodeScalars.first else { return false }
        return scalar.properties.isEmoji && (scalar.value > 0x238C || unicodeScalars.count > 1)
    }
}

func solution(_ str : String, map : [String:String]) -> String {
    
    var result : String = ""
    
    for ch in str {
        guard ch.isEmoji else {
            result.append(ch)
            continue
        }
        
        
        let chStr = String(ch)
        let stringToAdd = map[chStr] ?? chStr
        result += stringToAdd
    }
    
    return result
}

let map : [String:String] = [
    "😎":"Sun Glasses",
    "😀":"Smile"
]

let testString = "Hi There 😎, sup? 😀 🤢"
print(solution(testString, map: map))
