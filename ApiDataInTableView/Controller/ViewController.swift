//
//  ViewController.swift
//  ApiDataInTableView
//
//  Created by Srikanth Kyatham on 11/27/24.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        // Register the CountryCell

        fetchCountryData()

    }
    
    private func fetchCountryData() {
            let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
            CountryModel.shared.getData(from: urlString) { [weak self] countries in
                DispatchQueue.main.async {
                    self?.countries = countries
                    self?.tableView.reloadData()
                }
            }
        }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.config(with: country)
        return cell

    }
}

