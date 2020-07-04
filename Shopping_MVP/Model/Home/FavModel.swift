//
//  FavModel.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
struct FavModel: Codable {
    let status: Bool?
    let message: String?
    let data: FavModelDataClass?
}

// MARK: - DataClass
struct FavModelDataClass: Codable {
    let id: Int?
    let product: FavProduct?
}

// MARK: - Product
struct FavProduct: Codable {
    let id: Int?
    let price, oldPrice: Double?
    let discount: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}
