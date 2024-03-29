//
//  ViewController.swift
//  WatchConnectivity-WatchKit
//
//  Created by Sinan on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    var watchManager = WatchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watchManager.delegate = self
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        if taskTextField.text != ""{
            watchManager.sendDataToWatch(data: ["title" : taskTextField.text!, "details" : detailsTextField.text ?? ""])
        }
    }
}

extension ViewController : WatchManagerProtocol{
    func updateContext(success: Bool) {
        taskTextField.text = ""
        detailsTextField.text = ""
        if success{
            showAlert(title: "Success", message: "Context sent to watch")
        }else{
            showAlert(title: "Error", message: "Failed to send context")
        }
    }
}

