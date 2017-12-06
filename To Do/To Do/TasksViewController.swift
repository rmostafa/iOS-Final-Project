//
//  TasksViewController.swift
//  To Do
//
//  Created by Rami Mostafa on 12/5/17.
//  Copyright © 2017 rmostafa. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tasksTableView: UITableView!
    var ind: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tasksTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "taskToFurtherDetails" {
                if let dest = segue.destination as? FurtherDetailsViewController {
                    dest.selectedIndex = ind
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "reuseCell") as! TableViewCell
        let task = tasks[indexPath.row]
        cell.taskName.text = task.name
        cell.taskDesc.text = task.info
        cell.taskStart.text = task.startTime
        cell.taskEnd.text = task.endTime
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ind = indexPath
        performSegue(withIdentifier: "taskToFurtherDetails", sender: self)
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        performSegue(withIdentifier: "tasksToNewTask", sender: self)
    }

}
