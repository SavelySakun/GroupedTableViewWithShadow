import UIKit

class Cell: UITableViewCell {

	static let identifier = "Cell"

	private let label = UILabel()

	// We need this props to configure offsets and shadowPath for cell shadow
	var isFirstRow = false
	var isLastRow = false

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .clear
		configureCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		contentView.backgroundColor = .white
		setShadow()
	}

	private func configureCell() {
		let padding: CGFloat = 16.0
		contentView.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
			label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
			label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding)
		])
	}

	func setupCell(text: String, tableView: UITableView, indexPath: IndexPath) {
		label.text = text
		isFirstRow = (indexPath.row == 0)
		isLastRow = (indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1))
	}
}

// Shadow configuration
extension Cell {
	func setShadow() {

		let cornerRadius: CGFloat = 8
		let offsetValue: CGFloat = 20.0
		var shadowOffset = CGSize(width: 0, height: -offsetValue)
		var shadowRect = contentView.frame
		let isSingleRow = isFirstRow && isLastRow

		if isSingleRow {
			shadowOffset.height = 0
			roundCornersOfView(contentView,
												 corners:[.bottomLeft, .bottomRight, .topLeft, .topRight],
												 radius: cornerRadius)

		} else {
			if isFirstRow {
				shadowRect = CGRect(x: 0, y: 0,
														width: shadowRect.width,
														height: shadowRect.height - offsetValue)

				shadowOffset.height = 0
				roundCornersOfView(contentView,
													 corners: [.topLeft, .topRight],
													 radius: cornerRadius)

			} else if isLastRow {
				shadowRect = CGRect(x: 0, y: 0,
														width: shadowRect.width,
														height: shadowRect.height + offsetValue)

				roundCornersOfView(contentView,
													 corners: [.bottomLeft, .bottomRight],
													 radius: cornerRadius)

			}
		}

		let shadowPath = CGPath(rect: shadowRect, transform: nil)
		addShadowTo(contentView, offset: shadowOffset, shadowPath: shadowPath)
	}

	func addShadowTo(_ view: UIView, offset: CGSize? = .zero, shadowPath: CGPath? = nil) {

		view.layer.masksToBounds = false
		view.layer.shadowColor = UIColor.lightGray.cgColor
		view.layer.shadowOpacity = 0.4
		view.layer.shadowOffset = offset ?? .zero
		view.layer.shadowRadius = 8
		if let shadowPath = shadowPath {
			view.layer.shadowPath = shadowPath
		}
	}

}

// Round corners
extension Cell {

	enum CornerPosition {
		case topLeft
		case topRight
		case bottomLeft
		case bottomRight
	}

	func roundCornersOfView(_ view: UIView, corners: [CornerPosition], radius: CGFloat) {
		var maskedCorners = CACornerMask()
		corners.forEach { (cornerPosition) in
			switch cornerPosition {
			case .topLeft:
				maskedCorners.insert(.layerMinXMinYCorner)
			case .topRight:
				maskedCorners.insert(.layerMaxXMinYCorner)
			case .bottomLeft:
				maskedCorners.insert(.layerMinXMaxYCorner)
			case .bottomRight:
				maskedCorners.insert(.layerMaxXMaxYCorner)
			}
		}
		view.clipsToBounds = true
		view.layer.cornerRadius = radius
		view.layer.maskedCorners = maskedCorners
	}

}
