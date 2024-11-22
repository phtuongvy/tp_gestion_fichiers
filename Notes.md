PHAM HUYNH Tuong Vy

TREHOU Nicolas

### Comment basculer Table View Controller en tant que Initial View Controller ?

- Sélectionner la Table View Controller et ensuite dans l'inspecteur d'attributs, il faut cocher Is Initial View Controller dans l'onglet View Controller.

### Comment enregistrer un identifiant d'un composant du storyboard dans un ViewController en programmation ?

- Ajouter cette ligne :

tableView.register( UITableViewCell.self, forCellReuseIdentifier: "DocumentCell")

dans override func viewDidLoad() {}

### Binding

- Assistants -> Drag et drop les éléments dans la DocumentTableViewCell et il y aura @IBOutlet qui permet d'utiliser le style subtitle et title pour afficher les titres correctement.

- Des print debugs dans l'évènement sender peut aider à savoir si le sègue est bien binding. Exemple : if segue.identifier == "ShowDocumentSegue" { print "Segue triggered" }

### QLPreviewController

- Un QLPreviewController est utilisé pour afficher un aperçu des fichiers pris en charge (PDF, images,... ). Il fonctionne via un protocole QLPreviewControllerDataSource pour fournir les fichiers à afficher.

- Pour naviguer à documentPreviewController qui était instancié en tant que QLPreviewController :
self.navigationController?.pushViewController(documentPreviewController, animated: true)

- Source de données pour le QLPreviewController :
documentPreviewController.dataSource = self

- file.startAccessingSecurityScopedResource() pour savoir si on peut accéder à ce fichier "file" ou pas, on accède temporairement à ce fichier.
