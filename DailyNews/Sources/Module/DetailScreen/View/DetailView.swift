import UIKit

final class DetailView: UIView {
    
    // MARK: - UI Elements
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    lazy var detailTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    lazy var detailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noPhoto")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var detailSubTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 10
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var dateOfpublicationLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var autorLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var urlLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension DetailView {
    
    func addSubView() {
        addSubview(detailTitleLabel)
        addSubview(detailImageView)
        addSubview(detailSubTitleLabel)
        addSubview(dateOfpublicationLabel)
        addSubview(autorLabel)
        addSubview(urlLabel)
        
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfpublicationLabel.translatesAutoresizingMaskIntoConstraints = false
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            detailTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:100),
            detailTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            detailTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            detailImageView.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 25),
            detailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailImageView.widthAnchor.constraint(equalToConstant: 350),
            detailImageView.heightAnchor.constraint(equalToConstant: 250),
            
            autorLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant:20),
            autorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            autorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            dateOfpublicationLabel.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant:10),
            dateOfpublicationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dateOfpublicationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            detailSubTitleLabel.topAnchor.constraint(equalTo: dateOfpublicationLabel.bottomAnchor, constant:30),
            detailSubTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            detailSubTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            urlLabel.topAnchor.constraint(equalTo: detailSubTitleLabel.bottomAnchor, constant:20),
            urlLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            urlLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
    }
}


// MARK: - Constant Constraints

private extension CGFloat {
    
    static let imageViewAnchor: CGFloat = 30
    static let topAnchor: CGFloat = 10
    static let trailingMargin: CGFloat = -10
}

