//
//  ViewController.swift
//  rotationalschedule
//
//  Created by Adam Jenkins on 6/29/16.
//  Copyright © 2016 Adam Jenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = NSDate()//NSDateComponents()
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        formatter.timeStyle = .MediumStyle
        
        let dateString = formatter.stringFromDate(currentDate)
        /*
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        let timeFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        timeFormatter.timeStyle = .MediumStyle
        
        let dateOnly = dateFormatter.stringFromDate(currentDate)
        let curTime = timeFormatter.stringFromDate(currentDate)
        
        let curDate = dateOnly.characters.dropLast(6)
        */
        currentDateLabel.text = "Today is \(String(dateString))"
        
        //currentDateLabel.text = String(currentDate)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func scheduleDayButton(sender: AnyObject) {
        //print("Today's schedule button pressed")
        self.performSegueWithIdentifier("daySegway", sender: nil)
    }
    
    @IBAction func scheduleMonthButton(sender: AnyObject) {
        //print("Monthly schedule button pressed")
        self.performSegueWithIdentifier("monthSegway", sender: nil)
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
     //   self.performSegueWithIdentifier("returnToMain", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

