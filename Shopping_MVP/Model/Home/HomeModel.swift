//
//  HomeModel.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/2/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
// MARK: - HomeModel
struct HomeModel: Codable {
    let status: Bool?
    let message: JSONNull?
    let data: HomeModelDataClass?
}

// MARK: - DataClass
struct HomeModelDataClass: Codable {
    let currentPage: Int?
    let data: [Datum]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let nextPageURL: JSONNull?
    let path: String?
    let perPage: Int?
    let prevPageURL: JSONNull?
    let to, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name: String?
    let image: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
