//
//  FolderController.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 20.04.2021.
//

import UIKit

class FolderController: UITableViewController {
    
    var folderr: Folder?
    var notesActual: [Note] {
        if let folderr = folderr {
            return folderr.notesSorted
        } else {
            return notes
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let folderr = folderr {
            navigationItem.title = folderr.name
        } else {
            navigationItem.title = "All notes"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    var selectedNote: Note?
    @IBAction func addNote(_ sender: AnyObject) {
        selectedNote = Note.newNote(name: "", inFolder: folderr)
        performSegue(withIdentifier: "GoToNote", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNote" {
            (segue.destination as! NoteController).note = selectedNote
        }
    }

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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noteInCell = notesActual[indexPath.row]
        selectedNote = noteInCell
        
        performSegue(withIdentifier: "GoToNote", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let noteInCell = (folderr?.notesSorted[indexPath.row])!
            
            CoreDataManager.sharedInstance.managedObjecContext.delete(noteInCell)
            CoreDataManager.sharedInstance.saveContext()
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/
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
