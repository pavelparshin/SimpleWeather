//
//  CitiesTableViewController.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 24.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    private var cityWeather: [CityWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getCityTemperature()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeather.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! TableViewCell
        cell.configCell(with: cityWeather[indexPath.row])
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cityWeather[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: city)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailCVC = segue.destination as! DetailViewController
            detailCVC.city = sender as? CityWeather
        }
    }
    
    //MARK: - Private methods
    private func getCityTemperature() {
        let cityList = DataManager.shared.cities
        for city in cityList {
            NetworkManager.shared.getRequest(city: city) { cityData in
                self.cityWeather.append(cityData)
                self.tableView.reloadData()
            }
        }
    }
    
}
