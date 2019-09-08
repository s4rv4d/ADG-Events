//
//  StartUpViewController.swift
//  Events
//
//  Created by Sarvad shetty on 9/7/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var logBarView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tapRecogniser()
    }
    
    //MARK: - Functions
    func tapRecogniser() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.logBarTapped))
        logBarView.addGestureRecognizer(tapGesture)
        logBarView.isUserInteractionEnabled = true
    }
    
    //MARK: - @objc functions
    @objc func logBarTapped() {
        print("LOG BAR TAPPED")
        
        guard let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "loginPageViewController") as? loginPageViewController else {
            fatalError("could'nt init login view controller")
        }
        self.present(vc, animated: true, completion: nil)
        
    }
}
