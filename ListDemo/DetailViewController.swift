//
//  DetailViewController.swift
//  ListDemo
//
//  Created by PCPSW_012 on 2021/1/7.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let someInt: Int
    var ledView:UIView?
    var deviceLabel:UILabel?
    var timeLabel:UILabel?
    var tempLabel:UILabel?
    var maxTempLabel:UILabel?
    var maxTimeLabel:UILabel?
    var minTempLabel:UILabel?
    var minTimeLabel:UILabel?
    var alarmLabel:UILabel?
    
    init(someInt: Int) {
        self.someInt = someInt
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewSetting()
    }
    
    
    func detailViewSetting(){
        view.backgroundColor = UIColor.white
        
        let barItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(settingBtn))
        navigationItem.rightBarButtonItem = barItem
        
        ledViewSetting()
        deviceLabelSetting()
        timeLabelSetting()
        tempLabelSetting()
        alarmViewSetting()
    }
    
    @objc func settingBtn(){
        print("setting click")
    }
    
    func ledViewSetting(){
        let led = UIView()
        ledView = led
        led.backgroundColor = UIColor.green
        view.addSubview(led)
        led.translatesAutoresizingMaskIntoConstraints = false
        led.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        led.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.02).isActive = true
        led.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        if #available(iOS 11.0, *) {
            led.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            led.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        }
    }
    
    func deviceLabelSetting(){
        let label = UILabel()
        deviceLabel = label
        label.text = "~~~~~~~~~~~~~~\(someInt)"
        label.textAlignment = .left
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: ledView!.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func timeLabelSetting(){
        let underLine = UIView()
        underLine.backgroundColor = UIColor.black
        view.addSubview(underLine)
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.topAnchor.constraint(equalTo: deviceLabel!.bottomAnchor).isActive = true
        underLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        underLine.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        underLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let label = UILabel()
        timeLabel = label
        label.text = "\(someInt) minutes~"
        label.textAlignment = .right
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: underLine.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: underLine.rightAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func tempLabelSetting(){
        let label = UILabel()
        tempLabel = label
        label.text = "\(someInt).99"
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: timeLabel!.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        let unitLabel = UILabel()
        unitLabel.text = "℃"
        unitLabel.textAlignment = .center
        view.addSubview(unitLabel)
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        unitLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        unitLabel.leftAnchor.constraint(equalTo: label.rightAnchor).isActive = true
        unitLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    }
    
    func alarmViewSetting(){
        let leftView = UIView()
        leftView.layer.borderWidth = 1
        leftView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.topAnchor.constraint(equalTo: tempLabel!.bottomAnchor).isActive = true
        leftView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        leftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        leftView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        let blackLine = UIView()
        blackLine.backgroundColor = UIColor.black
        leftView.addSubview(blackLine)
        blackLine.translatesAutoresizingMaskIntoConstraints = false
        blackLine.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        blackLine.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        blackLine.widthAnchor.constraint(equalTo: leftView.widthAnchor, multiplier: 0.9).isActive = true
        blackLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let maxLabel = UILabel()
        maxLabel.text = "MAX"
        maxLabel.textAlignment = .left
        leftView.addSubview(maxLabel)
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        maxLabel.leftAnchor.constraint(equalTo: blackLine.leftAnchor).isActive = true
        maxLabel.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        maxLabel.bottomAnchor.constraint(equalTo: blackLine.topAnchor).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let minLabel = UILabel()
        minLabel.text = "MIN"
        minLabel.textAlignment = .left
        leftView.addSubview(minLabel)
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        minLabel.leftAnchor.constraint(equalTo: blackLine.leftAnchor).isActive = true
        minLabel.topAnchor.constraint(equalTo: blackLine.bottomAnchor).isActive = true
        minLabel.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
        minLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let label1 = UILabel()
        maxTempLabel = label1
        label1.text = "88.8℃"
        leftView.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leftAnchor.constraint(equalTo: maxLabel.rightAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        label1.bottomAnchor.constraint(equalTo: blackLine.topAnchor).isActive = true
        label1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let label2 = UILabel()
        minTempLabel = label2
        label2.text = "11.1℃"
        leftView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.leftAnchor.constraint(equalTo: maxLabel.rightAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: blackLine.bottomAnchor).isActive = true
        label2.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
        label2.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let label3 = UILabel()
        maxTimeLabel = label3
        label3.text = "2017/02/30 08:08"
        label3.textAlignment = .right
        leftView.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.rightAnchor.constraint(equalTo: blackLine.rightAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        label3.bottomAnchor.constraint(equalTo: blackLine.topAnchor).isActive = true
        label3.widthAnchor.constraint(equalToConstant: 150).isActive = true
    
        let label4 = UILabel()
        minTimeLabel = label4
        label4.text = "2017/04/31 17:17"
        label4.textAlignment = .right
        leftView.addSubview(label4)
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.rightAnchor.constraint(equalTo: blackLine.rightAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: blackLine.bottomAnchor).isActive = true
        label4.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
        label4.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        let alarmLbl = UILabel()
        alarmLbl.text = "Alarm"
        alarmLbl.textAlignment = .center
        alarmLbl.layer.borderWidth = 1
        alarmLbl.layer.borderColor = UIColor.black.cgColor
        view.addSubview(alarmLbl)
        alarmLbl.translatesAutoresizingMaskIntoConstraints = false
        alarmLbl.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        alarmLbl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        alarmLbl.leftAnchor.constraint(equalTo: leftView.rightAnchor).isActive = true
        //alarmLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
    
        let label5 = UILabel()
        alarmLabel = label5
        label5.layer.borderColor = UIColor.black.cgColor
        label5.layer.borderWidth = 1
        label5.textColor = UIColor.white
        label5.text = "Hi"
        label5.textAlignment = .center
        label5.backgroundColor = UIColor.systemRed
        view.addSubview(label5)
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.topAnchor.constraint(equalTo: alarmLbl.bottomAnchor).isActive = true
        label5.leftAnchor.constraint(equalTo: leftView.rightAnchor).isActive = true
        label5.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label5.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
    }
}
