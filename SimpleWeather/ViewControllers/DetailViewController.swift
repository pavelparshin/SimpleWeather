//
//  DetailViewController.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var cityNameLabel: UILabel!
    
    var city: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        cityNameLabel.text = city
    }

}
