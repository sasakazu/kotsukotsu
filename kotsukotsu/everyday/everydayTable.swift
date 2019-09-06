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

    var itemSource = [Item]()
    
    @IBOutlet weak var tableview: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let db = Firestore.firestore()
        
        let user = Auth.auth().currentUser
       
        let myPostRef = db.collection("こつこつ")
        
        myPostRef.addSnapshotListener(includeMetadataChanges: true){ (postdocument, error) in
            
            
            
            guard let value = postdocument else {
                print("snapShot is nil")
                return
            }
            
            
            value.documentChanges.forEach{ postdiff in
                
                if postdiff.type == .added {
                    
                    
                    
                    let chatDataOp = postdiff.document.data() as? Dictionary<String, Any>
                    
                    
                    guard let chatData = chatDataOp else {
                        return
                    }
                    
                    
                    let username = chatData["すること"] as? String
                    let iconURL = chatData["メモ"] as? String
                    let profile = chatData["目標"] as? String
                    let postid = chatData["postid"] as? String
                    
                    
            
                    
                    let newSourse = Item(goal: username ?? "", title: iconURL ?? "", memo: profile ?? "", postid: postid ?? "")
                    
                    self.itemSource.append(newSourse)
                    
                    self.tableview.reloadData()
                    

                }
                
            }
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = itemSource[indexPath.row].goal
  
        return cell

  
    }
    

 

}
