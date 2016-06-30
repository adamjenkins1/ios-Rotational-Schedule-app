//
//  scheduleMonth.swift
//  rotationalschedule
//
//  Created by Adam Jenkins on 6/28/16.
//  Copyright © 2016 Adam Jenkins. All rights reserved.
//

import UIKit

class scheduleMonth: UIViewController {
    @IBOutlet weak var monthImage: UIImageView!
    @IBOutlet weak var messageText: UILabel!
    
    var currentMonthInt = 0
    var calendar = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
    var months :[Int:String] = [
        1: "january_nobg",
        2: "feburary_nobg",
        3: "march_nobg",
        4: "april_nobg",
        5: "may_nobg",
        8: "august_nobg",
        9: "september_nobg",
        10: "october_nobg",
        11: "november_nobg",
        12: "december_nobg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageText.text = ""
        currentMonthInt = (calendar?.component(NSCalendarUnit.Month, fromDate: NSDate()))!
        
        if currentMonthInt == 6 || currentMonthInt == 7 {
            messageText.text = "Enjoy your break!\n School will resume in August"
            monthImage.image = UIImage(named: "freedom")
        }
        else {
            monthImage.image = UIImage(named: months[currentMonthInt]!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(sender: AnyObject) {
        currentMonthInt += 1
        if currentMonthInt > 12 {
            currentMonthInt = 1
        }
        while months[currentMonthInt] == nil {
            currentMonthInt += 1
        }
        messageText.text = ""
        monthImage.image = UIImage(named: months[currentMonthInt]!)
    }
    
    @IBAction func prev(sender: AnyObject) {
        currentMonthInt -= 1
        if currentMonthInt < 1 {
            currentMonthInt = 12
        }
        while months[currentMonthInt] == nil {
            currentMonthInt -= 1
        }
        messageText.text = ""
        monthImage.image = UIImage(named: months[currentMonthInt]!)
    }
    
    @IBAction func `return`(sender: AnyObject) {
        self.performSegueWithIdentifier("returnFromMonth", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
