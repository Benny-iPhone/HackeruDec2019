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
    
    private func createPerson() {
        let alert = UIAlertController(title: "Create Person", message: "Fill the fields below", preferredStyle: .alert)
        
        //add text-fields
        alert.addTextField {
            $0.placeholder = "First Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Last Name"
        }
        
        //cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //submit button
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (_) in
            print("submit pressed")
            
            guard let firstName = alert.textFields?.first?.text,
                let lastName = alert.textFields?.last?.text,
                firstName.count > 0, lastName.count > 0 else { return }
            
            let p = Person(context: Database.shared.context)
            p.firstName = firstName
            p.lastName = lastName
            p.isAlive = true
            p.createDate = Date()
            
            Database.shared.saveContext()
            
            self.reloadData()
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func addAction(_ sender: Any) {
        createPerson()
    }
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = tableArray[indexPath.row]
        cell.textLabel?.text = (person.firstName ?? "") + " " + (person.lastName ?? "")
        
        return cell
    }
    
    
    
}
