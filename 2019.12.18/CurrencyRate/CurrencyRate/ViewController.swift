//
//  ViewController.swift
//  CurrencyRate
//
//  Created by HACKERU on 15/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

//ViewController, inherits UIViewController and implement the protcol (interface) UITableViewDataSource
class ViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    private var tableArray : [Rate] = []
    private let fixer = FixerIO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        //mockData()
        //make a delay, if you want to see the UI empty before getting the data
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.loadData()
//        }
        loadData()
    }
    
    private func loadData() {
        //fixer.getRates(with: <#T##FixerIO.Callback##FixerIO.Callback##([Rate]) -> Void#>)
        fixer.getRates { (rates : [Rate]) in
            //back to main thread
            print(rates.count)
            
            DispatchQueue.main.async {
                self.tableArray = rates
                self.tableView.reloadData()
            }
        }
    }
    
    private func mockData(){
        
        self.tableArray = [
            Rate(code: "EUR", value: 1.5),
            Rate(code: "USD", value: 2.5)
        ]
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create or reuse cell ui element
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let rowRate = tableArray[indexPath.row]
        cell.textLabel?.text = rowRate.euroDescription
        //cell.textLabel?.text = rowRate.value.description //like 'to string'
        cell.detailTextLabel?.text = rowRate.code
        
        return cell
    }

}

