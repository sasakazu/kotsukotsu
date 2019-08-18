//
//  everydayAdd.swift
//  kotsukotsu
//
//  Created by 笹倉一也 on 2019/08/18.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class everydayAdd: UIViewController {
    
    
    @IBOutlet weak var dayTextarea: UITextView!
    @IBOutlet weak var dayTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        db.collection("day").document().setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        
    }
 
    
    
    
    
}
