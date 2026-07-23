//
//  FirstViewController.swift
//  todolist
//
//  Created by JOGENDRA on 28/02/17.
//  Copyright © 2017 Jogendra Singh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //returning to view
    override func viewWillAppear(_ animated: Bool) {
        tblTasks.reloadData();
        refreshEmptyState()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "hasSeenOnboarding") {
            // ponytail: flag set on show, not on dismiss — swipe-dismissing the sheet counts as seen
            defaults.set(true, forKey: "hasSeenOnboarding")
            let onboarding = OnboardingViewController()
            onboarding.modalPresentationStyle = .fullScreen
            present(onboarding, animated: true)
        }
    }

    private func refreshEmptyState() {
        if taskMgr.tasks.isEmpty {
            let label = UILabel()
            label.text = "No tasks yet.\nTap ADD NEW to create your first task."
            label.textColor = .secondaryLabel
            label.textAlignment = .center
            label.numberOfLines = 0
            tblTasks.backgroundView = label
        } else {
            tblTasks.backgroundView = nil
        }
    }
    
    //UITableViewDelete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        taskMgr.tasks.remove(at: indexPath.row)
        tblTasks.reloadData();
        refreshEmptyState()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        return taskMgr.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "test")
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }

}

