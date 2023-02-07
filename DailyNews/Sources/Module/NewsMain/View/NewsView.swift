import UIKit

final class NewsView: UIView {

    // MARK: - Properties

    var tableView: UITableView = {

        let tableView = UITableView()
        return tableView
    }()
    
    var refreshControl: UIRefreshControl = {

        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: R.NewsView.refreshControl)
        return refreshControl
    }()
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = Color.mainBackgroundWhite

        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)

        addSubView()
        setupConstraints()
        tableView.addSubview(refreshControl)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension NewsView {

    func addSubView() {
        self.addSubviews([tableView])
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: .tableViewTopAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - Constant Constraints

extension CGFloat {
    static let tableViewTopAnchor: CGFloat = 100
}
