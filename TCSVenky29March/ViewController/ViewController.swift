//
//  ViewController.swift
//  TCSVenky29March
//
//  Created by Venkateshwaran Ilangovan on 3/28/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var schoolTableView: UITableView!
    var schoolDataArray:[schoolJsonResponse] = []
    var satDataArray:[satJSONResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        schoolTableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: "SchoolTableViewCell")
        
        TCSRequestComposer.sharedSessionManager.parseSchoolData(rooturl: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") { ( jsonResponse: [schoolJsonResponse]?) in
            self.schoolDataArray = jsonResponse!
            print(self.schoolDataArray)
            DispatchQueue.main.async {
                self.schoolTableView.reloadData()
            }
        }
        
        TCSRequestComposer.sharedSessionManager.parseSatScoreData(rooturl: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") { (jsonResponse: [satJSONResponse]?) in
            self.satDataArray = jsonResponse!
            print(self.satDataArray)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        schoolTableView = UITableView()
        schoolTableView.translatesAutoresizingMaskIntoConstraints = false
        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        view.addSubview(schoolTableView)
        schoolTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        schoolTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        schoolTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        schoolTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as! SchoolTableViewCell
        
        tableViewCell.dbnLabel.text = schoolDataArray[indexPath.row].dbn
        tableViewCell.school_name.text = schoolDataArray[indexPath.row].school_name
        tableViewCell.website.text = schoolDataArray[indexPath.row].website
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell selected")
        
        let selectedIndexpath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: selectedIndexpath!) as! SchoolTableViewCell
        let selecteddbnValue = currentCell.dbnLabel.text
        
        let selectedData = self.satDataArray.filter{$0.dbn == selecteddbnValue}
        print(selectedData)
        
        let vc = TCSDetailViewController()
        vc.satDataArray = selectedData
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

