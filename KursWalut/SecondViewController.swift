//
//  SecondViewController.swift
//  KursWalut
//
//  Created by Vlad Koval on 26.06.2021.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    var wal: Info?
    var arrRates: [InfoRate] = []
    var startDate = "2021-06-24"
    var endDate = "2021-06-27"
    var refreshControl = UIRefreshControl()
    
    
    var range : TimeInterval!
    
//    @IBOutlet weak var dataPicker: UIDatePicker! =  {
//        var dataPicker: UIDatePicker = UIDatePicker()
//        //dataPicker.minimumDate = ..
//        // dataPicker.maximumDate = ..
//        return dataPicker
//    }()
    
    
    // MARK: DataPickerDelegate
    
    @IBOutlet weak var tableWaluta: UITableView!
    
//400 BadRequest - Przekroczony limit 367 dni / Limit of 367 days has been exceeded
    @IBAction func startDate(_ sender: UIDatePicker) {
        sender.maximumDate = Date()
        let dateFormatter: DateFormatter = DateFormatter()
                
    // Set date format
    dateFormatter.dateFormat = "yyyy-MM-dd"
                
    // Apply date format
    let selectedDate: String = dateFormatter.string(from: sender.date)
        print(selectedDate,"--test output")
        self.startDate = selectedDate
        
        MainTableViewController.startDateUrl.removeAll()
        MainTableViewController.startDateUrl.append(contentsOf: startDate)
        
        getJson(code: MainTableViewController.codeUrl, startDateUrl:  MainTableViewController.startDateUrl, endDateUrl:  MainTableViewController.endDateUrl) { InfoT in
           // self.wal = InfoT
            self.arrRates = InfoT.rates
            self.tableWaluta.reloadData()
          //  print(InfoT.code,"-----")
        } errorResponse: {
            
        }
        self.tableWaluta.reloadData()
    }
    
    
    @IBAction func endDate(_ sender: UIDatePicker) {
        sender.maximumDate = Date()
    let dateFormatter: DateFormatter = DateFormatter()
                
    // Set date format
    dateFormatter.dateFormat = "yyyy-MM-dd"
                
    // Apply date format
    let selectedDate: String = dateFormatter.string(from: sender.date)
        
        self.endDate = selectedDate
        MainTableViewController.endDateUrl.removeAll()
        MainTableViewController.endDateUrl.append(contentsOf: endDate)
        print(startDate," --Start output",endDate," --End output")
        
        getJson(code: MainTableViewController.codeUrl, startDateUrl:  MainTableViewController.startDateUrl, endDateUrl:  MainTableViewController.endDateUrl) { InfoT in
           // self.wal = InfoT
            self.arrRates = InfoT.rates
            self.tableWaluta.reloadData()
          //  print(InfoT.code,"-----")
        } errorResponse: {
            
        }
        self.tableWaluta.reloadData()

    }
    
    
    override func viewDidLoad(){
        
        //MainTableViewController.startDateUrl.removeAll()
      //  MainTableViewController.endDateUrl.removeAll()

        print(MainTableViewController.codeUrl)
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(self.updDate(sender:)), for: .valueChanged)
        tableWaluta.addSubview(refreshControl)
        
        print(startDate,"---")
        print(endDate,"---")
        
        getJson(code: MainTableViewController.codeUrl, startDateUrl:  MainTableViewController.startDateUrl, endDateUrl:  MainTableViewController.endDateUrl) { InfoT in
           // self.wal = InfoT
            self.arrRates = InfoT.rates
            self.title = InfoT.code
            self.tableWaluta.reloadData()
          //  print(InfoT.code,"-----")
        } errorResponse: {
            
        }
        tableWaluta.dataSource = self
    }
    
    @objc func updDate(sender: Any){
        getJson(code: MainTableViewController.codeUrl, startDateUrl:  MainTableViewController.startDateUrl, endDateUrl:  MainTableViewController.endDateUrl) { InfoT in
           // self.wal = InfoT
            self.arrRates = InfoT.rates
            self.title = InfoT.code
            self.tableWaluta.reloadData()
            self.refreshControl.endRefreshing()

          //  print(InfoT.code,"-----")
        } errorResponse: {
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arrRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondTableViewCell
        
        cell.midLabel.text = String(arrRates[indexPath.row].mid)
        cell.effectiveLabel.text = String(arrRates[indexPath.row].effectiveDate)
       // print(wal)
      //  print(arrRates)
        return cell
    }
    
    
}

