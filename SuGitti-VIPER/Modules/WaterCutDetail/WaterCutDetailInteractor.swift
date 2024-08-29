//
//  WaterCutDetailInteractor.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import Foundation

protocol WaterCutDetailInteractorProtocol: AnyObject {
    // Add methods if needed for fetching additional details
}

protocol WaterCutDetailInteractorOutputProtocol: AnyObject {
    // Add methods if needed for receiving additional details
}

class WaterCutDetailInteractor: WaterCutDetailInteractorProtocol {
    weak var output: WaterCutDetailInteractorOutputProtocol?
    
    // Implement any methods needed for fetching additional water cut details
}
