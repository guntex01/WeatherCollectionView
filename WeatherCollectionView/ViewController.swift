//
//  ViewController.swift
//  WeatherCollectionView
//
//  Created by guntex01 on 5/27/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage( named: "canh")
        // imageView.contenMode = .scaleAspectFill
        imageView.frame =  CGRect(x: 0, y: 0, width: 330, height: 200)
        imageView.layer.opacity = 0.1
        return imageView
    }()
    let labelHanoi = UILabel()
    let labelCloudy = UILabel()
    let label29 = UILabel()
    let topCollectionView: UICollectionView = {
        
        // khởi tạo flowLayout
        // Flow layout là một dạng line-based layout
        // layout object sẽ sắp xếp các items trên một hàng, và tính toán làm sao để có thể chứa càng nhiều items trên hàng đó càng tốt. Tới khi không còn thể nhét thêm bất cứ item nào nữa thì nó sẽ tạo ra một hàng mới và bắt đầu lặp lại công việc này cho đến khi hết tất cả items
        let layout = UICollectionViewFlowLayout()
        
        // khởi tạo collectionView truyền vào layout vừa khởi tạo ở trên
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        
        // tắt phụ thuộc của control vào frame, auto lauout sẽ không có tác dụng nếu thuộc tính này = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // đổ màu collectionView
        collectionView.backgroundColor = UIColor.clear
        
        // đăng ký cell với collectionView
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "topCell")
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        
        return collectionView
    }()
    let bottomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "bottomCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        
        return collectionView
    }()
    // khởi tạo mảng Foody
    var weathers = [Weather]()
    var weathers1 = [(Weather1)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        
        layoutImage()
        setupData()
        setupData2()
        labelLayout()
        layotTopCollectionView()
        layoutBottomCollectionView()
        
    }
    func layoutImage(){
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
    }
    func labelLayout(){
        view.addSubview(labelHanoi)
        view.addSubview(labelCloudy)
        view.addSubview(label29)
        
        labelHanoi.text = "Hanoi"
        labelCloudy.text = "Cloudy"
        label29.text = "29°"
        
        labelHanoi.textAlignment = .center
        labelHanoi.font = UIFont.systemFont(ofSize: 35)
        labelHanoi.translatesAutoresizingMaskIntoConstraints = false
        labelHanoi.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        labelHanoi.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        labelHanoi.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        labelHanoi.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        
        labelCloudy.textAlignment = .center
        labelCloudy.font = UIFont.systemFont(ofSize: 15)
        labelCloudy.translatesAutoresizingMaskIntoConstraints = false
        labelCloudy.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        labelCloudy.topAnchor.constraint(equalTo: labelHanoi.bottomAnchor, constant: 5).isActive = true
        labelCloudy.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        labelCloudy.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        
        label29.textAlignment = .center
        label29.font = UIFont.systemFont(ofSize: 100)
        label29.translatesAutoresizingMaskIntoConstraints = false
        label29.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        label29.topAnchor.constraint(equalTo: labelCloudy.bottomAnchor, constant: 10).isActive = true
        label29.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        label29.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
    }
    
    // hàm layout cho collectionView
    func layotTopCollectionView(){
        view.addSubview(topCollectionView)
        topCollectionView.translatesAutoresizingMaskIntoConstraints = false
        topCollectionView.topAnchor.constraint(equalTo: label29.bottomAnchor, constant: 40).isActive = true
        topCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        topCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    func layoutBottomCollectionView(){
        view.addSubview(bottomCollectionView)
        bottomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomCollectionView.topAnchor.constraint(equalTo: topCollectionView.bottomAnchor, constant: 0).isActive = true
        bottomCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        bottomCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    // hàm tạo dữ liệu
    func setupData(){
        
        let hot1 = Weather(imageName: "may", textLabelTop: "Now", textLabelBottom: "25")
        let hot2 = Weather(imageName: "may", textLabelTop: "17", textLabelBottom: "26°")
        let hot3 = Weather(imageName: "nang", textLabelTop: "18", textLabelBottom: "31°")
        let hot4 = Weather(imageName: "may", textLabelTop: "19", textLabelBottom: "26°")
        let hot5 = Weather(imageName: "bt", textLabelTop: "20", textLabelBottom: "29°")
        let hot6 = Weather(imageName: "may", textLabelTop: "21", textLabelBottom: "23°")
        let hot7 = Weather(imageName: "may", textLabelTop: "22", textLabelBottom: "22°")
        let hot8 = Weather(imageName: "bt", textLabelTop: "23", textLabelBottom: "28°")
        let hot9 = Weather(imageName: "nang", textLabelTop: "30", textLabelBottom: "28°")
        let hot10 = Weather(imageName: "may", textLabelTop: "25", textLabelBottom: "25°")
        
        
        weathers = [hot1, hot2, hot3, hot4, hot5, hot6, hot7, hot8, hot9, hot10]
    }
    func setupData2(){
        
        let h1 = Weather1(imageName: "may", textLabelLeft: "Thursday", textLabelRight: "32", textLabelRight1: "24")
        let h2 = Weather1(imageName: "may", textLabelLeft: "Friday", textLabelRight: "33", textLabelRight1: "26")
        let h3 = Weather1(imageName: "may", textLabelLeft: "Saturday", textLabelRight: "36", textLabelRight1: "28")
        let h4 = Weather1(imageName: "may", textLabelLeft: "Sunday", textLabelRight: "37", textLabelRight1: "28")
        let h5 = Weather1(imageName: "may", textLabelLeft: "Monday", textLabelRight: "37", textLabelRight1: "27")
        let h6 = Weather1(imageName: "may", textLabelLeft: "Tuesday", textLabelRight: "36", textLabelRight1: "27")
        let h7 = Weather1(imageName: "may", textLabelLeft: "Wednesday", textLabelRight: "34", textLabelRight1: "27")
        let h8 = Weather1(imageName: "may", textLabelLeft: "Thursday", textLabelRight: "32", textLabelRight1: "27")
        let h9 = Weather1(imageName: "may", textLabelLeft: "Friday", textLabelRight: "32", textLabelRight1: "27")
        
        
        weathers1 = [h1, h2, h3, h4, h5, h6, h7, h8, h9]
    }
    
}
// viết extension cho class MainViewController:
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bottomCollectionView {
            return weathers1.count
        }else{
            return weathers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bottomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! SecondCollectionViewCell
            cell.weather1 = weathers1[indexPath.row]
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! MyCollectionViewCell
            cell.weather = weathers[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bottomCollectionView {
            // tính kích thước size một cạnh của item
            let size1 = ((collectionView.frame.size.height))
            return CGSize(width: size1, height: 40)
        }else{
            
            let size = ((collectionView.frame.size.height ) )
            return CGSize(width: 60, height: size)
        }
    }
    
    
    
    
}
