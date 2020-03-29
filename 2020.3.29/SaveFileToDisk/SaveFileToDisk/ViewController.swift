//
//  ViewController.swift
//  SaveFileToDisk
//
//  Created by Teacher on 29/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let saver = FileSaver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        readPerson()
        savePerson()
        
        //Homework for Amnon
        //כאן אמורים לטעון מהדיסק
    }
    
    func savePerson() {
        let person = Person(id: UUID().uuidString, name: "Ziv")
        saver.save(person: person, file: "ziv.json")
    }
    
    func readPerson() {
        if let person = saver.readPerson(file: "ziv.json") {
            print(person.name)
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        let text = textView.text ?? ""
        
        saver.save(string: text, file: "amnon.txt")
    }
    
    @IBAction func readAction(_ sender: Any) {
        
        textView.text = saver.readString(from: "amnon.txt")
        
    }
}

