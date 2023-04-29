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
    @IBOutlet weak var orderStatus: StatusView!

    var order: Order?
    var delegate: OrderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupCell(order: Order) {
        self.order = order
        setupView()
    }
    
    func setupView() {
        orderImage.layer.cornerRadius = 10.0
        orderImage.layer.masksToBounds = true
        guard let order else { return }
        orderImage.image = UIImage(named: "Strawberry-Milkshake")
        orderName.text = order.name
        orderDescription.text = order.desc
        orderStatus.setupStatus(order.status)
        orderStatus.statusTapHandler = { self.delegate?.changeStatus(order: order) }
    }
}
