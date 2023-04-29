//
//  AddOrderButtonView.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

protocol AddOrderButtonDelegate {
    func addOrderHandler()
}

class AddOrderButtonView: UIView {
    @IBOutlet weak var addOrderButton: UIButton!
    var delegate: AddOrderButtonDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if let views = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil),
            let view = views.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
    }
    @IBAction func didTapAddOrder(_ sender: Any) {
        delegate?.addOrderHandler()
    }
}

extension AddOrderButtonView {
    func setupView() {
        // Set the button's title
        var config = UIButton.Configuration.bordered()
        config.image = UIImage(systemName: Strings.plus.fullString())
        config.baseBackgroundColor = UIColor(named: Strings.Orange.fullString())
        config.title = Strings.createNewOrder.fullString()
        config.imagePadding = 8 // set image padding
        addOrderButton.configuration = config
        // Set the button's title font
        addOrderButton.layer.cornerRadius = 20.0
        addOrderButton.layer.masksToBounds = true
        addOrderButton.tintColor = .white
    }
}
