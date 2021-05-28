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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        if taskTextField.text != ""{
            WatchManager.shared.sendDataToWatch(data: ["task" : taskTextField.text!, "details" : detailsTextField.text ?? ""])
        }
    }
}

