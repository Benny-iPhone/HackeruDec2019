//
//  ViewController.swift
//  ParkingLot
//
//  Created by Teacher on 18/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class ViewController: UIViewController , UITableViewDataSource {
    

    var tableArray : [Car] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        loadData()
    }
    
    private func loadData(){
        self.tableArray = Car.loadFrom(file: "MOCK_DATA")
        //tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let car = tableArray[indexPath.row]
        
        cell.backgroundColor = hexStringToUIColor(hex: car.color).withAlphaComponent(0.4)
        
        cell.textLabel?.text = car.make + " - " + car.model
        cell.detailTextLabel?.text = car.vin
        
        return cell
    }

}

