//
//  ListVC.swift
//  Whats in it
//
//  Created by Faisal Akhtar on 2017-04-13.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ListVC: UITableViewController {
    var ingredients = [Ingredients]()
    let headerTitles = ["Main Ingredients Found"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        print(ingredients)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            
            cell.textLabel?.text = ingredients[indexPath.row].name
            
    


        return cell
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    
    
    }
