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
    
    private var items = [Note]() {
        didSet {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
    }
    
    override func awake(withContext context: Any?) {
       
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }
    
    private func updateTable(){
        table.setNumberOfRows(items.count, withRowType: "cell")
        
        for (index, item) in items.enumerated(){
            if let row = table.rowController(at: index) as? RowController{
                row.titleLabel.setText(item.title)
            }
        }
    }
    
    @IBAction func addButtonTapped() {
        self.presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { results in
            guard let results = results else { return }
            OperationQueue.main.addOperation {
                self.dismissTextInputController()
                let note = Note(title: results[0] as? String ?? "", details: "")
                self.items.append(note)
            }
        }
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
        let note = Note(title: title, details: details)
        items.append(note)
    }
}
