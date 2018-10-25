//
//  PageViewController.swift
//  CreateDynamicTableViewWithDynamicAutoLayout
//
//  Created by macbook on 10/25/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    let NavigationBar = UINavigationBar()
    
    let PrevButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
        
    }()
    
    let NextButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return button
        
    }()
    
    let PageControl : UIPageControl = {
        
        let pagecontrol = UIPageControl()
        pagecontrol.currentPage = 0
        pagecontrol.numberOfPages = 4
        pagecontrol.currentPageIndicatorTintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        pagecontrol.translatesAutoresizingMaskIntoConstraints = false
        pagecontrol.pageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return pagecontrol
    }()
    
    let Firstlabel : UILabel = {
        
        let label = UILabel()
        label.text = "jkdfhskjdhfsdhjf kjdfakjsflkjasf ladjksfasjdf alkjfsajdf alkjsfa ajkhsfkjas fajsaljkfjk fjalkjslkjf alkjsdkjasf alkjdfa "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 0
        return label
        
    }()
    
    let Secondlabel : UILabel = {
        
        let label = UILabel()
        label.text = "jkdfhskjdhfsdhjf kjdfakjsflkjasf ladjksfasjdf alkjfsajdf alkjsfa"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 0
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateNavigationBar()
        GiveConstraint()
        
    }
    
    func CreateNavigationBar()
    {
        NavigationBar.translatesAutoresizingMaskIntoConstraints = false
        let NavItem = UINavigationItem(title: "Page Controller")
        NavigationBar.items = [NavItem]
        let LeftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.Back))
        NavItem.leftBarButtonItem = LeftBarButtonItem
        self.view.addSubview(NavigationBar)
        
        NSLayoutConstraint.activate([
            
            NavigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            NavigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            NavigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            NavigationBar.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    @objc func Back(sender:UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func GiveConstraint()
    {
        let stackview = UIStackView(arrangedSubviews: [PrevButton,PageControl,NextButton])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        self.view.addSubview(stackview)
        self.view.addSubview(Firstlabel)
        self.view.addSubview(Secondlabel)
    
        NSLayoutConstraint.activate([

            stackview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 50),
            
            
            Firstlabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant:20),
            Firstlabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant:150),
            Firstlabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            Secondlabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant:20),
            Secondlabel.topAnchor.constraint(equalTo: self.Firstlabel.bottomAnchor,constant:30),
            Secondlabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ])
    }
}
