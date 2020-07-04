//
//  RegisterModel.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/1/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation

// MARK: - RegisterModel
struct RegisterModel: Codable {
    let status: Bool?
    let message: String?
    let data: RegisterModelDataClass?
}

// MARK: - DataClass
struct RegisterModelDataClass: Codable {
    let name, phone, email: String?
    let id: Int?
    let image: String?
    let token: String?
}
