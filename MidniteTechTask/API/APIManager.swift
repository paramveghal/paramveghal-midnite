//
//  APIManager.swift
//  MidniteTechTask
//
//  Created by Param Veghal on 28/09/2022.
//

import Foundation

class ApiManager {
    
    // MARK: - Constants
    
    // Constant to hold apiURL
    private enum Constants {
        static let loadAllURL = "https://api.midnite.com/v0/matches/upcoming"
    }
    
    // MARK: - Properties

    
    typealias matchCompletionBlock = ([Match]) -> ()
    typealias marketCompletionBlock = ([MarketLayout]) -> ()
    
    // MARK: - Methods
    
    func fetchFeatures(completionBlock: @escaping matchCompletionBlock) {
        URLSession.shared.dataTask(with: URL(string: Constants.loadAllURL)!) { data, response, error in
            let response = try! JSONDecoder().decode(MatchResponse.self, from: data!)
            completionBlock(response.data ?? [Match]())
        }.resume()
    }
    
    func fetchMatch(with id: Int, completionBlock: @escaping marketCompletionBlock) {
        URLSession.shared.dataTask(with: URL(string: "https://api.midnite.com/v1/matches/\(id)")!) { data, response, error in
            let response = try! JSONDecoder().decode(MatchResponse.self, from: data!)
            
            completionBlock(response.market_layouts ?? [MarketLayout]())
 
        }.resume()
    }
}
