//
//  SelectedTabView.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation
import UIKit

public class SelectedTabView: UIView {
    
    //MARK: - Constructors
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        // TODO: Check this code here.
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 10))
        label.text = "TAB \(1)"
        label.sizeToFit()
        var width = label.intrinsicContentSize.width
        width = width + 40
        // 
        frame = CGRect(x: 20, y: 55, width: width, height: 5)
        backgroundColor = UIColor(red:0.65, green:0.58, blue:0.94, alpha:1)
    }
    
}
