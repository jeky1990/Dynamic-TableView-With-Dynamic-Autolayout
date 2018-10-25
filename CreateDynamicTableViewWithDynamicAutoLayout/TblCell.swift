//
//  TblCell.swift
//  CreateDynamicTableViewWithDynamicAutoLayout
//
//  Created by macbook on 10/25/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class TblCell: UITableViewCell {
    
    
    let CellView : UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return view
    }()
    
    let FirstLabel : UILabel = {
        
        let attributedText = NSMutableAttributedString(string: "Read Carefully??", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 15)])
        let label = UILabel()
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete This Cell", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        return button
        
    }()
    
    let FourthButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add This Cell", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        return button
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        CreateUiView()
        CreateCellControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func CreateUiView()
    {
        
        self.addSubview(CellView)
        
        NSLayoutConstraint.activate([
            
            CellView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            CellView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            CellView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            CellView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5)
            
            ])
    }
    private func CreateCellControllers()
    {
        CellView.addSubview(FirstLabel)
        CellView.addSubview(secondLabel)
        CellView.addSubview(ThirdButton)
        CellView.addSubview(FourthButton)
        
        
        NSLayoutConstraint.activate([
            
            FirstLabel.leftAnchor.constraint(equalTo: CellView.leftAnchor, constant: 5),
            FirstLabel.rightAnchor.constraint(equalTo: CellView.rightAnchor, constant: -5),
            FirstLabel.topAnchor.constraint(equalTo: CellView.topAnchor, constant: 5),
            FirstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -5),
            
            secondLabel.leftAnchor.constraint(equalTo: CellView.leftAnchor, constant: 5),
            secondLabel.rightAnchor.constraint(equalTo: CellView.rightAnchor, constant: -5),
            secondLabel.topAnchor.constraint(equalTo: FirstLabel.bottomAnchor, constant: 5),
            secondLabel.bottomAnchor.constraint(equalTo: ThirdButton.topAnchor, constant: -5),
            
            ThirdButton.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 5),
            ThirdButton.bottomAnchor.constraint(equalTo: CellView.bottomAnchor, constant: -5),
            ThirdButton.leftAnchor.constraint(equalTo: CellView.leftAnchor, constant: 5),
            ThirdButton.widthAnchor.constraint(equalTo: CellView.widthAnchor, multiplier: 0.5),
            ThirdButton.rightAnchor.constraint(equalTo: FourthButton.leftAnchor, constant: -5),
            
            FourthButton.rightAnchor.constraint(equalTo: CellView.rightAnchor,constant: -5),
            FourthButton.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 5),
            FourthButton.bottomAnchor.constraint(equalTo: CellView.bottomAnchor, constant: -5),
            FourthButton.leftAnchor.constraint(equalTo: ThirdButton.rightAnchor, constant: 5)
            
        ])
    }
}
    

