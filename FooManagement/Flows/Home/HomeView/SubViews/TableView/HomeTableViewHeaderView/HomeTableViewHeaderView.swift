//
//  HomeTableViewHeaderView.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

class HomeTableViewHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    
    class func instanceFromNib() -> HomeTableViewHeaderView {
        return (UINib(nibName: String(describing: HomeTableViewHeaderView.self),
                      bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? HomeTableViewHeaderView)!
    }
    
    override  func awakeFromNib() {
        setTitleFont()
    }
    func setTitleFont() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.text = Strings.Orders.fullString()
    }
}

