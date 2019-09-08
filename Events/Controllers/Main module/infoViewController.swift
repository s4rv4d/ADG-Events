//
//  infoViewController.swift
//  Events
//
//  Created by Sarvad shetty on 9/8/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBAction
    @IBAction func goBackTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
