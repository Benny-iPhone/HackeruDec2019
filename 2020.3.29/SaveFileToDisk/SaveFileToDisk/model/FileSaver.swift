//
//  FileSaver.swift
//  SaveFileToDisk
//
//  Created by Teacher on 29/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

class FileSaver {
    private let documentsDirURL : URL
    
    init() {
        documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentsDirURL)
    }
    
    @discardableResult
    public func saveData(_ data : Data, file : String) -> Bool{
        let url = documentsDirURL.appendingPathComponent(file)
        
        do {
            try data.write(to: url)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func readData(from file : String) -> Data?{
        let url = documentsDirURL.appendingPathComponent(file)
        
        return try? Data(contentsOf: url)
    }
    
    func removeData(at file : String) {
        let url = documentsDirURL.appendingPathComponent(file)
        guard FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print(error)
        }
    }
}

extension FileSaver {

    @discardableResult
    func save(string : String, file : String) -> Bool {
        guard let data = string.data(using: .utf8) else {
            return false
        }
        return saveData(data, file: file)
    }
    
    func readString(from file : String) -> String? {
        guard let data = readData(from: file) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}

extension FileSaver {
    @discardableResult
    func save(person : Person, file : String) -> Bool{
        
        guard let data = try? JSONEncoder().encode(person) else {
            return false
        }
        
        return saveData(data, file: file)
    }
    
    func readPerson(file : String) -> Person? {
        guard let data = readData(from: file) else {
            return nil
        }
        
        do {
            let person = try JSONDecoder().decode(Person.self, from: data)
            return person
        } catch {
            print(error)
            return nil
        }
    
    }
}
