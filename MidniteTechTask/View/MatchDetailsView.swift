//
//  MatchDetailsView.swift
//  MidniteTechTask
//
//  Created by Param Veghal on 28/09/2022.
//

import Foundation
import UIKit

final class MatchDetailsView: UIView {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet private var matchDetailsView: UIView!
    @IBOutlet private var awayLabel: UILabel!
    @IBOutlet private var homeLabel: UILabel!
    @IBOutlet private var awayButton: UIButton!
    @IBOutlet private var homeButton: UIButton!
    
    
    // MARK: - Properties
    
    private var displayModel: MatchDetailsDisplayModel?
    
    
    // MARK: - Initialization
    
    init(displayModel: MatchDetailsDisplayModel) {
        self.displayModel = displayModel
        super.init(frame: .zero)
        instanceFromNib()
        setupFields()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Functions
    
    private func instanceFromNib() {
        matchDetailsView = loadViewFromNib()
        matchDetailsView.frame = bounds
        matchDetailsView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(matchDetailsView)
    }

    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupFields() {
        
        if let displayModel = displayModel {
            self.awayLabel.text = displayModel.awayLabelName.uppercased()
            self.homeLabel.text = displayModel.homeLabelName.uppercased()
            self.awayButton.setTitle(displayModel.awayLabelName.uppercased() + " = " + displayModel.awayButtonPricing.uppercased(), for: .normal)
            self.homeButton.setTitle(displayModel.homeLabelName.uppercased() + " = " + displayModel.homeButtonPricing.uppercased(), for: .normal)
        }
        

    }
}
