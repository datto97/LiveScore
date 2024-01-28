//
//  PopupView.swift
//  LiveScore
//
//  Created by Macbook on 1/20/24.
//

import Foundation
import UIKit

protocol PopupViewActionDelegate: AnyObject{
    func addSubView(_ view: UIView)
}

protocol PopupViewDelegate: AnyObject{
    func initPopup(parentView: UIViewController, delegate: PopupViewActionDelegate)
    func addSubView(_ view: UIView)
    func hidePopup()
    func showPopup()
}

class PopupView: UIView, PopupViewDelegate{
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var constraintHeightVChild: NSLayoutConstraint!
    @IBOutlet weak var vTop: UIView!
    @IBOutlet weak var vChild: UIView!
    @IBOutlet weak var vIndicator: UIView!
    
    weak var delegate: PopupViewActionDelegate?
    
    weak var parent: UIViewController?
    
    override func awakeFromNib() {
        self.setupUI()
    }
    
    func setupUI(){
        self.vContainer.layer.masksToBounds = true
        self.vContainer.layer.cornerRadius = 42
        self.vContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.vIndicator.layer.masksToBounds = true
        self.vIndicator.layer.cornerRadius = 3
    }
    
    func initPopup(parentView: UIViewController, delegate: PopupViewActionDelegate){
        self.parent = parentView
        self.delegate = delegate
    }
    
    func addSubView(_ view: UIView) {
        view.layoutIfNeeded()
        self.constraintHeightVChild.constant = view.frame.height
       self.vChild.addSubViewFullConstraint(sub: view)
    }
    
    func hidePopup() {
        
    }
    
    func showPopup() {
        
    }
    
}
