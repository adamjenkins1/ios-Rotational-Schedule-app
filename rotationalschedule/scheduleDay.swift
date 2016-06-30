//
//  scheduleDay.swift
//  rotationalschedule
//
//  Created by Adam Jenkins on 6/28/16.
//  Copyright © 2016 Adam Jenkins. All rights reserved.
//

import UIKit

class scheduleDay: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var messageText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageText.text = ""
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        let timeFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        timeFormatter.timeStyle = .MediumStyle
        
        let dateOnly = dateFormatter.stringFromDate(currentDate)
        let curTime = timeFormatter.stringFromDate(currentDate)
        
        var curDate = String(dateOnly.characters.dropLast(6))
        
        // insert rest of days here
        var dictionary :[String:String] = [:]
        let regularDays :[Int:String] = [
            1: "start_with_1_nobg",
            2: "start_with_2_nobg",
            3: "start_with_3_nobg",
            4: "start_with_4_nobg",
            5: "start_with_5_nobg",
            6: "start_with_6_nobg"
        ]
        let collabDays :[Int:String] = [
            1: "start_with_1_collab_nobg",
            2: "start_with_2_collab_nobg",
            3: "start_with_3_collab_nobg",
            4: "start_with_4_collab_nobg",
            5: "start_with_5_collab_nobg",
            6: "start_with_6_collab_nobg"
        ]
        var curPeriod = 5
        for i in 2..<25 {
            if i != 7 && i != 8 && i != 14 && i != 15 && i != 21 && i != 22 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i == 4{
                    dictionary["May " + String(i)] = collabDays[curPeriod]
                }
                else {
                    dictionary["May " + String(i)] = regularDays[curPeriod]
                }
                curPeriod += 1
            }
        }
        let hour = Int(String(curTime.characters.dropLast(9)))
        let AMPM = String(curTime.characters.dropFirst(8))
        var curMonth = ""
        if curDate.characters.count == 6 {
            curMonth = String(curDate.characters.dropLast(2))
        }
        else {
            curMonth = String(curDate.characters.dropLast(1))
        }
        
        if hour >= 3 && hour != 12 && AMPM == "PM" {
            var day = Int(String(curDate.characters.dropFirst(4)))!
            day += 1
            if curDate == "Aug 31" {
                curMonth = "Sep "
                day = 1
            }
            else if curDate == "Sep 30" {
                curMonth = "Oct "
                day = 1
            }
            else if curDate == "Oct 31" {
                curMonth = "Nov "
                day = 1
            }
            else if curDate == "Nov 30" {
                curMonth = "Dec "
                day = 1
            }
            else if curDate == "Dec 31" {
                curMonth = "Jan "
                day = 1
            }
            else if curDate == "Jan 31" {
                curMonth = "Feb "
                day = 1
            }
            else if curDate == "Feb 28" {
                curMonth = "Mar "
                day = 1
            }
            else if curDate == "Mar 31" {
                curMonth = "Apr "
                day = 1
            }
            else if curDate == "Apr 30" {
                curMonth = "May "
                day = 1
            }
            else if curDate.characters.count == 6 {
                curMonth = String(curDate.characters.dropLast(2))
            }
            else {
                curMonth = String(curDate.characters.dropLast())
            }
            curDate = curMonth + String(day)
        }
        //curDate = "May 24"
        if dictionary[curDate] != nil {
            picture.image = UIImage(named: dictionary[curDate]!)
        }
        else {
            messageText.text = "No school today\n Enjoy your day off!"
            picture.image = UIImage(named: "freedom")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `return`(sender: AnyObject) {
        self.performSegueWithIdentifier("returnFromDay", sender: self)
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
