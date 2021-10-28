//
//  ViewController.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 27/10/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var uclVersionButton: UIButton!
    @IBOutlet weak var uelVersionButton: UIButton!
    
    //MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.title = "Main"
        uclVersionButton?.addTarget(self, action: #selector(navigateToUCLVersion(_:)), for: .touchUpInside)
        uelVersionButton?.addTarget(self, action: #selector(navigateToUELVersion(_:)), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func navigateToUCLVersion(_ sender: UIButton) {
        debugPrint("called UCL Version")
        let uclTheme = Theme(appBackgroundColor: <#T##UIColor#>, appTabsBackgroundColor: <#T##UIColor#>, appBackgroundHeaderImage: <#T##UIImage#>)
        navigationController?.pushViewController(TeamViewController.newInstance(theme: uclTheme), animated: true)
    }
    
    @objc func navigateToUELVersion(_ sender: UIButton) {
        debugPrint("called UEL Version")
        let uelTheme = Theme()
        navigationController?.pushViewController(TeamViewController.newInstance(theme: uelTheme), animated: true)
    }
}

