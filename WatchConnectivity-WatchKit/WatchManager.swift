//
//  WatchManager.swift
//  WatchConnectivity-WatchKit
//
//  Created by Sinan on 28.05.2021.
//

import Foundation
import WatchConnectivity

protocol WatchManagerProtocol: AnyObject {
    func updateContext(success: Bool)
}

class WatchManager: NSObject{
    
    private var watchSession : WCSession?
    weak var delegate : WatchManagerProtocol?
    
    override init() {
        super.init()
        
        startSession()
    }
    
    func startSession(){
        if WCSession.isSupported(){
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    func sendDataToWatch(data: [String: Any]){
        do {
            try watchSession?.updateApplicationContext(data)
            updateContext(success: true)
        }catch{
            updateContext(success: false)
        }
    }
    
    func updateContext(success: Bool) {
        delegate?.updateContext(success: success)
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
