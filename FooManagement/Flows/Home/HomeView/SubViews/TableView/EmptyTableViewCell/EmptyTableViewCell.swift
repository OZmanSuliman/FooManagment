//
//  EmptyTableViewCell.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var centerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupView() {
        titleLabel.text = Strings.noOrders.fullString()
        subtitleLabel.text = Strings.addOrders.fullString()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        centerImage.image = UIImage(named: Strings.emptyList.fullString())
    }
}
