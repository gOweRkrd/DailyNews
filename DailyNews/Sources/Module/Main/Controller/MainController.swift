import UIKit

final class MainController: UIViewController {
   
    // MARK: - Properties
    
    private let mainView = MainView()

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Daily News"
        
        setupDelegate()
    }
    
    // MARK: - Private Method
    
    private func setupDelegate() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

extension MainController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainCell else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
//        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension MainController: UITableViewDelegate {
            
        }
    

