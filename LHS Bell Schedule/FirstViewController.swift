//
//  FirstViewController.swift
//  LHS Bell Schedule
//
//  Created by Nick Greenway on 10/26/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import UIKit
import iAd
import CoreData


class FirstViewController: UIViewController, ADBannerViewDelegate {
  
    @IBOutlet var AdBanner: ADBannerView?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let clock = Clock()
    var timer: NSTimer?
    let timeNumberformatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
        
        self.canDisplayBannerAds = true
        self.AdBanner?.delegate = self
        self.AdBanner?.hidden  = true
       
        let notification1 = UILocalNotification()
        notification1.alertBody = "1 Minute!"
        notification1.fireDate = NSDate(timeIntervalSince1970: 1447335240) // 8:34
        notification1.soundName = UILocalNotificationDefaultSoundName
        notification1.repeatCalendar = NSCalendar.currentCalendar()
        notification1.repeatInterval = .Weekday
        UIApplication.sharedApplication().scheduleLocalNotification(notification1)
        
        let notification2 = UILocalNotification()
        notification2.alertBody = "1 Minute"
        notification2.fireDate = NSDate(timeIntervalSince1970: 1447340940) // 10:09
        notification2.soundName = UILocalNotificationDefaultSoundName
        notification2.repeatCalendar = NSCalendar.currentCalendar()
        notification2.repeatInterval = .Weekday
        UIApplication.sharedApplication().scheduleLocalNotification(notification2)
        
        let notification3 = UILocalNotification()
        notification3.alertBody = "1 Minute"
        notification3.fireDate = NSDate(timeIntervalSince1970: 1447346640) // 11:44
        notification3.soundName = UILocalNotificationDefaultSoundName
        notification3.repeatCalendar = NSCalendar.currentCalendar()
        notification3.repeatInterval = .Weekday
        UIApplication.sharedApplication().scheduleLocalNotification(notification3)
        
        let notification4 = UILocalNotification()
        notification4.alertBody = "1 Minute"
        notification4.fireDate = NSDate(timeIntervalSince1970: 1447699740) // 1:49
        notification4.soundName = UILocalNotificationDefaultSoundName
        notification4.repeatCalendar = NSCalendar.currentCalendar()
        notification4.repeatInterval = .Weekday
        UIApplication.sharedApplication().scheduleLocalNotification(notification4)
        
        let notification5 = UILocalNotification()
        notification5.alertBody = "1 Minute"
        notification5.fireDate = NSDate(timeIntervalSince1970: 1447360140) // 3:29
        notification5.soundName = UILocalNotificationDefaultSoundName
        notification5.repeatCalendar = NSCalendar.currentCalendar()
        notification5.repeatInterval = .Weekday
        UIApplication.sharedApplication().scheduleLocalNotification(notification5)
                
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updatetodayLabel()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func updateTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }

   
    func updatetodayLabel() {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        dateLabel.text = formatter.stringFromDate(clock.currentTime)
    }

    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.AdBanner?.hidden = false
    }
    
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.AdBanner?.hidden = true
    }
  
        
}

    
    



