//
//  WaterCutListViewController.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import UIKit

class WaterCutListViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    var presenter: WaterCutListPresenterProtocol?
    var waterCuts: [WaterCut] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "WaterCutCell")
    }
}

extension WaterCutListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waterCuts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaterCutCell", for: indexPath)
        let waterCut = waterCuts[indexPath.row]
        cell.textLabel?.text = waterCut.Aciklama
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let waterCut = waterCuts[indexPath.row]
        presenter?.didSelectWaterCut(waterCut)
    }
}

extension WaterCutListViewController: WaterCutListViewProtocol {
    func showWaterCuts(_ waterCuts: [WaterCut]) {
        self.waterCuts = waterCuts
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            
            self.tableview.isHidden = true
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            
            self.tableview.isHidden = false
        }
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
