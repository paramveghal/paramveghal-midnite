//
//  MatchDetailsViewController.swift
//  MidniteTechTask
//
//  Created by Param Veghal on 28/09/2022.
//

import Foundation
import UIKit

final class MatchDetailsViewController: UIViewController {
    
    // MARK: - Properties
        
    private var viewModel = MatchDetailsViewModel()
    private var displayModel: MatchDetailsDisplayModel?


    // MARK: - IBOutlets
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var matchName: UILabel!
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets up subView
        let view = MatchDetailsView(displayModel: displayModel!)
        view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
        ])
        
        setupScreenTitle()
    }


    // MARK: - Functions

    private func setupScreenTitle() {
        if let displayModel = displayModel {
            matchName.text = "\(displayModel.awayLabelName.uppercased()) vs \(displayModel.homeLabelName.uppercased())"
        }
    }
    
    func configure(matchDetails: [MarketLayout]) {
        self.displayModel = viewModel.createDisplayModel(data: matchDetails)
    }
}

