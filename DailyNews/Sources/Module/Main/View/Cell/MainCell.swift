import UIKit

final class MainCell: UITableViewCell {
    
    // MARK: - UIElements
    
    lazy var title: UILabel = {
        
        let label = UILabel()
        label.text = "Olimpic games"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    lazy var imageNews: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "news")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var numberОfviews: UILabel = {
        
        let label = UILabel()
        label.text = "News views : 89"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains

private extension MainCell {
    
    func addSubView() {
        contentView.addSubview(imageNews)
        contentView.addSubview(title)
        contentView.addSubview(numberОfviews)
        imageNews.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        numberОfviews.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageNews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            imageNews.widthAnchor.constraint(equalToConstant: 100),
            imageNews.heightAnchor.constraint(equalToConstant: 80),
            
            title.topAnchor.constraint(equalTo: imageNews.topAnchor),
            title.leadingAnchor.constraint(equalTo: imageNews.trailingAnchor,constant: 50),
            
            numberОfviews.topAnchor.constraint(equalTo: title.topAnchor,constant: 40),
            numberОfviews.leadingAnchor.constraint(equalTo: imageNews.trailingAnchor,constant: 50),
        ])
    }
}
