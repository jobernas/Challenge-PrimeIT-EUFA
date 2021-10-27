//
//  File.swift
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
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Private methods
    private func setupViews() {
        addSubview(teamNameLabel)
        addSubview(teamInfoNoteLabel)
        addSubview(teamRoundLabel)
        addSubview(teamLogoImageView)
    }
}
