import UIKit

class ViewController: UIViewController {

	let tableView = UITableView()
	let items = [
		["Hello world", "Another Cell", "Wohooo"],
		["42", "Mir Trud May"],
		["I am so lonely cell"]]

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Table"
		setupTableView()
	}

	private func setupTableView() {
		view.backgroundColor = .systemGray6
		tableView.backgroundColor = .systemGray6
		tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)

		tableView.dataSource = self
		tableView.delegate = self
		
		tableView.layer.masksToBounds = false

		tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1)) // hides empty cells

		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24)
		])
	}

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items[section].count
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		items.count
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let viewForSectionHeader = SectionView()
		viewForSectionHeader.label.text = "Section \(section)"
		return viewForSectionHeader
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell {
			cell.setupCell(text: items[indexPath.section][indexPath.row], tableView: tableView, indexPath: indexPath)
			return cell
		}
		return UITableViewCell()
	}




}

