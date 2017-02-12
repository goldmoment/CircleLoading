//
//  ViewController.swift
//  CircleLoading
//
//  Created by goldmoment on 02/11/2017.
//  Copyright (c) 2017 goldmoment. All rights reserved.
//

import UIKit
import CircleLoading

class ViewController: UIViewController {

    @IBOutlet weak var circleLoading: CircleLoading!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start animtion
        circleLoading.start()
        
        // Pause animation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.circleLoading.pause()
        }
        
        // Resume animation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            self.circleLoading.resume()
        }
        
        // Stop animation and hide layers
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 9) {
            self.circleLoading.stop()
        }
        
        // Start animation again
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 12) {
            self.circleLoading.start()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

