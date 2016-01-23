//
//  ViewController.swift
//  AdmobTest
//
//  Created by Masaki Horimoto on 2015/09/05.
//  Copyright (c) 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GADBannerViewDelegate {
    
    let YOUR_ID = "ca-app-pub-3530000000000000/0123456789"  // Enter Ad's ID here
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0" // Enter Test ID here
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bannerView:GADBannerView = getAdBannerView()
        self.view.addSubview(bannerView)
        
    }
    
    private func getAdBannerView() -> GADBannerView {
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPointMake(0, 20)
        bannerView.frame.size = CGSizeMake(self.view.frame.width, bannerView.frame.height)
        bannerView.adUnitID = "\(YOUR_ID)"
        bannerView.delegate = self
        bannerView.rootViewController = self
        
        let request:GADRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                request.testDevices = [kGADSimulatorID]
            } else {
                request.testDevices = [TEST_DEVICE_ID]
            }
        }
        
        bannerView.loadRequest(request)
        
        return bannerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

