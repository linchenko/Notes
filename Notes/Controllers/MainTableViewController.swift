//
//  MainTableViewController.swift
//  Notes
//
//  Created by Levi Linchenko on 24/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive = false
    var filtered: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell")
//
//        filtered = cell.filter({ (text) -> Bool in
//
//        })
//
//    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entry.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let entryText = EntryController.shared.entry[indexPath.row]
        cell.textLabel?.text = entryText.bodyText
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let EntryText = EntryController.shared.entry[indexPath.row]
            EntryController.shared.delete(entryText: EntryText)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryVC"{
            let destinationVC = segue.destination as? EntryViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let entry = EntryController.shared.entry[indexPath.row]
            destinationVC?.entry = entry
        }
    }
    
    
    
    
}
