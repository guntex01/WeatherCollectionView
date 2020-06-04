//
//  SecondCollectionViewCell.swift
//  WeatherCollectionView
//
//  Created by guntex01 on 6/4/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    // khởi tạo containerView
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    // khởi tạo imageView
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    // khởi tạo title
    let titleLabelLeft: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        return label
    }()
    let titleLabelRight: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        return label
    }()
    let titleLabelRight1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        return label
    }()
    func setupLayout(){
            addSubview(containerView)
            containerView.addSubview(titleLabelLeft)
            containerView.addSubview(photoImageView)
            containerView.addSubview(titleLabelRight)
            containerView.addSubview(titleLabelRight1)
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
            
            titleLabelLeft.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
            titleLabelLeft.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
            titleLabelLeft.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4).isActive = true
            
            
            photoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            photoImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            titleLabelRight.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
            titleLabelRight.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 120).isActive = true
            titleLabelRight.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
            titleLabelRight1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
            titleLabelRight1.leftAnchor.constraint(equalTo: titleLabelRight.rightAnchor, constant: 5).isActive = true
            titleLabelRight1.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
            titleLabelRight1.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
            
    }
    
        
        // khởi tạo biến food kiểu Foody
        var weather1: Weather1?{
            // câu lệnh bên trong didSet chỉ được gọi khi biến food đã được gán giá trị
            didSet{
                if let hot = weather1 {
                    photoImageView.image = UIImage(named: hot.imageName)
                    titleLabelLeft.text = hot.textLabelLeft
                    titleLabelRight.text = hot.textLabelRight
                    titleLabelRight1.text = hot.textLabelRight1
                }
            }
        }
        
        // khởi tạo cell
        override init(frame: CGRect) {
            super.init(frame: frame)

            setupLayout()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
