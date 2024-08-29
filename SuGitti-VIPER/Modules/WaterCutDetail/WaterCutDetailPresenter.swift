//
//  WaterCutDetailPresenter.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import Foundation

protocol WaterCutDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol WaterCutDetailViewProtocol: AnyObject {
    func showWaterCutDetails(description: String, district: String, date: String)
}

class WaterCutDetailPresenter: WaterCutDetailPresenterProtocol {
    weak var view: WaterCutDetailViewProtocol?
    var interactor: WaterCutDetailInteractorProtocol?
    var router: WaterCutDetailRouterProtocol?
    var waterCut: WaterCut?
    
    func viewDidLoad() {
        guard let waterCut = waterCut else { return }
        view?.showWaterCutDetails(
            description: waterCut.Aciklama,
            district: waterCut.IlceAdi,
            date: waterCut.KesintiTarihi
        )
    }
}
