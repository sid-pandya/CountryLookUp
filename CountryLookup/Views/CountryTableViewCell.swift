//
//  CountryTableViewCell.swift
//  CountryLookup
//
//  Created by Sidhdharth Pandya on 5/9/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var regionCodeLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Configuration Method
    func configure(with country: Country) {
        countryNameLabel.text = "\(country.name), \(country.region)"
        regionCodeLabel.text = country.code
        capitalNameLabel.text = country.capital == "" ? "N/A" : country.capital
        baseView.layer.cornerRadius = 12
        baseView.layer.masksToBounds = true
    }

}
