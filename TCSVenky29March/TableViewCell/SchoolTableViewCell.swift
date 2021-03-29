//
//  SchoolTableViewCell.swift
//  TCSVenky29March
//
//  Created by Venkateshwaran Ilangovan on 3/28/21.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    var dbnLabel: UILabel!
    var school_name: UILabel!
    var school_email: UILabel!
    var website: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        dbnLabel = UILabel()
        dbnLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dbnLabel)
        dbnLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        dbnLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        dbnLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        dbnLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
//        dbnLabel.bottomAnchor.constraint(equalTo: school_name.topAnchor, constant: 10.0).isActive = true
        
        school_name = UILabel()
        school_name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(school_name)
        school_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 4.0).isActive = true
        school_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        school_name.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        school_name.topAnchor.constraint(equalTo: dbnLabel.bottomAnchor, constant: 10.0).isActive = true
//        school_name.bottomAnchor.constraint(equalTo: website.topAnchor, constant: 10.0).isActive = true
        
        website = UILabel()
        website.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(website)
        website.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 4.0).isActive = true
        website.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        website.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        website.topAnchor.constraint(equalTo: school_name.bottomAnchor, constant: 10.0).isActive = true
        website.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
