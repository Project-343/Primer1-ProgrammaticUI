//
//  ViewController.swift
//  ITP342X-Primer1-ProgrammaticUI
//
//  Created by Boyuan Xu on 9/29/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .systemBackground
        let mainView = ExampleContainerView()
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

class ExampleContainerView: UIView {
    
    @objc func trigger(sender: UITapGestureRecognizer) {
        print("triggered")
    }
    
    lazy var label: UILabel = {
        let l = UILabel()
        l.text = "USC is worth $60k per year."
        l.numberOfLines = 0
        l.font = .italicSystemFont(ofSize: 16)
        l.sizeToFit()
        return l
    }()
    
    lazy var imageView: UIImageView = {
        let uiv = UIImageView(image: #imageLiteral(resourceName: "USC_CoverImage-1068x712"))
        uiv.contentMode = .scaleAspectFill
        uiv.isUserInteractionEnabled = true
        uiv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trigger(sender:))))
        uiv.clipsToBounds = true
        return uiv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: 0),
        ])
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])

    }
    
}
