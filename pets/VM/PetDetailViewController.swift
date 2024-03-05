//
//  DetailPetController.swift
//  pets
//
//  Created by maha on 04/03/2024.
//
import UIKit
import SnapKit
import Kingfisher

class PetDetailViewController: UIViewController {
    var pet: Pet?
    
    private let petImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 150
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let pet = pet {
            setupUI(with: pet)
        }
    }
    
    private func setupUI(with pet: Pet) {
        if let imageUrl = URL(string: pet.image) {
            petImageView.kf.setImage(with: imageUrl, options: [.scaleFactor(0.5)])
            view.addSubview(petImageView)
            petImageView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().multipliedBy(0.7)
                make.width.height.equalTo(300)
            }
        }
        
        let nameLabel = UILabel()
        nameLabel.text = "Name: \(pet.name)"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(nameLabel)
        
        let adoptedLabel = UILabel()
        adoptedLabel.text = "Adopted: \(pet.adopted ? "Yes" : "No")"
        adoptedLabel.textColor = .black
        adoptedLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(adoptedLabel)
        
        let ageLabel = UILabel()
        ageLabel.text = "Age: \(pet.age) years"
        ageLabel.textColor = .black
        ageLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(ageLabel)
        
        let genderLabel = UILabel()
        genderLabel.text = "Gender: \(pet.gender)"
        genderLabel.textColor = .black
        genderLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(genderLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.2)
        }
        
        adoptedLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.3)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.4)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.5)
        }
    }
}
