//
//  ViewController.swift
//  HitList
//
//  Created by Teacher on 09/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        reloadData()
    }
    
    private func reloadData() {
        let context = Database.shared.context
        
        //just like SELECT * From Person
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            self.tableArray = try context.fetch(request)
        } catch {
            print("failed to fetch data \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    private func createOrUpdatePerson(at indexPath : IndexPath? = nil) {
        let person = indexPath == nil ? nil : tableArray[indexPath!.row]
        
        let alertTitle = person == nil ? "Create Person" : "Update Person"
        let alert = UIAlertController(title: alertTitle, message: "Fill the fields below", preferredStyle: .alert)
        
        //add text-fields
        alert.addTextField {
            $0.placeholder = "First Name"
            $0.text = person?.firstName
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Last Name"
            textField.text = person?.lastName
        }
        
        //cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //submit button
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (_) in
            //print("submit pressed")
            
            guard let firstName = alert.textFields?.first?.text,
                let lastName = alert.textFields?.last?.text,
                firstName.count > 0, lastName.count > 0 else { return }
            
            let p = person ?? Person(context: Database.shared.context)
            p.firstName = firstName
            p.lastName = lastName
            p.isAlive = true
            p.indexChar = String(lastName.prefix(1))
            
            if person == nil {
                p.createDate = Date()
            }
            
            Database.shared.saveContext()
            
            //self.reloadData()
            if person == nil {
                let indexPath = IndexPath(row: self.tableArray.count, section: 0)
                self.tableArray += [p]
                self.tableView.insertRows(at: [indexPath], with: .right)
            } else {
                self.tableView.reloadRows(at: [indexPath!], with: .automatic)
            }
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func addAction(_ sender: Any) {
        createOrUpdatePerson()
    }
    
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = tableArray[indexPath.row]
        cell.textLabel?.text = (person.firstName ?? "") + " " + (person.lastName ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //return indexPath.row % 2 == 0
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        
        //delete from db
        let person = tableArray.remove(at: indexPath.row)
        Database.shared.context.delete(person)
        Database.shared.saveContext()
        
        //refresh UI
        tableView.deleteRows(at: [indexPath], with: .left)
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        createOrUpdatePerson(at: indexPath)
        
//        print(#function)
//        print(tableArray[indexPath.row].firstName ?? "")
    }
}
