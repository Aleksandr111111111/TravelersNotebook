//
//  FoldersController.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 14.04.2021.
//

import UIKit

class FoldersController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func peshAddAction(_ sender: UIButton) {
        let alertAction = UIAlertController(title: "Create new folder", message: "Create", preferredStyle: UIAlertController.Style.alert)
        alertAction.addTextField { (text) in
            text.placeholder = "Folder name"
        }
        let alertAcnionAdd = UIAlertAction(title: "Create", style: UIAlertAction.Style.default) { (alert) in
            let folderName = alertAction.textFields?[0].text
            if folderName != nil {
                _ = Folder.newFolder(name: folderName!)
                CoreDataManager.sharedInstance.saveContext()
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
        let alertActionСancel = UIAlertAction(title: "Сancel", style: UIAlertAction.Style.default) { (alert) in
         }
        
        alertAction.addAction(alertAcnionAdd)
        alertAction.addAction(alertActionСancel)
        present(alertAction, animated: true, completion: nil)
        
          tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folder.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foldersCell", for: indexPath)
        let folderInCell = folder[indexPath.row]
        cell.textLabel?.text = folderInCell.name

        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToFolder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFolder" {
            let selectedFolder = folder[tableView.indexPathForSelectedRow!.row]
            (segue.destination as! FolderController).folderr = selectedFolder
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let folderInCell = folder[indexPath.row]
            
            CoreDataManager.sharedInstance.managedObjecContext.delete(folderInCell)
            CoreDataManager.sharedInstance.saveContext() 
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
