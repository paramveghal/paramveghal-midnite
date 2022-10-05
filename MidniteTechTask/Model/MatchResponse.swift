//
//  MatchResponse.swift
//  MidniteTechTask
//
//  Created by Matt Beaney on 23/03/2022.
//

import Foundation

struct MatchResponse: Codable {
	let data: [Match]?
    let market_layouts: [MarketLayout]?
}

struct MarketLayout: Codable {
    let id: Int
    let markets: [Market]
}

struct Match: Codable {
	let id: Int
	let name: String
		
	let home_team: String
	let away_team: String
	
	let markets: [Market]?
}

struct Market: Codable {
	let id: Int
	let name: String
	let contracts: [Contract]
}

struct Contract: Codable {
	let id: Int
	let name: String
	let price: String
}
