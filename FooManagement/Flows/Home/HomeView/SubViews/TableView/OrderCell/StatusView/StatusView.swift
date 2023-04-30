//
//  StatusView.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

class StatusView: UIView {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    var statusTapHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    class func instanceFromNib() -> StatusView {
        return (UINib(nibName: String(describing: StatusView.self),
                      bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? StatusView)!
    }
}

extension StatusView {
    func setupStatus(_ status: Int) {
        guard let status = Status(rawValue: status) else { return }
        let statusString = String(describing: status)
        statusLabel.text = statusString
        containerView.backgroundColor = UIColor(named: statusString)
    }
    
    private func setupView() {
        containerView.backgroundColor = .systemGreen
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        statusLabel.textColor = .white
        addGestureRecognizers()
    }
    
    private func addGestureRecognizers() {
          // Create tap gesture recognizer
          let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
          // Add recognizer to view
          addGestureRecognizer(tapGestureRecognizer)
      }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        statusTapHandler?()
    }
}
