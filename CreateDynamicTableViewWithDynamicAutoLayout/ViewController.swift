//
//  ViewController.swift
//  CreateDynamicTableViewWithDynamicAutoLayout
//
//  Created by macbook on 10/24/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let Tbl = UITableView()
    var arr = [1,2,3,4,5,6,7]
    var titleArr = ["We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in mind that even if you don’t use the demo content, you’ll be much better off than with most other themes since all of the customization options are done right from within the WordPress Customizer making it super easy to configure your site as compared to most of the typical admin panels. You will be pleasantly surprised how easy it is to setup and configure your site with X – with or without the demo content.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in mind.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in mind that even if you don’t use the demo content, you’ll be much better off than with most other themes since all of the cus content.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in mind that even if you don’t use the demo content, you’ll be much better off than with most other themes since to most of the typical admin panels. You will be pleasantly surprised how easy it is to setup and configure your site with X – with or without the demo content.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in are done right from within the WordPress Customizer making it super easy to configure your site as compared to most of the typical admin panels. You will be pleasantly surprised how easy it is to setup and configure your site with X – with or without the demo content.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure for your site is already built. Keep in mind that even if you don’t use the demo content, you’ll be much better off than with most t the demo content.","We all know how hard it can be to make a site look like the demo, so to make your start into the world of X as easy as possible we have included the demo content from our showcase site. Simply import the sample files we ship with the theme and the core structure options are done right from within the WordPress Customizer making it super easy to configure your site as compared to most of the typical admin panels. You will be pleasantly surprised how easy it is to setup and configure your site with X – with or without the demo content."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateTableView()
        
    }
    
    func CreateTableView()
    {
        Tbl.register(TblCell.classForCoder(), forCellReuseIdentifier: "cell")
        Tbl.delegate = self
        Tbl.dataSource = self
        Tbl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(Tbl)
        
        NSLayoutConstraint.activate([
            
            Tbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            Tbl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            Tbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Tbl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            ])
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TblCell
        let attributedText = NSMutableAttributedString(string: "\nRead Carefully??", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: "\nOnce Again", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),NSAttributedString.Key.foregroundColor:UIColor.red]))
        
        let label = UILabel()
        label.attributedText = attributedText
        
        cell.FirstLabel.text = String(arr[indexPath.row]) + label.text!
        cell.secondLabel.text = titleArr[indexPath.row]
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) : #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        cell.ThirdButton.addTarget(self, action: #selector(TapedButton), for: .touchUpInside)
        cell.ThirdButton.tag = indexPath.row

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
    @objc func TapedButton(sender:UIButton)
    {
        let index = IndexPath(row: sender.tag, section: 0)
        let cell = Tbl.cellForRow(at: index) as! TblCell
        if cell.ThirdButton.tag == index.row
        {
            arr.remove(at: index.row)
            titleArr.remove(at: index.row)
            Tbl.reloadData()
        }
    }
}

