//
//  FullInformationVC.swift
//  NetClassWork
//
//  Created by Artiom on 24.07.21.
//

import UIKit

class FullInformationVC: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userNickname: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var userWebsite: UILabel!
    @IBOutlet weak var userCompany: UILabel!
    
    @IBOutlet weak var userAdres: UILabel!
    
    var index: Int!
    var userInfo: User {
        UsersVC.users[index]
    }
    var companyName = ""
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = userInfo.name
        userNickname.text = userInfo.username
        userEmail.text = userInfo.email
        userPhoneNumber.text = userInfo.phone
        userWebsite.text = userInfo.website
        userCompany.text = userInfo.company?.name
        userAdres.text = userInfo.address?.city
    }
    
 
    
   
    
   

    
    // MARK: - Navigation
    @IBAction func saveData (_ unwindSegue: UIStoryboardSegue){
        guard unwindSegue.identifier == "123" else { return }
        guard let source = unwindSegue.source as? CompanyNameVC else { return }
        userCompany.text = source.giveName
        
    }
    
    


}
