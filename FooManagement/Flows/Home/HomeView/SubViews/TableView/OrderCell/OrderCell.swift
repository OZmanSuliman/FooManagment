//
//  OrderCell.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

class OrderCell: UITableViewCell {
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderStatus: StatusView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupCell() {
        
    }
    
    func setupView() {
        orderImage.layer.cornerRadius = 10.0
        orderImage.layer.masksToBounds = true
    }
}
