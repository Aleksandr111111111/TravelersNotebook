//
//  FolderController.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 20.04.2021.
//

import UIKit

class FolderController: UITableViewController {
    
    var folder: Folder?
    var notesActual: [Note] {
        if let folder = folder {
            return folder.notesSorted
        } else {
            return notes
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let folder = folder {
            navigationItem.title = folder.name
        } else {
            navigationItem.title = "All notes"
        }
    }
//    @IBAction func addNote(_ sender: UIBarButtonItem) {
//        let alertActionNote = UIAlertController(title: "Create new note", message: "Create", preferredStyle: UIAlertController.Style.alert)
//        alertActionNote.addTextField { (text) in
//            text.placeholder = "Note name"
//        }
//        let alertAcnionAdd = UIAlertAction(title: "Create", style: UIAlertAction.Style.default) { (alert) in
//            let noteName = alertActionNote.textFields?[0].text
//            if noteName != nil {
//                _ = Note.newNote(name: noteName!)
//                CoreDataManager.sharedInstance.saveContext()
//                self.tableView.reloadData()
//            }
//
//        }
//        let alertActionСancel = UIAlertAction(title: "Сancel", style: UIAlertAction.Style.default) { (alert) in
//         }
//
//        alertActionNote.addAction(alertAcnionAdd)
//        alertActionNote.addAction(alertActionСancel)
//        present(alertActionNote, animated: true, completion: nil)
//
//    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesActual.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellNote", for: indexPath)
        let noteInCell = notesActual[indexPath.row]
        
        cell.textLabel?.text = noteInCell.name
        cell.detailTextLabel?.text = noteInCell.dateUpdatedString

        // Configure the cell...

        return cell
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
            
            let noteInCell = (folder?.notesSorted[indexPath.row])!
            
            CoreDataManager.sharedInstance.managedObjecContext.delete(noteInCell)
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}