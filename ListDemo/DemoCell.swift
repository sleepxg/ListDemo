//
//  DemoCell.swift
//  ListDemo
//
//  Created by PCPSW_012 on 2020/12/31.
//

import Foundation
import UIKit

class DemoCell: UICollectionViewCell {
    
    var ledView:UIView?
    var nameLabel:UILabel?
    var minuteLable:UILabel?
    var tempLabel:UILabel?
    let space:CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetting()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cellSetting()
    }
    
    func cellSetting(){
        self.isUserInteractionEnabled = true
        cellBorder()
        ledViewSetting()
        nameLabelSetting()
        minuteLabelSetting()
        //tempLabelSetting()
    }
    
    func cellBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func ledViewSetting(){
        let view = UIView()
        ledView = view
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
        
    func nameLabelSetting(){
        let label = UILabel()
        nameLabel = label
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: ledView!.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: space).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func minuteLabelSetting(){
        let blackView = UIView()
        blackView.backgroundColor = UIColor.black
        contentView.addSubview(blackView)
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        blackView.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: contentView.frame.width-2*space).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        let label = UILabel()
        minuteLable = label
        label.textAlignment = .right
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: blackView.bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: blackView.trailingAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func tempLabelSetting(){
        let label = UILabel()
        tempLabel = label
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 40)
        label.backgroundColor = UIColor.systemOrange
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: minuteLable!.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
    }
}
