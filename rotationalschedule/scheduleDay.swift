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
        let minDays :[Int:String] = [
            1: "start_with_1_min_nobg",
            2: "start_with_2_min_nobg",
            3: "start_with_3_min_nobg",
            4: "start_with_4_min_nobg",
            5: "start_with_5_min_nobg",
            6: "start_with_6_min_nobg"
        ]
        var curPeriod = 1
        for i in 10..<32 {
            if i != 13 && i != 14 && i != 21 && i != 22 && i != 27 && i != 28 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i == 17 {
                    dictionary["Aug " + String(i)] = collabDays[curPeriod]
                }
                else if i == 10 {
                    dictionary["Aug " + String(i)] = minDays[curPeriod]
                }
                else {
                    dictionary["Aug " + String(i)] = regularDays[curPeriod]
                }
                curPeriod += 1
            }
        }
        
        for i in 1..<31 {
            if i != 3 && i != 4 && i != 10 && i != 11 && i != 17
                && i != 18 && i != 24 && i != 25{
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i != 5 {
                    if i == 7 || i == 21 {
                        dictionary["Sep " + String(i)] = collabDays[curPeriod]
                    }
                    else {
                        dictionary["Sep " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
            }
        }
        
        for i in 3..<32 {
            if i != 8 && i != 9 && i != 15 && i != 16 && i != 22
                && i != 23 && i != 29 && i != 30{
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i != 7 && i != 10 {
                    if i == 5 || i == 19 {
                        dictionary["Oct " + String(i)] = collabDays[curPeriod]
                    }
                    else {
                        dictionary["Oct " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
                
            }
        }
        
        for i in 1..<31 {
            if i != 5 && i != 6 && i != 12 && i != 13 && i != 19
                && i != 20 && i != 26 && i != 27{
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i != 11 && i != 24 && i != 25 { // exclude holidays
                    if i == 2 || i == 16 {
                        dictionary["Nov " + String(i)] = collabDays[curPeriod]
                    }
                    else if i == 23 {
                        dictionary["Nov " + String(i)] = minDays[curPeriod]
                    }
                    else {
                        dictionary["Nov " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
            }
        }
        
        for i in 1..<14 {
            if i != 3 && i != 4 && i != 10 && i != 11 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i == 7 {
                    dictionary["Dec " + String(i)] = collabDays[curPeriod]
                }
                else {
                    dictionary["Dec " + String(i)] = regularDays[curPeriod]
                }
                curPeriod += 1
            }
        }
        // add finals days
        dictionary["Dec 14"] = "finals_day_1_nobg"
        dictionary["Dec 15"] = "finals_day_2_nobg"
        dictionary["Dec 16"] = "finals_day_3_nobg"
        
        curPeriod = 6
        for i in 3..<32 {
            if i != 7 && i != 8 && i != 14 && i != 15 && i != 21
                && i != 22 && i != 28 && i != 29{
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i != 16 { // exclude holidays
                    if i == 4 || i == 18 {
                        dictionary["Jan " + String(i)] = collabDays[curPeriod]
                    }
                    else {
                        dictionary["Jan " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
            }
        }
        
        for i in 1..<29 {
            if i != 4 && i != 5 && i != 11 && i != 12 && i != 18
                && i != 19 && i != 25 && i != 26 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i < 20 || i > 24 { // exclude holidays
                    if i == 1 || i == 15 {
                        dictionary["Feb " + String(i)] = collabDays[curPeriod]
                    }
                    else {
                        dictionary["Feb " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
            }
        }
        
        for i in 1..<32 {
            if i != 4 && i != 5 && i != 11 && i != 12 && i != 18 && i != 19
                && i != 25 && i != 26{
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i == 1 || i == 15 {
                    dictionary["Mar " + String(i)] = collabDays[curPeriod]
                }
                else {
                    dictionary["Mar " + String(i)] = regularDays[curPeriod]
                }
                curPeriod += 1
            }
        }
        
        for i in 3..<29 {
            if i != 8 && i != 9 && i != 15 && i != 16 && i != 22
                && i != 23 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i < 10 || i > 14 { // exclude holidays
                    if i == 5 || i == 19 {
                        dictionary["Apr " + String(i)] = collabDays[curPeriod]
                    }
                    else {
                        dictionary["Apr " + String(i)] = regularDays[curPeriod]
                    }
                }
                curPeriod += 1
            }
        }
        
        for i in 1..<24 {
            if i != 6 && i != 7 && i != 13 && i != 14 && i != 20 && i != 21 {
                if curPeriod >= 7 {
                    curPeriod = 1
                }
                if i == 3 {
                    dictionary["May " + String(i)] = collabDays[curPeriod]
                }
                else {
                    dictionary["May " + String(i)] = regularDays[curPeriod]
                }
                curPeriod += 1
            }
        }
        dictionary["May 24"] = "finals_day_1_nobg"
        dictionary["May 25"] = "finals_day_2_nobg"
        dictionary["May 26"] = "finals_day_3_nobg"
        
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
            messageText.text = "Tomorrow's Schedule"
        }
        else {
            messageText.text = "Today's Schedule"
        }
        
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
