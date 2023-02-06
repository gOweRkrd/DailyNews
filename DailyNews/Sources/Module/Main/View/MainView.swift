//import UIKit
//
//final class MainView: UIView {
//    
//    // MARK: - Properties
//    
//    let tableView = UITableView(frame: .zero, style: .plain)
//  
//    // MARK: - Lifecycle
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        
//        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 150
//        addSybView()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//}
//
//// MARK: - Setup Constrains
//
//extension MainView {
//    
//    func addSybView() {
//        addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//    }
//    
//    func setupConstraints() {
//        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: .tableViewTopAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//    }
//}
//
//// MARK: - Constant Constraints
//
//extension CGFloat {
//    static let tableViewTopAnchor: CGFloat = 100
//}
//
//
//
