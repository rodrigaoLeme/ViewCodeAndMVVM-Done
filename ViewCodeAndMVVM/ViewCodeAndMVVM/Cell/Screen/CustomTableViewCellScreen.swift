//
//  CustomTableViewCellScreen.swift
//  ViewCodeAndMVVM
//
//  Created by IATec - Rodrigo Leme on 14/07/22.
//

import UIKit

class CustomTableViewCellScreen: UIView {
    
    lazy var leftStackView: UIStackView = {
        let stackview = UIStackView(frame: .zero)
        stackview.alignment = .fill
        stackview.spacing = 0
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var middleStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.alignment = .fill
        stackview.spacing = 0
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    lazy var rightStackView: UIStackView = {
        let stackview = UIStackView(frame: .zero)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 0
        stackview.axis = .vertical
        return stackview
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.leftStackView, self.middleStackView, self.rightStackView])
        stackView.alignment = .top
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.leftStackView.addArrangedSubview(self.userImageView)
        self.middleStackView.addArrangedSubview(self.nameLabel)
        self.middleStackView.addArrangedSubview(self.ageLabel)
        self.middleStackView.addArrangedSubview(self.professionLabel)
        self.middleStackView.addArrangedSubview(self.salaryLabel)
        self.rightStackView.addArrangedSubview(self.heartButton)
        self.addSubview(self.mainStackView)
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            self.mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            
            self.leftStackView.topAnchor.constraint(equalTo: self.mainStackView.topAnchor),
            self.leftStackView.leadingAnchor.constraint(equalTo: self.mainStackView.leadingAnchor),
            self.leftStackView.bottomAnchor.constraint(equalTo: self.mainStackView.bottomAnchor),
            self.leftStackView.widthAnchor.constraint(equalToConstant: 128),
            
            self.middleStackView.topAnchor.constraint(equalTo: self.mainStackView.topAnchor),
            self.middleStackView.bottomAnchor.constraint(equalTo: self.mainStackView.bottomAnchor),
            self.middleStackView.leadingAnchor.constraint(equalTo: self.leftStackView.trailingAnchor),
            
            self.rightStackView.topAnchor.constraint(equalTo: self.mainStackView.topAnchor),
            self.rightStackView.trailingAnchor.constraint(equalTo: self.mainStackView.trailingAnchor),
            self.rightStackView.widthAnchor.constraint(equalToConstant: 22),
            self.rightStackView.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
}
