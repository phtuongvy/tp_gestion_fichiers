PHAM HUYNH Tuong Vy

TREHOU Nicolas

# Environnement de développement

## Exercice 1

### 🎯 Les targets

- Les targets sont des modules pouvant être inclus dans une bibliothèque ou un produit exécutable, créés pour configurer les paramétrages, les dépendences et aussi les options spécifiques pour une partie distincte du projet.

### 🧷 Les fichiers de bases ( fourni par défaut à la création du projet), à quoi ils servent ?

- AppDelegate : Il sert comme un fichier qui permet de faire un lien entre iOS et l'application, notamment pour l'utilisation de fonctionnalités système ou autre ( par exemple passage en arrière plan, lancement, ... )

- SceneDelegate : Il peut servir à créér plusieurs instances lancées de la même application. Par exemple, une application Safari peut lancer 3 instances sur iOS alors qu'il n'existe qu'une seule instance généré par SceneDelegate.
        
- Info : Ce fichier écrit en XML contient l'intégralité d'information de l'application comme l'identification, la compilation, la compatibilité, la disponibilité du projet.

- ViewController : Un contrôleur de vue (view controller) peut être considéré comme un écran contenant des informations, ce qui pour nous correspond pour le moment à notre écran tout blanc. C'est une classe intégrée des objets, des fonctions, des variables, des constantes.

### Le dossier 🖼️ Assets.xcassets

- Le dossier Assets.xcassets est la librairie du projet. C'est dans cette librairie qu'on vas retrouverez toutes les images nécessaires à l'application. Il existe plusieurs formats d'icônes d'application, il y a autant de possibilités qu'il y a d'écrans différents sur les appareils Apple.

### Les fichiers 🎨 .storyboard ( LaunchScreen et Main ) :

- Ces fichiers écrits en XML servent comme l'interface de l'application, ils permettent de modifier l'interface grâce à l'Interface Builder.

    Différence entre LaunchScreen et Main :

        - LaunchScreen : permet d'éditer l'image d'intro ( la première image aperçue lorsqu'on lance une application )
        - Main : permet d'éditer l'interface de la page principale de l'application

### 📱 Simulateur

- Le simulateur créer un environnement qui réplique les configuration et le comportement d'un vrai appareils IOS ce qui peux mener a des manque de fonctionnalité, c'est différent d'un émulateur qui lui duplique les fonctionnalités hardware d'un vrai appareils. Donc il peut donc être de bonne pratique de tester sur le simulateur puis un vrai appareils pour s'assurer que l'application fonctionne comme prévu.

## Exercice 2

- ⌘ + R : Permet de lancer l'application ( compiler et lancer )
- ⌘ + ⇧ + O : Permet d'ouvrir rapidement le fichier souhaité
- Le raccourci pour indenter le code automatiquement : ⌃ + I <=> Ctrl + I
- Pour commenter la sélection : ⌘ + : <=> Command + :

# Délégation

## Exercice 1 : Expliquer l’intérêt d’une propriété statique en programmation.

- En Swift, l’utilisation d’une propriété statique permet un partage global des données, ce qui est idéal pour des constantes ou des états communs. Elle optimise la mémoire, car une seule instance est allouée, et reste accessible sans avoir besoin d'instancier la classe. Cela facilite la centralisation, la coordination et les configurations globales.

Dans cet exemple, la propriété statique documents dans DocumentTableViewController stocke une liste partagée de fichiers (DocumentFile). Ces données sont accessibles directement via la classe, sans créer d'instance, permettant de centraliser et de simplifier la gestion des fichiers dans l'application.

## Exercice 2

### Expliquer pourquoi dequeueReusableCell est important pour les performances de l’application.

- Parce qu'on ne duplique pas les cells, on les réutilise.


# Navigation

## Exercice 1

### Que venons nous de faire en réalité ? Quel est le rôle du NavigationController ?

- En réalité, nous venons de faire une navigation, un lien entre les pages de scènes, les écrans. Le rôle de navigation controller permet à gérer une stack de contrôleurs de vue en tant qu'un conteneur.
Il ajoute les interactions, les transitions entre les scènes et de gérer les flows de navigation.

### Est-ce que la NavigationBar est la même chose que le NavigationController ?

- Non car la Navigation Bar est un composant de la Navigation Controller.

# Écran détail

## Exercice 1

### Expliquer ce qu’est un Segue et à quoi il sert.

- C'est un flow qui permet de créer une transition entre les scènes.

## Exercice 2

### Qu’est-ce qu’une constraint ? A quoi sert-elle ? Quel est le lien avec AutoLayout ?

- Une constraint permet de créer une règle qui s'applique sur comment l'élément doit positioner et dimensionner. AutoLayout utilise les constraints pour calculer automatique la taille et la position de l'élément.

# QLPreviewController

## Exercice 1 - QLPreview

### Pourquoi serait-il plus pertinent de changer l’accessory de nos cellules pour un disclosureIndicator ?

- Il serait plus pertinent de changer l'accessory de nos cellules pour un disclosureIndicator parce qu'il indique clairement une navigation possible. Il améliore l'ergonomie et il reste cohérent avec les standards iOS.

## Exercice 2 - Importer un fichier au runtime

### Expliquer ce qu'est un #selector en Swift

- En Swift, #selector est une directive qui permet de faire une référence à une méthode forte typée de objective-c, elle est utilisée comme cibles d'actions dans les contrôles (exemple UIButton,...).

### Que représente .add dans notre appel ?

- .add est un élément de l'énumération UIBarButtonItem.SystemItem, c'est un bouton standard d'iOS, qui représente une icône + pour indiquer un ajout.

### Expliquez également pourquoi XCode vous demande de mettre le mot clé @objc devant la fonction ciblée par le #selector

- @objc est obligé pour indiqauer une méthode appartenant à objective-c, cela permet à des fonctionnalités comme UIBarButtonItem de l'appeler au moment de l'exécution.

### Peut-on ajouter plusieurs boutons dans la barre de navigation ? Si oui, comment en code ?

- Oui. Avec la propriété navigationItem.rightBarButtonItems ou navigationItem.leftBarButtonItems qui va être un tableau UIBarButtonItem.

### À quoi sert la fonction defer ?

- La fonction defer sert à garantir que le code soit exécuté juste avant que l'exécution quitte de la portée actuelle, même s'il y a une erreur ou une exception, il est souvent servi comme une fermeture de la portée.






