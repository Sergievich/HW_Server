//
//  UserCell.swift
//  NetClassWork
//
//  Created by Martynov Evgeny on 22.07.21.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var websiteLbl: UILabel!

    func configure(with user: User) {
        nameLbl.text = user.name
        usernameLbl.text = user.username
//        emailLbl.text = user.email
//        phoneLbl.text = user.phone
//        websiteLbl.text = user.website
    }
}
