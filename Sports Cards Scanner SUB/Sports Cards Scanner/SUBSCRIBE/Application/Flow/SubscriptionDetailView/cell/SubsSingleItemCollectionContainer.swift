//
//  SubsSingleItemCollectionContainer.swift
//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 16.04.2024.
//

import UIKit

final class SubsSingleItemCollectionContainer: UICollectionViewCell {

    private let contentContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Poller One", size: 10)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(contentContainer)
        addSubview(cellImage)
        addSubview(cellLabel)

        prepareLayoutSubs()
    }

    func calculateContainer(_ content: SubsMainAdditionalContentVM?, isSelected: Bool) {

        cellLabel.text = content?.title.uppercased()
        cellLabel.layer.shadowColor = UIColor.black.cgColor
        cellLabel.textColor = isSelected ? .white : .gray
        cellLabel.layer.shadowRadius = 1
        cellImage.image = isSelected ? content?.selectedImage : content?.image
        contentContainer.backgroundColor = isSelected ? .gray : .darkGray
    }

    private func prepareLayoutSubs() {
        NSLayoutConstraint.activate([
            contentContainer.topAnchor.constraint(equalTo: topAnchor),
            contentContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 4.30),
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4.30),
            cellImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4.30),
            cellImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23.08),

            cellLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 6.84),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4.30),
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4.30),
            cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6.28)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
