//
//  HomeHeaderView.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

class HomeHeaderView: UIView {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImage.image = UIImage(named: Strings.HeaderBg.fullString())
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = Strings.FooManagement.fullString()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if let views = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil),
            let view = views.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
    }
}
