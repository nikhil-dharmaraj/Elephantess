//
//  FirstViewController.swift
//  Elephantess
//
//  Created by Nikhil Dharmaraj on 3/24/18.
//  Copyright © 2018 Nikhil Dharmaraj. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var head: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var backleg: UIButton!    
    @IBOutlet var mid: UIButton!
    @IBOutlet var backtop: UIButton!
    @IBOutlet var frontleg: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("reached")
        let dest = segue.destination as! PopoverViewController
        if ((sender as! UIButton) == head)
        {
            dest.part = 0
        }
        else if ((sender as! UIButton) == frontleg)
        {
            dest.part = 1
        }
        else if ((sender as! UIButton) == mid)
        {
            dest.part = 2
        }
        else if ((sender as! UIButton) == backtop)
        {
            dest.part = 3
        }
        else if ((sender as! UIButton) == backleg)
        {
            dest.part = 4
        }
    }
    
}

