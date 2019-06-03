//
//  StatusTableViewController.swift
//  StatusOnGithub
//
//  Created by Thomas Prezioso on 5/19/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import UIKit

class StatusTableViewController: UITableViewController {

    let arrayForCell = [
        "Tom","Nick","Alyssa","Anthony","Daniel","Nikki"
//        ["Dick", "Larry", "Steve"]
    ]
    var apiJSON = [[String : Any]]()
    var componentsArray = [String]()
    var componentsStatus = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        apiCallForData()
        
    }
    
    // MARK: - APICall
    
    func apiCallForData() {
        DispatchQueue.main.async {
            APICall().summaryStatus { (json) in
                self.apiJSON = json! as [[String : Any]]
                for components in self.apiJSON {
                    if components["name"] as! String != "Visit www.githubstatus.com for more information"{
                        self.componentsArray.append(components["name"] as! String)
                        self.componentsStatus.append(components["status"] as! String)

                    }
                }
                print(self.componentsArray)
                self.tableView.reloadData()
                
            }
        }

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "All Systems Operational"
        label.backgroundColor = UIColor.lightGray
       
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.componentsArray.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "statusCell")
        // Configure the cell...

        cell.textLabel?.text = componentsArray[indexPath.row]
        cell.detailTextLabel?.text = self.componentsStatus[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
