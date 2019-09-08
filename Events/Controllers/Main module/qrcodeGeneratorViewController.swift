//
//  qrcodeGeneratorViewController.swift
//  Events
//
//  Created by Sarvad shetty on 9/8/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

class qrcodeGeneratorViewController: UIViewController {
    
    //MARK: - Variables
    var regNo:String!
    
    //MARK: - IBOutlet
    @IBOutlet weak var imgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgView.image = generateQRCode(from: regNo)
    }
    
    //MARK: - Function
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    //MARK: - IBAction
    @IBAction func goBackTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
