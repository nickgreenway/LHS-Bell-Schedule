//
//  RegularDayViewController.swift
//  LHS Bell Schedule
//
//  Created by Nick Greenway on 10/27/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import Foundation
import UIKit
import iAd


class RegularDayViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet var AdBanner: ADBannerView?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        self.canDisplayBannerAds = true
        self.AdBanner?.delegate = self
        self.AdBanner?.hidden  = true
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.AdBanner?.hidden = false
    }
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.AdBanner?.hidden = true
    }
}