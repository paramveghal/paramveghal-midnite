//
//  ViewController.swift
//  MidniteTechTask
//
//  Created by Matt Beaney on 23/03/2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Constants
    
    private enum Constatants {
        static let nibID = "matchDetailsViewController"
        static let storyboardName = "Main"
    }
    
    
    // MARK: - IBOutlet

	@IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Properties
    
    private var viewModel = HomeViewModel()
    private var matchDetailsviewModel = MatchDetailsViewModel()
    
    private lazy var matchDetailsViewController = UIStoryboard(name: Constatants.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Constatants.nibID)
    
    
    // MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        viewModel.networkCallToFetchMatches { _ in
            DispatchQueue.main.async() {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Methods
    
    private func presentMatchDetailsViewController(matchDetails: [MarketLayout]) {
        
        DispatchQueue.main.async() {
            if let sheet = self.matchDetailsViewController.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
            }
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constatants.nibID) as? MatchDetailsViewController {
                vc.configure(matchDetails: matchDetails)
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    // MARK: - Delegate Methods
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.matchesDataSource[indexPath.row]
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "cell",
			for: indexPath
		)
		cell.textLabel?.text = "\(item.home_team) vs. \(item.away_team)"
		return cell
	}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.matchesDataSource[indexPath.row]
        
        matchDetailsviewModel.networkCallToFetchMatchDetails(using: item.id) { (matchDetails) in
            self.presentMatchDetailsViewController(matchDetails: matchDetails)
        }
    }
}
