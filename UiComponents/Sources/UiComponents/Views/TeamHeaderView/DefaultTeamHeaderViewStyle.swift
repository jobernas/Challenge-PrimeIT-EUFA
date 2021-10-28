//
//  DefaultTeamHeaderViewStyle.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

public struct DefaultTeamHeaderViewStyle: TeamHeaderViewStyleProtocol {
    public let headerTitleStyle: LabelStyle = LabelStyle()
    public let headerFootNoteInfoStyle: LabelStyle = LabelStyle()
    public let headerFootNoteRoundStyle: LabelStyle = LabelStyle()
    public let headerTeamLogoStyle: ImageStyle = ImageStyle()
    
    public init() {
        
    }
}
