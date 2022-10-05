//
//  HomeViewModel.swift
//  MidniteTechTask
//
//  Created by Param Veghal on 28/09/2022.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    typealias completionHandler = ([Any?]) -> ()
    var apiManager = ApiManager()
    var matchesDataSource = [Match]()
    
    
    // MARK: - Functions
    
    func networkCallToFetchMatches(completionHandler: @escaping completionHandler) {
        apiManager.fetchFeatures { [weak self]
            (featureResults) in
            self?.matchesDataSource = featureResults
            completionHandler(featureResults)
        }
    }
    
    var numberOfRows: Int {
        matchesDataSource.count
    }
}
