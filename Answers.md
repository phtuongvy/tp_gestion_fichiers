
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




