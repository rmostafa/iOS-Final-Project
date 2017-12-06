//
//  NewTaskViewController.swift
//  To Do
//
//  Created by Rami Mostafa on 12/5/17.
//  Copyright © 2017 rmostafa. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputStart: UITextField!
    @IBOutlet weak var inputEnd: UITextField!
    @IBOutlet weak var inputDesc: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifer = segue.identifier {
            if identifer == "newTaskToTasks" {
                if (inputName.text == nil || inputDesc.text == nil || inputStart.text == nil || inputEnd.text == nil) {
                    let alert = UIAlertController(title: "Error", message: "Please input information regarding your task", preferredStyle: UIAlertControllerStyle.alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        switch action.style{
                        case.default:
                            print("default")
                        case.cancel:
                            print("cancel")
                        case.destructive:
                            print("destructive")
                        }
                    }))
                }
                else if (!(inputStart.text?.contains(":"))!) || (!(inputEnd.text?.contains(":"))!) || (((inputStart.text?.count)! < 6) || ((inputStart.text?.count)! > 7)) || (((inputEnd.text?.count)! < 6) || ((inputEnd.text?.count)! > 7)) {
                    let alert = UIAlertController(title: "Error", message: "Please input a valid time with the format HH:MMam/pm", preferredStyle: UIAlertControllerStyle.alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        switch action.style{
                        case.default:
                            self.inputStart.text = ""
                            self.inputEnd.text = ""
                        case.cancel:
                            print("cancel")
                        case.destructive:
                            print("destructive")
                        }
                    }))
                }
                else {
                    tasks.append(Task(name: inputName.text!, info: inputDesc.text!, startTime: inputStart.text!, endTime: inputEnd.text!))
                }
            }
        }
    }

}
