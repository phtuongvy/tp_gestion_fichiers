
### Comment basculer Table View Controller en tant que Initial View Controller ?

- Sélectionner la Table View Controller et ensuite dans l'inspecteur d'attributs, il faut cocher Is Initial View Controller dans l'onglet View Controller.

### Comment enregistrer un identifiant d'un composant du storyboard dans un ViewController en programmation ?

- Ajouter cette ligne :

tableView.register( UITableViewCell.self, forCellReuseIdentifier: "DocumentCell")

dans override func viewDidLoad() {}

### Binding

- Assistants -> Drag et drop les éléments dans la DocumentTableViewCell et il y aura @IBOutlet qui permet d'utiliser le style subtitle et title pour afficher les titres correctement.


