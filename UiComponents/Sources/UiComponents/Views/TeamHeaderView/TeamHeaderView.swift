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

    public convenience init(teamHeaderStyleProtocol: TeamHeaderViewStyleProtocol = DefaultTeamHeaderViewStyle()) {
        self.init(frame: CGRect.zero)
        setupViews(teamHeaderStyleProtocol: teamHeaderStyleProtocol)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews(teamHeaderStyleProtocol: DefaultTeamHeaderViewStyle())
    }
    
    // MARK: - Public methods
    public func setImage(_ image: UIImage?) {
        teamLogoImageView.image = image
    }
    
    public func setTitle(_ title: String) {
        teamNameLabel.text = title
    }
    
    public func setRound(_ round: Int) {
        // TODO: Move this static string to a localized strings
        teamRoundLabel.text = String(format: "Round of %d", round)
    }
    
    public func setBackgroundImage(_ image: UIImage?) {
        guard let imageNotNil = image else {
            return
        }
        backgroundColor = UIColor(patternImage: imageNotNil)
    }
    
    // MARK: - Private methods
    private func setupViews(teamHeaderStyleProtocol: TeamHeaderViewStyleProtocol) {
        // we're using auto-layout
        teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        teamInfoNoteLabel.translatesAutoresizingMaskIntoConstraints = false
        teamRoundLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
//        let teamInfoNoteLabelTrailing =
//        teamInfoNoteLabelTrailing.isActive = true
//        teamInfoNoteLabelTrailing.priority = 249.toLayoutPriority()
        
        teamNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        teamNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        teamNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        teamInfoNoteLabel.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 72).isActive = true
        teamInfoNoteLabel.leadingAnchor.constraint(equalTo: teamNameLabel.leadingAnchor).isActive = true
        teamInfoNoteLabel.trailingAnchor.constraint(equalTo: teamLogoImageView.leadingAnchor, constant: -16).isActive = true
        teamLogoImageView.trailingAnchor.constraint(equalTo: teamNameLabel.trailingAnchor).isActive = true
        teamLogoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        teamRoundLabel.topAnchor.constraint(equalTo: teamInfoNoteLabel.bottomAnchor).isActive = true
        teamRoundLabel.leadingAnchor.constraint(equalTo: teamInfoNoteLabel.leadingAnchor).isActive = true
        teamRoundLabel.trailingAnchor.constraint(equalTo: teamInfoNoteLabel.trailingAnchor).isActive = true
        teamRoundLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
        updateConstraintsIfNeeded()
    }
    
    

    
}
