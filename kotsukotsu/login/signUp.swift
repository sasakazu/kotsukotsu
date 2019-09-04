//
//  signUp.swift
//  kotsukotsu
//
//  Created by 笹倉一也 on 2019/09/04.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class signUp: UIViewController {
    
    
    
    @IBOutlet weak var usename: UITextField!
    
    @IBOutlet weak var email: UITextField!
   
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func signup(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { user, err in
            
            if let err = err {
                print("Error writing document: \(err)")
            }
                
            else {
                print("Document successfully written!")
            }
            
            
            
        }
    
    }
    
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
    


}
