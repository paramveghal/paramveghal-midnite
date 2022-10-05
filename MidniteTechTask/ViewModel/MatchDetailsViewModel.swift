//
//  MatchDetailsViewModel.swift
//  MidniteTechTask
//
//  Created by Param Veghal on 28/09/2022.
//

import Foundation
import UIKit

class MatchDetailsViewModel {
    
    // MARK: - Properties
    
    typealias completionHandler = ([MarketLayout]) -> ()
    var marketDataSource = [MarketLayout]()
    var apiManager = ApiManager()
    
    
    // MARK: - Functions
    
    func networkCallToFetchMatchDetails(using id: Int, completionHandler: @escaping completionHandler) {
        
        apiManager.fetchMatch(with: id) { [weak self]
            (matchResults) in
            self?.marketDataSource = matchResults
            completionHandler(matchResults)
        }
    }
    
    func createDisplayModel(data: [MarketLayout]) -> MatchDetailsDisplayModel {
        let markets = data.first?.markets.filter { $0.contracts.count == 2 }
        let contracts = markets?.first?.contracts
        
        let away = contracts?.first
        let home = contracts?.last
        
        return MatchDetailsDisplayModel(awayLabelName: away?.name ?? "",
                                        homeLabelName: home?.name ?? "",
                                        awayButtonPricing: away?.price ?? "",
                                        homeButtonPricing: home?.price ?? "")
    }
}


struct MatchDetailsDisplayModel {
    
    let awayLabelName: String
    let homeLabelName: String
    let awayButtonPricing: String
    let homeButtonPricing: String
}
