//
//  OrderDetailsViewController.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import UIKit

protocol OrderDetailsDisplayLogic {
    func updateOrder(_ order: Order)
}

class OrderDetailsViewController: UIViewController {
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderSubtitle: UILabel!
    @IBOutlet weak var orderDesc: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    
    var interactor: OrderDetailsBusinessLogic?
    var config = OrderDetailsConfig()
    var router: OrderDetailsRouterLogic?
    var order: Order?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension OrderDetailsViewController {
    private func setupView() {
        let backButtonImage = UIImage(named: Strings.backButton.fullString())
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton

        guard let order else { return }
        self.orderName.text = order.name
        self.orderSubtitle.text = order.image
        self.orderDesc.text = order.desc
        banner.image = UIImage(named: order.image)
    }
    
    private func setupTableView() {
        self.detailsTableView.dataSource = self
        self.detailsTableView.delegate = self
        self.detailsTableView.registerNib(DetailsTableViewCell.self)
    }
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifierCell,
                                                       for: indexPath) as? DetailsTableViewCell, let order else {
            return UITableViewCell(style: .default, reuseIdentifier: Strings.identifier.fullString())
        }
        cell.setupCell(order: order, index: indexPath.item)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension OrderDetailsViewController: DetailsTableViewCellDelegate {
    func changeStatus(order: Order) {
        self.interactor?.changeOrderStatus(order)
    }
}

extension OrderDetailsViewController: OrderDetailsDisplayLogic {
    func updateOrder(_ order: Order) {
        self.order = order
        self.detailsTableView.reloadData()
        self.detailsTableView.layoutSubviews()
    }
}
