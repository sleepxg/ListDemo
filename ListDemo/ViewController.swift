//
//  ViewController.swift
//  ListDemo
//
//  Created by PCPSW_012 on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {

    var cellCount : Int = 1
    var myCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.lightGray
        view.isUserInteractionEnabled = true
        
        addBarButton()
        addCollectionView()
        
    }

    func addBarButton(){
        let addBarBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCell))
        let removeBarBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(removeCell))
        navigationItem.leftBarButtonItem = addBarBtn
        navigationItem.rightBarButtonItem = removeBarBtn
        //title = "\(cellCount)"
    }
    
    func addCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        var naviHeight : CGFloat = (navigationController?.navigationBar.frame.height ?? 0)
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top ?? 0
//            let bottomPadding = window?.safeAreaInsets.bottom ?? 0
            naviHeight+=topPadding
            //naviHeight+=bottomPadding
        }
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: naviHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - naviHeight), collectionViewLayout: layout)
        //print("view height = \(view.frame.height)    navi height = \(navigationController?.navigationBar.frame.height ?? 0)")
        myCollectionView?.register(DemoCell.self, forCellWithReuseIdentifier: "MyCell1")
        myCollectionView?.register(DemoCell.self, forCellWithReuseIdentifier: "MyCell2")
        myCollectionView?.register(DemoCell.self, forCellWithReuseIdentifier: "MyCell3")
        myCollectionView?.register(DemoCell.self, forCellWithReuseIdentifier: "MyCell5")
        myCollectionView?.register(DemoCell.self, forCellWithReuseIdentifier: "MyCelld")
        myCollectionView?.backgroundColor = UIColor.white
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.isUserInteractionEnabled = true
        myCollectionView?.isScrollEnabled = true
        myCollectionView?.isUserInteractionEnabled = true
        view.addSubview(myCollectionView!)
    }
    
    
    @objc func addCell(){
        cellCount+=1
        myCollectionView?.reloadData()
        //print("now cell count is \(cellCount)")
        //title = "\(cellCount)"
    }

    @objc func removeCell(){
        cellCount-=1
        cellCount = cellCount>0 ? cellCount : 0
        myCollectionView?.reloadData()
        //print("now cell count is \(cellCount)")
        //title = "\(cellCount)"
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DemoCell
        
        switch cellCount {
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell1", for: indexPath) as! DemoCell
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath) as! DemoCell
        case 3...4:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell3", for: indexPath) as! DemoCell
        case 5...6:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell5", for: indexPath) as! DemoCell
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCelld", for: indexPath) as! DemoCell
        }
        
        if (indexPath.row%3==0) {
            cell.ledView?.backgroundColor = UIColor.yellow
            cell.alarmViewUpdate(type: .None)
        } else if(indexPath.row%3==1){
            cell.ledView?.backgroundColor = UIColor.orange
            cell.alarmViewUpdate(type: .High)
        }
        else {
            cell.ledView?.backgroundColor = UIColor.systemPink
            cell.alarmViewUpdate(type: .Low)
        }

        cell.nameLabel?.text = "this is row \(indexPath.row)"
        cell.minuteLable?.text = "\(indexPath.row) minutes"
        cell.tempLabel?.text = "\(Double(indexPath.row)+30.5)"
        cell.maxTempLabel?.text = "\(Double(indexPath.row)+40.5)"
        cell.minTempLabel?.text = "\(Double(indexPath.row)+10.5)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("select at \(indexPath.row)")
        let vc = DetailViewController(someInt: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var cellWidth : CGFloat
        var cellHeight : CGFloat

        switch cellCount {
        case 1:
            cellWidth = collectionView.bounds.width-2
            cellHeight = collectionView.bounds.height-2
        case 2:
            cellWidth = collectionView.frame.width-2
            cellHeight = collectionView.frame.height/2.0
        case 3...4:
            cellWidth = collectionView.frame.width/2.0
            cellHeight = collectionView.frame.height/2.0
        case 5...6:
            cellWidth = collectionView.frame.width/2.0
            cellHeight = collectionView.frame.height/3.0
        default:
            cellWidth = collectionView.frame.width/2.0
            cellHeight = collectionView.frame.height/4.0
        }

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

