//
//  DetailsTableViewCell.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import UIKit

protocol DetailsTableViewCellDelegate {
    func changeStatus(order: Order)
}

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var valueView: UIView!

    var delegate: DetailsTableViewCellDelegate?
    var order: Order?
    var index: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
        order = nil
        index = nil
        for subview in valueView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in valueView.subviews {
            (subview as? UILabel)?.textAlignment = .right
            (subview as? UILabel)?.numberOfLines = 0
            (subview as? UILabel)?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            subview.frame = valueView.bounds
        }
    }
    
    func setupCell(order: Order, index: Int) {
        self.order = order
        self.index = index
        self.setupView()
    }
    
    func setupView() {
        guard let order, let index else { return }
        switch index {
        case 0:
            let statusView = StatusView.instanceFromNib()
            statusView.setupStatus(order.status)
            statusView.statusTapHandler = {
                self.delegate?.changeStatus(order: order)
            }
            self.title.text = Strings.orderStatus.fullString()
            self.valueView.addSubview(statusView)
            
        case 1:
            self.title.text = Strings.orderDate.fullString()
            let dateLabel = UILabel()
            dateLabel.text = order.createdAt.formatted(date: .abbreviated, time: .shortened)
            dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
            valueView.addSubview(dateLabel)
        case 2:
            self.title.text = Strings.total.fullString()
            let priceLabel = UILabel()
            priceLabel.text = order.price
            priceLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            priceLabel.textColor = UIColor(named: Strings.Orange.fullString())
            valueView.addSubview(priceLabel)
        default:
            break
        }
        
    }
}

