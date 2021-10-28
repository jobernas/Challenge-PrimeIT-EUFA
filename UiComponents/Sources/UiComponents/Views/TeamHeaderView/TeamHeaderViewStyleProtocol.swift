//
//  TeamHeaderViewStyleProtocol.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

public protocol TeamHeaderViewStyleProtocol {
    //MARK: - Styles
    var headerTitleStyle: LabelStyle { get }
    var headerFootNoteInfoStyle: LabelStyle { get }
    var headerFootNoteRoundStyle: LabelStyle { get }
    var headerTeamLogoStyle: ImageStyle { get }
}
