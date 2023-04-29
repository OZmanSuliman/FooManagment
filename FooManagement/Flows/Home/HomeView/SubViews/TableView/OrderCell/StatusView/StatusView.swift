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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let views = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil),
            let view = views.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        setupView()
    }
}

extension StatusView {
    private func setupView() {
        containerView.backgroundColor = .systemGreen
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        statusLabel.text = "Delivered"
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
