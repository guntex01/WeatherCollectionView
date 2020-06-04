//
//  MyCollectionViewCell.swift
//  WeatherCollectionView
//
//  Created by guntex01 on 5/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
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
        let titleLabelTop: UILabel = {
            let labelTop = UILabel()
            labelTop.translatesAutoresizingMaskIntoConstraints = false
            labelTop.text = ""
            labelTop.textColor = .black
            return labelTop
        }()
        let titleLabelBottom: UILabel = {
            let labelBottom = UILabel()
            labelBottom.translatesAutoresizingMaskIntoConstraints = false
            labelBottom.text = ""
            labelBottom.textColor = .black
            return labelBottom
        }()
        
        func setupLayout(){
            addSubview(containerView)
            containerView.addSubview(titleLabelTop)
            containerView.addSubview(photoImageView)
            containerView.addSubview(titleLabelBottom)
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
            
            titleLabelTop.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
            titleLabelTop.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
            titleLabelTop.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
            //titleLabelTop.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            photoImageView.topAnchor.constraint(equalTo: titleLabelTop.bottomAnchor, constant: 20).isActive = true
            photoImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
            photoImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
            photoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            titleLabelBottom.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20).isActive = true
            titleLabelBottom.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
            titleLabelBottom.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
    }
    
        
        // khởi tạo biến food kiểu Foody
        var weather: Weather?{
            // câu lệnh bên trong didSet chỉ được gọi khi biến food đã được gán giá trị
            didSet{
                if let hot = weather {
                    photoImageView.image = UIImage(named: hot.imageName)
                    titleLabelTop.text = hot.textLabelTop
                    titleLabelBottom.text = hot.textLabelBottom
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
