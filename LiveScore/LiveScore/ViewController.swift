//
//  ViewController.swift
//  LiveScore
//
//  Created by Macbook on 1/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI(){
        self.btnSignin.layer.masksToBounds = true
        self.btnSignin.layer.cornerRadius = 16
    }

    @IBAction func actionSignin(_ sender: Any) {
        
    }
    
    @IBAction func actionSignup(_ sender: Any) {
        
    }
}

