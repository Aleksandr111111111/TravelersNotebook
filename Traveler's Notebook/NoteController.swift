//
//  NoteController.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 23.04.2021.
//

import UIKit

class NoteController: UITableViewController {
    var note: Note?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textName.text = note?.name
        textDescription.text = note?.textDiscription
    }

    override func viewWillDisappear(_ animated: Bool) {
        if textName.text == "" && textDescription.text == "" {
            CoreDataManager.sharedInstance.managedObjecContext.delete(note!)
            CoreDataManager.sharedInstance.saveContext()
            return
        }
        if note?.name != textName.text || note?.textDiscription != textDescription.text {
            note?.dateUpdate = NSDate() as Date
        }
        note?.name = textName.text
        note?.textDiscription = textDescription.text
        
        CoreDataManager.sharedInstance.saveContext()
    }
    
//    let alertActionNote = UIAlertController(title: "Create new note", message: "Create", preferredStyle: UIAlertController.Style.alert)
//    alertActionNote.addTextField { (text) in
//        text.placeholder = "Note name"
//    }
//    let alertAcnionAddN = UIAlertAction(title: "Create", style: UIAlertAction.Style.default) { (alert) in
//        let noteName = alertActionNote.textFields?[0].text
//        if noteName != nil {
//            _ = Note.newNote(name: noteName!, inFolder: Folder)
//            CoreDataManager.sharedInstance.saveContext()
//            self.tableView.reloadData()
//        }
//
//    }
//    let alertActionСancel = UIAlertAction(title: "Сancel", style: UIAlertAction.Style.default) { (alert) in
//     }
//
//    alertActionNote.addAction(alertAcnionAddN)
//    alertActionNote.addAction(alertActionСancel)
//    present(alertActionNote, animated: true, completion: nil)
 

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
