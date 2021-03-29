//
//  TCSDetailViewController.swift
//  TCSVenky29March
//
//  Created by Venkateshwaran Ilangovan on 3/28/21.
//

import UIKit

class TCSDetailViewController: UIViewController {

    var satDataArray:[satJSONResponse] = []
    var dbnLabel: UILabel!
    var school_name: UILabel!
    var num_of_sat_test_takers: UILabel!
    var sat_writing_avg_score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(satDataArray)
        self.view.backgroundColor = UIColor.white
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        dbnLabel = UILabel()
        dbnLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dbnLabel)
        dbnLabel.text = satDataArray.first?.dbn
        dbnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        dbnLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        dbnLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        dbnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110.0).isActive = true
//        dbnLabel.bottomAnchor.constraint(equalTo: school_name.topAnchor, constant: 10.0).isActive = true
        
        school_name = UILabel()
        school_name.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(school_name)
        school_name.text = satDataArray.first?.school_name
        school_name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        school_name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        school_name.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        school_name.topAnchor.constraint(equalTo: dbnLabel.bottomAnchor, constant: 10.0).isActive = true
//        school_name.bottomAnchor.constraint(equalTo: website.topAnchor, constant: 10.0).isActive = true

        num_of_sat_test_takers = UILabel()
        num_of_sat_test_takers.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(num_of_sat_test_takers)
        if let value = satDataArray.first?.num_of_sat_test_takers {
            num_of_sat_test_takers.text = "Number of SAT Test takers: \(String(describing: value) ) "
        }
        num_of_sat_test_takers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        num_of_sat_test_takers.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        num_of_sat_test_takers.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        num_of_sat_test_takers.topAnchor.constraint(equalTo: school_name.bottomAnchor, constant: 10.0).isActive = true
//        num_of_sat_test_takers.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true

        sat_writing_avg_score = UILabel()
        sat_writing_avg_score.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sat_writing_avg_score)
        if let value = satDataArray.first?.sat_writing_avg_score {
            sat_writing_avg_score.text = "SAT Average score: \(String(describing: value)) "
        }
        sat_writing_avg_score.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        sat_writing_avg_score.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        sat_writing_avg_score.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        sat_writing_avg_score.topAnchor.constraint(equalTo: num_of_sat_test_takers.bottomAnchor, constant: 10.0).isActive = true
//        sat_writing_avg_score.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
