//
//  TeamHeaderView.swift
//  
//
//  Created by João Luís on 27/10/2021.
//

import Foundation
import UIKit

public class TeamHeaderView: UIView {
    
    //MARK: - Subviews
    public let teamNameLabel: UILabel = UILabel()
    public let teamInfoNoteLabel: UILabel = UILabel()
    public let teamRoundLabel: UILabel = UILabel()
    public let teamLogoImageView: UIImageView = UIImageView()
    
    //MARK: - Constructors
    public init(frame: CGRect, teamHeaderStyleProtocol: TeamHeaderViewStyleProtocol = DefaultTeamHeaderViewStyle()) {
        super.init(frame: frame)
        setupViews(teamHeaderStyleProtocol: teamHeaderStyleProtocol)
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews(teamHeaderStyleProtocol: DefaultTeamHeaderViewStyle())
    }
    
    // MARK: - Public methods
    public func setImage(_ image: UIImage) {
        teamLogoImageView.image = image
    }
    
    public func setTitle(_ title: String) {
        teamNameLabel.text = title
    }
    
    public func setRound(_ round: Int) {
        // TODO: Move this static string to a localized strings
        teamRoundLabel.text = String(format: "Round of %d", round)
    }
    
    // MARK: - Private methods
    private func setupViews(teamHeaderStyleProtocol: TeamHeaderViewStyleProtocol) {
        addSubview(teamNameLabel)
        addSubview(teamInfoNoteLabel)
        addSubview(teamRoundLabel)
        addSubview(teamLogoImageView)
        
        autoresizesSubviews = true
        
        // Apply Styles
        teamNameLabel.setStyle(teamHeaderStyleProtocol.headerTitleStyle)
        teamInfoNoteLabel.setStyle(teamHeaderStyleProtocol.headerFootNoteInfoStyle)
        teamRoundLabel.setStyle(teamHeaderStyleProtocol.headerFootNoteRoundStyle)
        
        // Apply Constant Values
        teamInfoNoteLabel.text = "Playing"
        
        // Add constraints
        let teamInfoNoteLabelTrailing = NSLayoutConstraint(item: teamInfoNoteLabel, attribute: .leading, relatedBy: .equal, toItem: teamLogoImageView, attribute: .leading, multiplier: 1, constant: 16)
        teamInfoNoteLabelTrailing.priority = 249.toLayoutPriority()

        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: teamNameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: teamNameLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: teamNameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: teamNameLabel, attribute: .bottom, relatedBy: .equal, toItem: teamInfoNoteLabel, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: teamInfoNoteLabel, attribute: .top, relatedBy: .equal, toItem: teamNameLabel, attribute: .bottom, multiplier: 1, constant: 72),
            NSLayoutConstraint(item: teamInfoNoteLabel, attribute: .leading, relatedBy: .equal, toItem: teamNameLabel, attribute: .leading, multiplier: 1, constant: 16),
            teamInfoNoteLabelTrailing,
            NSLayoutConstraint(item: teamInfoNoteLabel, attribute: .bottom, relatedBy: .equal, toItem: teamRoundLabel, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: teamRoundLabel, attribute: .leading, relatedBy: .equal, toItem: teamInfoNoteLabel, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: teamRoundLabel, attribute: .top, relatedBy: .equal, toItem: teamInfoNoteLabel, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: teamRoundLabel, attribute: .trailing, relatedBy: .equal, toItem: teamInfoNoteLabel, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: teamRoundLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 24),
//            NSLayoutConstraint(item: payButton, attribute: .bottom, relatedBy: .equal, toItem: loaderActivityIndicator, attribute: .top, multiplier: 1, constant: -16),
        ])
    }
    
    

    
}
