//
//  WaterCutListPresenter.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import Foundation

protocol WaterCutListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectWaterCut(_ waterCut: WaterCut)
}

protocol WaterCutListViewProtocol: AnyObject {
    func showWaterCuts(_ waterCuts: [WaterCut])
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}

class WaterCutListPresenter: WaterCutListPresenterProtocol {
    weak var view: WaterCutListViewProtocol?
    var interactor: WaterCutListInteractorProtocol?
    var router: WaterCutListRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchWaterCuts()
    }
    
    func didSelectWaterCut(_ waterCut: WaterCut) {
        router?.navigateToWaterCutDetail(for: waterCut)
    }
}

extension WaterCutListPresenter: WaterCutListInteractorOutputProtocol {
    func waterCutsFetched(_ waterCuts: [WaterCut]) {
        view?.hideLoading()
        view?.showWaterCuts(waterCuts)
    }
    
    func waterCutsFetchFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
