import UIKit

final class MainCell: UITableViewCell {

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        castomizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }
    
//    private func castomizeCell () {
//
//        contentView.layer.borderColor = UIColor.gray.cgColor
//        contentView.layer.cornerRadius = 15
//        contentView.clipsToBounds = true
//        contentView.backgroundColor = .white
//
//    }
}