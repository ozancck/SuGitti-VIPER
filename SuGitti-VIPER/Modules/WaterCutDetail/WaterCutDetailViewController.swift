//
//  WaterCutDetailViewController.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import UIKit

class WaterCutDetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var presenter: WaterCutDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension WaterCutDetailViewController: WaterCutDetailViewProtocol {
    func showWaterCutDetails(description: String, district: String, date: String) {
        descriptionLabel.text = description
        districtLabel.text = district
        dateLabel.text = date
    }
}
