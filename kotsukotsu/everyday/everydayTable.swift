//
//  everydayTable.swift
//  kotsukotsu
//
//  Created by 笹倉一也 on 2019/08/18.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import Firebase

class everydayTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let day = ["hhhh"]
    
    @IBOutlet weak var tableview: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser {

            let email = user.email
          
            print(email)
            
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return day.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = day[indexPath.row]
  
        return cell

  
    }
    

 

}
