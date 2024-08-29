//
//  WaterCut.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//

import Foundation

struct WaterCut: Codable, Hashable {
    let KesintiTarihi, Aciklama, IlceAdi: String
    let MahalleID: [Int]
    let Mahalleler, Tip, ArizaGiderilmeTarihi: String
    let IlceID: Int
    let Birim: String
    let ArizaID: Int
    let ArizaDurumu, GuncellemeTarihi: String
    let ArizaTipID: Int
    let KayitTarihi, KesintiSuresi, Ongoru: String
}
