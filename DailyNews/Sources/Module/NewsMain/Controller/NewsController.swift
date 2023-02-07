import SafariServices
import UIKit

final class NewsController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModels = [NewsTableViewCellViewModel]()
    private var articles = [Article]()
    private let mainView = NewsView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.NewsController.title
        
        setupDelegate()
        fetchTopStories()
        addedTarget()
    }
    
    // MARK: - Private Methods
    
    private func setupDelegate() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func addedTarget() {
        mainView.refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        mainView.tableView.reloadData()
        sender.endRefreshing()
    }
    
    // fetch data
    private func fetchTopStories() {
        NetworkManager.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.viewModels = articles.compactMap { article in
                    NewsTableViewCellViewModel(
                        title: article.title,
                        subtitle: article.description ?? R.NewsController.subtitle,
                        imageURL: URL(string: article.urlToImage ?? "")
                    )
                }
                
                DispatchQueue.main.async {
                    self?.mainView.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

// MARK: - TableViewDataSource

extension NewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.identifier, for: indexPath
        ) as? NewsTableViewCell else {
            fatalError("Failed to dequeue NewsTableViewCell.")
        }
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DetailController()
        detailVC.data = articles[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - TableViewDelegate

extension NewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
