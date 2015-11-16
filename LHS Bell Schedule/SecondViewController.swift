//
//  SecondViewController.swift
//  LHS Bell Schedule
//
//  Created by Nick Greenway on 10/26/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import UIKit
import iAd

class SecondViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet var AdBanner: ADBannerView?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    let clock = Clock()
    var timer: NSTimer?
    let timeNumberformatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    let timeNumberformatter2 = NSDateFormatter()
    let timeFormatter2 = NSDateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
        self.canDisplayBannerAds = true
        self.AdBanner?.delegate = self
        self.AdBanner?.hidden  = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updatetodayLabel()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.AdBanner?.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.AdBanner?.hidden = true
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

}