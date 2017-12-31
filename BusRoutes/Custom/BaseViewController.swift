//
//  BaseViewController.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    class var nibName: String? {
        get {
            return String(describing: self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: type(of: self).nibName, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Display a generic alert with some message
    func displayAlert(message: String) {
        let alertViewController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertViewController.dismiss(animated: true, completion: nil)
        }
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }
}
