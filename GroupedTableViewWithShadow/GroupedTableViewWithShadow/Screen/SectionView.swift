//
//  SectionView.swift
//  GroupedTableViewWithShadow
//
//  Created by Savely Sakun on 21.03.2021.
//

import UIKit

class SectionView: UIView {

	let label = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSection()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupSection() {
		let padding: CGFloat = 12.0
		addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: topAnchor, constant: padding + 10),
			label.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
			label.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding)
		])
	}

}
