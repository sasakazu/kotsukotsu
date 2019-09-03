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
    
    


    @IBOutlet weak var dayTF: UITextField!
    
    @IBOutlet weak var kotukotuTF: UITextField!
    

    @IBOutlet weak var dayTextarea: UITextView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        let goal = dayTF.text
        let kotukotu = kotukotuTF.text
        let memo = dayTextarea.text
        
        db.collection("こつこつ").document().setData([
            "目標": goal,
            "すること": kotukotu,
            "メモ": memo
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
        
    }
 
    
    
    
    
}
