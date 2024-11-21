//
//  DocumentViewController.swift
//  Document App
//
//  Created by Pham Huynh Tuong Vy on 18/11/2024.
//

import UIKit


class DocumentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Vérifier que imageName n'est pas nil
        if let imageName = imageName {
            // 2. Afficher l'image dans l'ImageView
            imageView.image = UIImage(named: imageName)
        }

        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
