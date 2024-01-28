//
//  ViewController.swift
//  LiveScore
//
//  Created by Macbook on 1/19/24.
//

import UIKit

class ViewController: UIViewController, PopupViewActionDelegate {
    func addSubView(_ view: UIView) {
        self.vPopupSignin.addSubViewFullConstraint(sub: self.subViewPopup)
        self.subViewPopup.addSubView(view)
    }
    
    @IBOutlet weak var constraintTopPopupSignin: NSLayoutConstraint!
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var vPopupSignin: UIView!
    
    lazy var subViewPopup: PopupView = {
        let v = PopupView.instantiate()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.initPopup(parentView: self, delegate: self)
        return v
    }()
    
    lazy var subViewSignin: SigninView = {
        let v = SigninView.instantiate()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

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
        self.addPopupSignup()
    }
    
    func addPopupSignup(){
        self.addSubView(self.subViewSignin)
        UIView.animate(withDuration: 0.3) {
            self.constraintTopPopupSignin.constant = -self.view.frame.height
        } completion: { _ in
            self.view.layoutIfNeeded()
        }

    }
}

extension UIView {
    
    func addSubViewFullConstraint(sub: UIView){
        self.addSubview(sub)
        NSLayoutConstraint.activate([
            sub.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            sub.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            sub.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            sub.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        self.layoutIfNeeded()
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    /// Load UIView from Nib
    /// - Parameter autolayout: Flag set translatesAutoresizingMaskIntoConstraints = !autoLayout
    /// - Returns: UIView
    static func instantiate(autolayout: Bool = true) -> Self {
        // generic helper function
        func instantiateUsingNib<T: UIView>(autolayout: Bool) -> T {
            let view = self.nib.instantiate() as! T
            view.translatesAutoresizingMaskIntoConstraints = !autolayout
            return view
        }
        return instantiateUsingNib(autolayout: autolayout)
    }
}
extension UINib {
    func instantiate() -> Any? {
        return self.instantiate(withOwner: nil, options: nil).first
    }
}
