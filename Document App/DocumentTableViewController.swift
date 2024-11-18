//
//  DocumentTableViewController.swift
//  Document App
//
//  Created by Pham Huynh Tuong Vy on 18/11/2024.
//

import UIKit

struct DocumentFile {
    var title: String
    var size: Int
    var imageName: String? = nil
    var url: URL
    var type: String
    
    static var documentFiles: [DocumentFile] = []
}

extension Int {
    func formattedSize() -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(self))
    }
}

class DocumentTableViewCell: UITableViewCell {
 
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var title: UILabel!
}

class DocumentTableViewController: UITableViewController {
    
    func listFileInBundle() -> [DocumentFile] {
        
        // créer un FileManager pour accéder au système de fichiers
        let fm = FileManager.default
        // chemin du répertoire du bundle principal
        let path = Bundle.main.resourcePath!
        // liste des fichiers du répertoire
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // créer une liste pour contenir les documents
        var documentListBundle = [DocumentFile]()
        
        // parcourir chaque fichier dans le répertoire
        for item in items {
            // si le fichier n'a pas d'extension DS_Store et il a extension .jpg
            if !item.hasSuffix("DS_Store") && item.hasSuffix(".jpg") {
                // construire le chemin pour le fichier image courant
                let currentUrl = URL(fileURLWithPath: path + "/" + item)
                
                // récupérer les informations sur le fichier
                let resourcesValues = try! currentUrl.resourceValues(forKeys: [.contentTypeKey, .nameKey, .fileSizeKey])
                
                // ajouter le document dans la liste des documents avec leur informations
                documentListBundle.append(DocumentFile(
                    
                    // le nom du document
                    title: resourcesValues.name!,
                    // la taille du document si vide donc 0
                    size: resourcesValues.fileSize ?? 0,
                    // le fichier image
                    imageName: item,
                    // le chemin du fichier image courant
                    url: currentUrl,
                    //le type du fichier
                    type: resourcesValues.contentType!.description)
                )
            }
        }
        // retourner la liste des documents
        return documentListBundle
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // recharger les fichiers du bundle
        DocumentFile.documentFiles = listFileInBundle()
        
        // recharger la TableView pour afficher les données
        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        
        return DocumentFile.documentFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath) as? DocumentTableViewCell else {
                fatalError("Unable to dequeue DocumentTableViewCell")
            }
        
        let documentFile = DocumentFile.documentFiles[ indexPath.row ]
        
        cell.title.text = documentFile.title
        cell.subtitle.text = documentFile.size.formattedSize()
        
        return cell
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
