//
//  PeopleViewController.swift
//  HitList
//
//  Created by Teacher on 12/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import CoreData

class PeopleViewController: UIViewController {
    
    var controller : NSFetchedResultsController<Person>?
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }
    
    func setupController() {
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        //order by lastName , then by firstName
        request.sortDescriptors = [
            NSSortDescriptor(key: "lastName", ascending: true),
            NSSortDescriptor(key: "firstName", ascending: true)
        ]
        
        let controller = NSFetchedResultsController<Person>(fetchRequest: request, managedObjectContext: Database.shared.context, sectionNameKeyPath: "indexChar", cacheName: nil)
        
        controller.delegate = self //listen to updates
        
        try? controller.performFetch()
        
        self.controller = controller
    }

}

extension PeopleViewController : UITableViewDataSource {
    private func titleForFooter(section : Int) -> String {
        guard let array = controller?.sections,
            section < array.count else {
                return ""
        }
        
        let number = array[section].numberOfObjects
        return "Total: \(number)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return controller?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return controller?.sections?[section].name
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooter(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = controller?.object(at: indexPath)
        cell.textLabel?.text = (person?.firstName ?? "") + " " + (person?.lastName ?? "")
        
        return cell
    }
}

extension PeopleViewController : NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates() //start of batch
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates() //end of batch, commit changes
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type { //type of change
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
            tableView.footerView(forSection: newIndexPath!.section)?.textLabel?.text = self.titleForFooter(section: newIndexPath!.section)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.footerView(forSection: indexPath!.section)?.textLabel?.text = self.titleForFooter(section: indexPath!.section)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
            //TBD
            //tableView.reloadRows(at: [newIndexPath!], with: .automatic)
        @unknown default:
            fatalError()
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            let set = IndexSet(integer: sectionIndex)
            tableView.insertSections(set, with: .automatic)
        case .delete:
            let set = IndexSet(integer: sectionIndex)
            tableView.deleteSections(set, with: .automatic)
        case .update:
            print("section updated")
        default:
            break
        }
        
    }
}
