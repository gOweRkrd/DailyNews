import UIKit
import SafariServices

final class NewsController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModels = [NewsTableViewCellViewModel]()
    private var articles = [Article]()
    private let mainView = NewsView()

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Daily News"

        setupDelegate()
        fetchTopStories()
    }
    
    // MARK: - Private Methods
    
    private func setupDelegate() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    // fetch data
    private func fetchTopStories() {
        
        NetworkService.shared.getTopStories { [weak self ] result in
            switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.viewModels = articles.compactMap({
                        NewsTableViewCellViewModel(
                            title: $0.title,
                            subtitle: $0.description ?? "No Description",
                            imageURL: URL(string: $0.urlToImage ?? "")
                        )
                    })
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
       guard  let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.identifier,
            for: indexPath
        ) as? NewsTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
        // go to the news site
        guard let url = URL(string: article.url ?? "") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc,animated: true)
    }
}

// MARK: - TableViewDelegate

extension NewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

