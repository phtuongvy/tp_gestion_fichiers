//
//  DocumentTableViewController.swift
//  Document App
//
//  Created by Pham Huynh Tuong Vy on 18/11/2024.
//

import UIKit
import QuickLook

struct DocumentFile {
    var title: String
    var size: Int
    var imageName: String? = nil
    var url: URL
    var type: String
    
    static var documentFiles: [DocumentFile] = []
    static var documentUrl: URL?
}

extension Int {
    func formattedSize() -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(self))
    }
}

extension DocumentTableViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return DocumentFile.documentUrl! as QLPreviewItem
    }
}

extension DocumentTableViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        
        let selectedFileUrl = url
        
        if selectedFileUrl.startAccessingSecurityScopedResource() {
            
            copyFileToDocumentsDirectory(fromUrl: selectedFileUrl)
            
            loadFilesFromDocumentsDirectory()
            
            tableView.reloadData()
            
        } else { return }
        
        defer { selectedFileUrl.stopAccessingSecurityScopedResource() }
        
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Document Picker was cancelled")
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
                //                print(documentListBundle)
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDocument))
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let document = DocumentFile.documentFiles[indexPath.row]
        self.instantiateQLPreviewController(withUrl: document.url)
        
    }
    
    @objc func addDocument() {
        
        let documentPicker = UIDocumentPickerViewController(
            forOpeningContentTypes: [.jpeg,.png,.pdf])
        
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .overFullScreen
        
        present(documentPicker, animated: true, completion: nil)
    }
    
    func copyFileToDocumentsDirectory(fromUrl url: URL) {
        // On récupère le dossier de l'application, dossier où nous avons le droit d'écrire nos fichiers
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Nous créons une URL de destination pour le fichier
        let destinationUrl = documentsDirectory.appendingPathComponent(url.lastPathComponent)
        
        do {
            // Puis nous copions le fichier depuis l'URL source vers l'URL de destination
            try FileManager.default.copyItem(at: url, to: destinationUrl)
        } catch {
            print(error)
        }
    }
    
    func loadFilesFromDocumentsDirectory() {
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            let selectedFilesUrls = try! FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: [.fileSizeKey], options: .skipsHiddenFiles)
            
            let newDocuments = selectedFilesUrls.map {url in
                return DocumentFile(title: url.lastPathComponent,
                                    size: (try! url.resourceValues(forKeys: [.fileSizeKey]).fileSize) ?? 0,
                                    url: url,
                                    type: url.pathExtension)}
            for newDocument in newDocuments {
                // avoid duplication
                if !DocumentFile.documentFiles.contains(where: { $0.url == newDocument.url }) {
                    DocumentFile.documentFiles.append(newDocument)
                }
            }
        } catch {
            print( "Error loading files from documents directory: \(error)" )
        }
        
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
    
    // MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        // 1. Récuperer l'index de la ligne sélectionnée
    //        let indexPath = tableView.indexPathForSelectedRow!
    //
    ////        print("Segue triggered for row \(indexPath.row)")
    //
    //        // 2. Récuperer le document correspondant à l'index
    //        let document = DocumentFile.documentFiles[indexPath.row]
    //
    //        // 3. Cibler l'instance de DocumentViewController via le segue.destination
    //        // 4. Caster le segue.destination en DocumentViewController
    //        let documentViewController = segue.destination as! DocumentViewController
    //
    //        // 5. Remplir la variable imageName de l'instance de DocumentViewController avec le nom de l'image du document
    //        documentViewController.imageName = document.imageName
    //
    //    }
    
    func instantiateQLPreviewController(withUrl url: URL) {
        
        DocumentFile.documentUrl = url
        
        let documentPreviewController = QLPreviewController()
        documentPreviewController.dataSource = self
        
        self.navigationController?.pushViewController(documentPreviewController, animated: true)
        
    }
    
}
