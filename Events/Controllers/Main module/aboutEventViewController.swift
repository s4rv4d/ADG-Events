//
//  aboutEventViewController.swift
//  Events
//
//  Created by Devang Patel on 27/08/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit
import SafariServices

class aboutEventViewController: UIViewController, SFSafariViewControllerDelegate {
    
    //MARK: - Variables
    var speaker1:Speaker!
    var speaker2:Speaker!
    var flag:Int!
    
    //MARK: - IBOutlets
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var gtView: UIView!
    @IBOutlet weak var likView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDetailView: UITextView!
    @IBOutlet weak var dkView: UIVisualEffectView!
    
    @IBOutlet weak var sarvadView: UIImageView!
    @IBOutlet weak var tusharView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK: - FUnctions
    func setupView() {
        self.dkView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        //set up data
        speaker1 = Speaker(name: "Sarvad Shetty",
                           details: "Sarvad Shetty,skilled in full stack iOS development, worked on election app and very well known Tap VIT app for iOS, apart also had campus interaction for iOS. Join us for the workshop and develop your skills on iOS platform.",
                           githubUrl: URL(string: "https://github.com/s4rv4d"),
                           linkedInUrl: URL(string: "https://www.linkedin.com/in/sarvad-shetty-532167156/"))
        speaker2 = Speaker(name: "Tushar Singh",
                           details: "Apple Developers Group is bringing you the most anticipated event of 2K19, iOS Fusion 5.0 with its impeccable speaker Tushar Singh, skilled in deep learning, full stack iOS development (Node.js), Information security, worked on the election app for Tamil Nadu govt, also was a speaker at BMS Ramaiya College.",
                           githubUrl: URL(string: "https://github.com/tushar1210"),
                           linkedInUrl: URL(string: "https://www.linkedin.com/in/tushar1210/"))
        
        tapGesture()
    }
    
    func tapGesture() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.sarvadViewTapped))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.tushViewTapped))
        
        sarvadView.addGestureRecognizer(tapGesture1)
        sarvadView.isUserInteractionEnabled = true
        
        tusharView.addGestureRecognizer(tapGesture2)
        tusharView.isUserInteractionEnabled = true
    }
    
    @objc func sarvadViewTapped() {
        self.dkView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        
        flag = 0
        
        detailsView.layer.cornerRadius = 10
        detailsView.layer.masksToBounds = true
        gtView.layer.cornerRadius = 10
        gtView.layer.masksToBounds = true
        likView.layer.cornerRadius = 10
        likView.layer.masksToBounds = true
        
        dkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.removeDarkView(view:))))
        dkView.isUserInteractionEnabled = true
        
        gtView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.githubTapped)))
        gtView.isUserInteractionEnabled = true
        
        likView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.linkedTapped)))
        likView.isUserInteractionEnabled = true
        
        nameLabel.text = speaker1.name
        nameDetailView.text = speaker1.details
    }
    
    @objc func tushViewTapped() {
        self.dkView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        
        flag = 1
        
        detailsView.layer.cornerRadius = 10
        detailsView.layer.masksToBounds = true
        gtView.layer.cornerRadius = 10
        gtView.layer.masksToBounds = true
        likView.layer.cornerRadius = 10
        likView.layer.masksToBounds = true
        
        dkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.removeDarkView(view:))))
        dkView.isUserInteractionEnabled = true
        
        gtView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.githubTapped)))
        gtView.isUserInteractionEnabled = true
        
        likView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.linkedTapped)))
        likView.isUserInteractionEnabled = true
        
        nameLabel.text = speaker2.name
        nameDetailView.text = speaker2.details
    }
    
    @objc func removeDarkView(view:UIView){
        self.dkView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func githubTapped() {
        
        if flag == 0 {
            let svc = SFSafariViewController(url: speaker1.githubUrl)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
        } else {
            let svc = SFSafariViewController(url: speaker2.githubUrl)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    @objc func linkedTapped() {
        if flag == 0 {
            let svc = SFSafariViewController(url: speaker1.linkedInUrl)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
        } else {
            let svc = SFSafariViewController(url: speaker2.linkedInUrl)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
        }
    }

}
