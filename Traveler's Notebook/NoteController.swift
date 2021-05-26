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
        imageView.image = note?.addActualImage
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
        note?.addActualImage = imageView.image
        
        CoreDataManager.sharedInstance.saveContext()
    }
    // MARK: - Table view data source
    
    let imagePiker: UIImagePickerController = UIImagePickerController()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            
            let alertContr = UIAlertController(title: "sorse", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            
            let alertActionFoto = UIAlertAction(title: "Selected from library", style: UIAlertAction.Style.default, handler: { (alert) in
                self.imagePiker.sourceType = .savedPhotosAlbum
                self.imagePiker.delegate = self
                self.present(self.imagePiker, animated: true, completion: nil)
                
            })
            
            let alertActionCamera = UIAlertAction(title: "Make a foto", style: UIAlertAction.Style.default, handler: { (alert) in
                self.imagePiker.sourceType = .camera
                self.imagePiker.delegate = self
                self.present(self.imagePiker, animated: true, completion: nil)
            })
            
            if self.imageView.image != nil {
                let alertActionDelete = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { (alert) in
                    self.imageView.image = nil
                })
                alertContr.addAction(alertActionDelete)
            }
            
            let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (alert) in
            })
            
            alertContr.addAction(alertActionFoto)
            alertContr.addAction(alertActionCamera)
            alertContr.addAction(alertActionCancel)
            
            present(alertContr, animated: true, completion: nil)

        }
        
    }

 

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

extension NoteController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

