//
//  profileViewController.swift
//  Events
//
//  Created by Devang Patel on 26/08/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    //MARK: - Variables
    var darkView:UIView!
    
    //MARK:- Outlets
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var regnumber: UILabel!
    @IBOutlet weak var adgView: UIView!
    @IBOutlet weak var dkView: UIVisualEffectView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var infoView: UIImageView!
    @IBOutlet weak var profileImageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupShadow()
        setupView()
        setupTapGestureRecog()
    }
    
    // Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Functions
    func setupTapGestureRecog() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        let infoTap = UITapGestureRecognizer(target: self, action: #selector(self.goToInfo))
        adgView.addGestureRecognizer(tapGesture)
        adgView.isUserInteractionEnabled = true
        
        infoView.addGestureRecognizer(infoTap)
        infoView.isUserInteractionEnabled = true
    }
    
    func setupShadow(){
        adgView.layer.shadowColor = UIColor.black.cgColor
        adgView.layer.shadowOpacity = 0.2
        adgView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        adgView.layer.shadowRadius = 2
        adgView.layer.shouldRasterize = true
        adgView.layer.rasterizationScale = UIScreen.main.scale
        adgView.layer.cornerRadius = 10
        adgView.layer.masksToBounds = false
    }
    
    func setupView() {
        let name = UserDefaults.standard.string(forKey: "name")
        let regNo = UserDefaults.standard.string(forKey: "regnumber")
        
        Name.text = name
        regnumber.text = regNo
        
        self.profileImageview.layer.cornerRadius = self.profileImageview.frame.width / 4
        self.profileImageview.layer.masksToBounds = true
        self.dkView.isHidden = true
    }
    
    //MARK: - @objc functions
    @objc func viewTapped() {
        print("adgView tapped")
        dkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.removeDarkView(view:))))
        dkView.isUserInteractionEnabled = true
        
        detailView.layer.cornerRadius = 10
        detailView.layer.masksToBounds = true
        
        self.dkView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func removeDarkView(view:UIView){
        self.dkView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func goToInfo() {
        guard let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "infoViewController") as? infoViewController else {
            fatalError("could'nt init infoViewController")
        }
        self.present(vc, animated: true, completion: nil)
    }
    

}
