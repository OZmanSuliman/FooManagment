//
//  HomeViewController.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

protocol HomeDisplayLogic {
    func displayOrders(_ orders: [Order])
}

class HomeViewController: UIViewController {
    @IBOutlet weak var headerView: HomeHeaderView!
    @IBOutlet weak var addOrderButton: AddOrderButtonView!
    @IBOutlet weak var ordersTableView: UITableView!
    var config = HomeConfiguration()
    var interactor: HomeBusinessLogic?
    var orders: [Order] = []
    var router: HomeRoutingLogic?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.fetchOrders()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension HomeViewController {
    func setupViews() {
        self.addOrderButton.delegate = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        self.ordersTableView.dataSource = self
        self.ordersTableView.delegate = self
        self.ordersTableView.registerNib(OrderCell.self)
        self.ordersTableView.registerNib(EmptyTableViewCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orders.count > 0 ?
        self.orders.count :
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.orders.count <= 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifierCell,
                                                           for: indexPath) as? EmptyTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: Strings.identifier.fullString())
            }
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifierCell,
                                                       for: indexPath) as? OrderCell else {
            return UITableViewCell(style: .default, reuseIdentifier: Strings.identifier.fullString())
        }
        cell.setupCell(order: self.orders[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: Strings.Delete.fullString()) { (action, view, completionHandler) in
            self.interactor?.removeOrder(self.orders[indexPath.row])
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: Strings.trash.fullString())
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard orders.count > 0 else { return }
        self.router?.navigateToDetails(order: orders[indexPath.row])
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HomeTableViewHeaderView.instanceFromNib()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.orders.count > 0 ?
        88 :
        200
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displayOrders(_ orders: [Order]) {
        self.orders = orders
        self.ordersTableView.reloadData()
    }
}

extension HomeViewController: OrderCellDelegate {
    func changeStatus(order: Order) {
        interactor?.changeOrderStatus(order)
    }
}

extension HomeViewController: AddOrderButtonDelegate {
    func addOrderHandler() {
        let randomDouble = Double.random(in: 0..<100)
        let randomDoubleWithThreeDigits = String(format: "%.2f", randomDouble)
        let order = Order(name: "\(Strings.order.fullString())\(orders.count + 1)", desc: "\(Strings.orderNumber.fullString())\(orders.count + 1)", image: Strings.StrawberryMilkshake.fullString(), status: 0, price: "\(Strings.aed.fullString()) \(randomDoubleWithThreeDigits)")
        interactor?.addOrder(order)
    }
}
