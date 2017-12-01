//
//  ViewController.swift
//  ActivitySpinner
//
//  Created by Mark Wilkinson on 11/30/17.
//  Copyright © 2017 Mark Wilkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityIndicator: ActivitySpinnerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicator = Bundle.main.loadNibNamed("ActivitySpinnerView", owner: self, options: nil)?.first as? ActivitySpinnerView
        let size = self.view.frame.size
        activityIndicator?.center = CGPoint(x: size.width/2, y: size.height/2)
        self.view.addSubview(activityIndicator!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

