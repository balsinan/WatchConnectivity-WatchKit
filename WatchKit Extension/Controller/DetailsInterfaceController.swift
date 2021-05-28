//
//  DetailsInterfaceController.swift
//  WatchKit Extension
//
//  Created by Sinan on 29.05.2021.
//

import WatchKit
import Foundation


class DetailsInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var detailsLabel: WKInterfaceLabel!
    
    var selectedNote : Note!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let note = context as? Note {
            selectedNote = note
            detailsLabel.setText(note.details)
        }
    }

    @IBAction func editButtonTapped() {
        self.presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { results in
            guard let results = results else { return }
            OperationQueue.main.addOperation {
                self.dismissTextInputController()
                self.selectedNote.details = results[0] as? String ?? ""
                self.detailsLabel.setText(self.selectedNote.details)
    
            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
