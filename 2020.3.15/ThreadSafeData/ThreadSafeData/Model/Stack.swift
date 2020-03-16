//
//  Stack.swift
//  ThreadSafeData
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

protocol IStack {
    func add(object : Int)
    func getCount() -> Int
    func removeLast() -> Int?
}

class Stack : IStack {
    
    private var array : [Int]
    private var queue : DispatchQueue
    
    init() {
        self.array = []
        //Serial Queue, only single thread can execute operation at a given time
        self.queue = DispatchQueue(label: UUID().uuidString)
    }
    
    func add(object : Int) {
        self.queue.async {
            self.array.append(object)
        }
    }
    
    func getCount() -> Int {
        var result : Int = 0
        self.queue.sync {
            print(self.array)
            result = self.array.count
        }
        return result
    }
    
    func removeLast() -> Int? {
        var result : Int?
        
        self.queue.sync {
            if array.count == 0 {
                result = nil
                return
            }
            let lastObjectIndex = array.count - 1
            result = array.remove(at: lastObjectIndex)
        }
        
        return result
    }
}
