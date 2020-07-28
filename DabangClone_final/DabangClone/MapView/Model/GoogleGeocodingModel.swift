////
////  GoogleGeocodingModel.swift
////  DabangClone
////
////  Created by 정의석 on 2020/04/25.
////  Copyright © 2020 pandaman. All rights reserved.
////
import Foundation

// MARK: - Geocode
struct Geocode: Codable {
    let results: [GeoResult]
    let status: String

}

// MARK: - Result
struct GeoResult: Codable {
    let addressComponents: [AddressComponent]
    let formattedAddress: String
    let geometry: Geometry
    let placeid: String
    let plusCode: PlusCode
    let types: [String]

    enum CodingKeys: String, CodingKey {
        case addressComponents = "address_components"
        case formattedAddress = "formatted_address"
        case geometry
        case placeid = "place_id"
        case plusCode = "plus_code"
        case types
    }
}

// MARK: - AddressComponent
struct AddressComponent: Codable {
    let longName, shortName: String
    let types: [String]

    enum CodingKeys: String, CodingKey {
        case longName = "long_name"
        case shortName = "short_name"
        case types
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let location: Location
    let locationType: String
    let viewport: Viewport

    enum CodingKeys: String, CodingKey {
        case location
        case locationType = "location_type"
        case viewport
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
}

// MARK: - Viewport
struct Viewport: Codable {
    let northeast, southwest: Location
}

// MARK: - PlusCode
struct PlusCode: Codable {
    let compoundCode, globalCode: String

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

typealias GeocodingResult = Result
