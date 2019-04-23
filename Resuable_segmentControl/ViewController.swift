//
//  ViewController.swift
//  Resuable_segmentControl
//
//  Created by Chad-Michael Muirhead on 4/22/19.
//  Copyright © 2019 Chad-Michael Muirhead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func customSegment(_ sender: RoundedSegmentControl) {
        print(sender.selectedSegmentIndex)
    }
}

