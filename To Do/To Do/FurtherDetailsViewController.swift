//
//  FurtherDetailsViewController.swift
//  To Do
//
//  Created by Rami Mostafa on 12/5/17.
//  Copyright © 2017 rmostafa. All rights reserved.
//

import UIKit

class FurtherDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsName: UILabel!
    @IBOutlet weak var detailsStart: UILabel!
    @IBOutlet weak var detailsEnd: UILabel!
    @IBOutlet weak var detailsDesc: UILabel!

    var selectedIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ind = selectedIndex {
            detailsName.text = tasks[selectedIndex!.row].name
            detailsDesc.text = tasks[selectedIndex!.row].info
            detailsStart.text = tasks[selectedIndex!.row].startTime
            detailsEnd.text = tasks[selectedIndex!.row].endTime
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "removeFurtherDetailsToTasks" || identifier == "taskFinishToTasks" {
                tasks.remove(at: selectedIndex!.row)
            }
        }
    }

}
