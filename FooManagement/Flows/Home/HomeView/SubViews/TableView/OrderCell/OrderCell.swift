//
//  OrderCell.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit
protocol OrderCellDelegate {
    func changeStatus(order: Order)
}

class OrderCell: UITableViewCell {
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderStatus: UIView!

    var order: Order?
    var delegate: OrderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        orderName.text = ""
        orderDescription.text = ""
        orderImage.image = nil
        for subview in orderStatus.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in orderStatus.subviews {
            subview.frame = orderStatus.bounds
        }
    }
    
    func setupCell(order: Order) {
        self.order = order
        setupView()
    }
    
    func setupView() {
        orderImage.layer.cornerRadius = 10.0
        orderImage.layer.masksToBounds = true
        guard let order else { return }
        orderImage.image = UIImage(named: order.image)
        orderName.text = order.name
        orderDescription.text = order.desc
        let orderStatusView = StatusView.instanceFromNib()
        orderStatusView.setupStatus(order.status)
        orderStatusView.statusTapHandler = { self.delegate?.changeStatus(order: order) }
        orderStatus.addSubview(orderStatusView)
    }
}
