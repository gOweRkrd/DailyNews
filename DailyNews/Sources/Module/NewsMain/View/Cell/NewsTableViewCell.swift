import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "NewsTableViewCell"

    // MARK: - UI Elements
    
     private var newsTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private var newsImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noPhoto")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Public Methods
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subtitle
        // image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            //fetch image
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}

// MARK: - Setup Constrains

private extension NewsTableViewCell {
    
    func addSubView() {
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(subTitleLabel)
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .leadingTrailingSize),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -.newsImageViewTrailingAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: .newsImageViewSizeAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: .newsImageViewSizeAnchor),
            
            newsTitleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            newsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: .leadingTrailingSize),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor,constant: -.leadingTrailingSize),

            subTitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.topAnchor,constant: .subTitleLabelTopAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: .leadingTrailingSize),
            subTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor,constant: -.leadingTrailingSize),
        ])
    }
}

// MARK: - Constant Constraints

extension CGFloat {
    static let leadingTrailingSize: CGFloat = 10
    static let newsImageViewTrailingAnchor: CGFloat = 20
    static let newsImageViewSizeAnchor: CGFloat = 130
    static let subTitleLabelTopAnchor: CGFloat = 65
}


