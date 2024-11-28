//
//  CountryCell.swift
//  ApiDataInTableView
//
//  Created by Srikanth Kyatham on 11/27/24.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(with country: Country) {
        nameLabel.text = country.name
        capitalLabel.text = "Capital: \(country.capital)"
        regionLabel.text = "Region: \(country.region)"
    }

}
