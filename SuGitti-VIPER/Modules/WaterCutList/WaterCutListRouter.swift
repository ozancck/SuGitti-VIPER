//
//  WaterCutListRouter.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import UIKit

protocol WaterCutListRouterProtocol: AnyObject {
    func navigateToWaterCutDetail(for waterCut: WaterCut)
}

class WaterCutListRouter: WaterCutListRouterProtocol {
    weak var viewController: UIViewController?
    
    func navigateToWaterCutDetail(for waterCut: WaterCut) {
        let detailVC = WaterCutDetailViewController()
        let presenter = WaterCutDetailPresenter()
        let interactor = WaterCutDetailInteractor()
        let router = WaterCutDetailRouter()
        
        detailVC.presenter = presenter
        presenter.view = detailVC
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter as? any WaterCutDetailInteractorOutputProtocol
        router.viewController = detailVC
        
        presenter.waterCut = waterCut
        
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
