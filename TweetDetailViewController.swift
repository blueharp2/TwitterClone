//
//  TweetDetailViewController.swift
//  TwitterCF
//
//  Created by Lindsey on 10/29/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    // Class Properties
    var tweet : Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppeaance()
        self.setupTweetDetailViewController()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAppeaance() {
        if let tweet = self.tweet{
            if let retweetStatus = tweet.retweetStatus {
                self.userNameLabel.text = retweetStatus.user?.userName
                self.tweetLabel.text = retweetStatus.text
                self.navigationItem.title = retweetStatus.user?.userName
            } else {
                self.tweetLabel.text = tweet.text
                self.userNameLabel.text = tweet.user?.userName
                self.navigationItem.title = tweet.user?.userName
                
            }
            
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetLabel.text = self.tweet.isRetweet ?
            self.tweet.rtText : self.tweet.text
    }
}