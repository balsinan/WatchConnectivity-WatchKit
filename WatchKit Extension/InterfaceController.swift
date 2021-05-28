//
//  InterfaceController.swift
//  WatchKit Extension
//
//  Created by Sinan on 28.05.2021.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    var watchSession : WCSession?
    
    override func awake(withContext context: Any?) {
       
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }
    
    @IBAction func addButtonTapped() {
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}

extension InterfaceController : WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith")
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let title = applicationContext["title"] as! String
        let details = applicationContext["details"] as! String
        
    }
}
