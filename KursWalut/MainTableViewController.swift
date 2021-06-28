//
//  MainTableViewController.swift
//  KursWalut
//
//  Created by Vlad Koval on 24.06.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainTableViewController: UITableViewController {
    
    var v:[Rate] = []
    var effData:String = ""
    var codes = [String]()
    
    static var codeUrl = ""
    static var tableUrl = "a"
    static var startDateUrl = "2021-06-24"
    static var endDateUrl = "2021-06-27"

    var p = "a"
    
    @IBAction func changeEndPoint(_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0{
            print("a")
            self.p = "a"
            getTest (endpoint: p ) { WelcomeElements in
                self.v = WelcomeElements[0].rates
                self.tableView.reloadData()
                self.effData = WelcomeElements[0].effectiveDate
                
                
            } errorResponse: {
                
            }

        }
        else if (sender.selectedSegmentIndex == 1){
            print("b")
            self.p = "b"
            print(self.p, "---")

            getTest (endpoint: p) { WelcomeElements in
                self.v = WelcomeElements[0].rates
                self.tableView.reloadData()
                self.effData = WelcomeElements[0].effectiveDate
              //  MainTableViewController.ar = WelcomeElements[0].rates.count
                
                
            } errorResponse: {
                
            }

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.ma.rowHeight = UITableView.automaticDimension
        //self.ma.estimatedRowHeight = 300

        getTest (endpoint: p) { WelcomeElements in
            self.v = WelcomeElements[0].rates
            self.tableView.reloadData()
            self.effData = WelcomeElements[0].effectiveDate
            
        } errorResponse: {
            
        }
        

    }
    
    
    
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return v.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let selectedTrail = trails[indexPath.row]
        
        MainTableViewController.codeUrl.removeAll()
        MainTableViewController.codeUrl.append(String(v[indexPath.row].code))
        
        MainTableViewController.startDateUrl = "2021-06-24"
        MainTableViewController.endDateUrl = "2021-06-27"
        
        if let viewController = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
     
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MainTableViewCell

       // cell.backgroundColor = .red
        cell.effectiveDateLabel?.text = effData
        cell.currencyLabel?.text = v[indexPath.row].currency
        cell.midLabel?.text = String(v[indexPath.row].mid)
        cell.codeLabel?.text = String(v[indexPath.row].code)
        print(String(v[indexPath.row].code), "-------")
        print("--")
        
        return cell
    }
    @IBAction func reload(_ sender: UIRefreshControl) {
        getTest (endpoint: p) { WelcomeElements in
            self.v = WelcomeElements[0].rates
            self.effData = WelcomeElements[0].effectiveDate
            sender.endRefreshing()
            self.tableView.reloadData()
        } errorResponse: {
            
        }
    }

    
    

}
