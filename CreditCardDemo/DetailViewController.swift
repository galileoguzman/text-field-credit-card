//
//  DetailViewController.swift
//  CreditCardDemo
//
//  Created by Galileo Guzman on 4/2/18.
//  Copyright © 2018 Galileo Guzman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgMyImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        imgMyImage.isUserInteractionEnabled = true
        imgMyImage.addGestureRecognizer(gesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Action", message: "Hello World", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Accept", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

    @IBAction func btnBackPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
