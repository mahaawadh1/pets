//
//  DetailPetController.swift
//  pets
//
//  Created by maha on 04/03/2024.
//
import UIKit
import SnapKit
import Kingfisher

class DetailPetController: UIViewController {
    
    var pet: Pet?
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let adoptedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let imageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Pet Details"
        
        setupUI()
        updateUI()
        
        if let imageUrl = URL(string: pet?.image ?? "") {
            imageView.kf.setImage(with: imageUrl)
        }
    }
    
    private func setupUI() {
        view.addSubview(idLabel)
        view.addSubview(nameLabel)
        view.addSubview(adoptedLabel)
        view.addSubview(imageLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(imageView)
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        adoptedLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(adoptedLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        idLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        adoptedLabel.font = UIFont.systemFont(ofSize: 16)
        imageLabel.font = UIFont.systemFont(ofSize: 16)
        ageLabel.font = UIFont.systemFont(ofSize: 16)
        genderLabel.font = UIFont.systemFont(ofSize: 16)
        
        idLabel.textColor = UIColor.darkGray
        nameLabel.textColor = UIColor.black
        adoptedLabel.textColor = UIColor.darkGray
        imageLabel.textColor = UIColor.darkGray
        ageLabel.textColor = UIColor.darkGray
        genderLabel.textColor = UIColor.darkGray
    }
    
    
    private func updateUI() {
        guard let pet = pet else {
            return
        }
        idLabel.text = "ID: \(pet.id)"
        nameLabel.text = "Name: \(pet.name)"
        adoptedLabel.text = "Adopted: \(pet.adopted ? "Yes" : "No")"
        imageLabel.text = "Image: \(pet.image)"
        ageLabel.text = "Age: \(pet.age)"
        genderLabel.text = "Gender: \(pet.gender)"
    }
}
