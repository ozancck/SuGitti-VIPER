//
//  WaterCutListInteractor.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import Foundation
import SVProgressHUD

protocol WaterCutListInteractorProtocol: AnyObject {
    func fetchWaterCuts()
}

protocol WaterCutListInteractorOutputProtocol: AnyObject {
    func waterCutsFetched(_ waterCuts: [WaterCut])
    func waterCutsFetchFailed(_ error: Error)
}

class WaterCutListInteractor: WaterCutListInteractorProtocol {
    weak var output: WaterCutListInteractorOutputProtocol?
    
    func fetchWaterCuts() {
        SVProgressHUD.show()
        NetworkService.shared.fetchWaterCuts { [weak self] result in
            switch result {
            case .success(let waterCuts):
                SVProgressHUD.dismiss()
                self?.output?.waterCutsFetched(waterCuts)
            case .failure(let error):
                SVProgressHUD.dismiss()
                self?.output?.waterCutsFetchFailed(error)
            }
        }
    }
}
