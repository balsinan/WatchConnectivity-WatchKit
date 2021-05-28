//
//  WatchManager.swift
//  WatchConnectivity-WatchKit
//
//  Created by Sinan on 28.05.2021.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject{
    
    static let shared : WatchManager = WatchManager()
    private var watchSession : WCSession?
    
    override init() {
        super.init()
        
        if WCSession.isSupported(){
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    func sendDataToWatch(data: [String: Any]){
        do {
            try watchSession?.updateApplicationContext(data)
        }catch{
            print("error sending dict to watch!!!!1")
        }
    }
}

extension WatchManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
}
