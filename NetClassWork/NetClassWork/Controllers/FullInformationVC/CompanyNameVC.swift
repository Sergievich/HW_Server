//
//  CompanyNameVC.swift
//  NetClassWork
//
//  Created by Artiom on 26.07.21.
//

import UIKit

class CompanyNameVC: UIViewController {
    @IBOutlet weak var inputCompanyName: UITextField!
    
    
    var name = ""
    var giveName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chngeName(_ sender: Any) {
        guard let nameFirst = inputCompanyName.text else { return }
        name = nameFirst
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        giveName = name
    }
   

}
