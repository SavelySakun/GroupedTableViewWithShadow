//import UIKit
//
//class TableView: UIVTableView {
//
//	let items = [
//		["Hello world", "Another Cell", "Wohooo"],
//		["42", "Mir Trud May"],
//		["I am so lonely cell"]]
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		title = "Table"
//		setupTableView()
//	}
//
//	private func setupTableView() {
//
//		backgroundColor = .systemGray6
//		register(Cell.self, forCellReuseIdentifier: Cell.identifier)
//
//		dataSource = self
//		delegate = self
//
//		tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1)) // hides empty cells
//
//		layer.masksToBounds = false
//
//		view.addSubview(tableView)
//		translatesAutoresizingMaskIntoConstraints = false
//
//		NSLayoutConstraint.activate([
//			tableView.topAnchor.constraint(equalTo: view.topAnchor),
//			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//			tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
//		])
//	}
//
//}
//
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		items[section].count
//	}
//
//	func numberOfSections(in tableView: UITableView) -> Int {
//		items.count
//	}
//
//	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//		let viewForSectionHeader = SectionView()
//		viewForSectionHeader.label.text = "Section \(section)"
//		return viewForSectionHeader
//	}
//
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell {
//			cell.setupCell(text: items[indexPath.section][indexPath.row], tableView: tableView, indexPath: indexPath)
//			return cell
//		}
//		return UITableViewCell()
//	}
//
//
//
//
//}
//
