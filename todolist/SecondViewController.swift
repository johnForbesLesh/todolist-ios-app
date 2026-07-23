//
//  SecondViewController.swift
//  todolist
//
//  Created by JOGENDRA on 28/02/17.
//  Copyright © 2017 Jogendra Singh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //events - jog
    @IBAction func btnAddTask_Click(sender: UIButton){

        let name = txtTask.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let desc = txtDesc.text?.trimmingCharacters(in: .whitespaces) ?? ""
        guard !name.isEmpty else {
            let alert = UIAlertController(title: "Task name required", message: "Give the task a name before adding it.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        taskMgr.addTask(name: name, desc: desc);
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        self.tabBarController?.selectedIndex = 0;
    }
    
    //touch function - jog
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    //UIText field delegate - jog
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        return true
    }

}

