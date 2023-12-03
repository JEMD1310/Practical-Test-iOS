//
//  UserTableViewCell.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 02/12/23.
//

import UIKit
import Alamofire

class UserTableViewCell: UITableViewCell {
    
    var item:UserModel? {
        didSet {
            configureCell()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.img.layer.cornerRadius = self.img.frame.width / 2
        self.img.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        guard let item = item  else {
            return
        }
        img.image = nil
        nameLabel.text = "\(item.name?.title ?? "") \(item.name?.first ?? "") \(item.name?.last ?? "")"
        emailLabel.text = item.email
        img.downloadedFrom(link: item.picture?.thumbnail ?? "", contentMode: .scaleAspectFit)
    }

}
