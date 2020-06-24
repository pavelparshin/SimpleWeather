//
//  CitiesTableViewController.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 24.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    private let cityes = DataManager.shared.cities
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.getRequest(city: cityes[0])
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        configCell(with: cell, city: cityes[indexPath.row])
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cityes[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: city)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailCVC = segue.destination as! DetailViewController
            detailCVC.city = sender as? Cities
        }
    }
    
    //MARK: - Private methods
    private func configCell(with cell: UITableViewCell, city: Cities) {
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "\(city.id)"
    }

}
