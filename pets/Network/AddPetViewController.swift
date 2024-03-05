//
//  AddBookViewController.swift
//  pets
//
//  Created by maha on 05/03/2024.
//
import UIKit
import Alamofire
import SnapKit
import Eureka

class AddPetViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupForm()
        setupNavigationBar()
    }
    
    private func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Unknown")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setupNavigationBar() {
        self.title = "Add Pet"
        self.navigationController?.navigationBar.tintColor = .darkGray
        self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    private func setupForm() {
        form +++ Section("Add New Pet")
        <<< TextRow() { row in
            row.title = " Pet Name"
            row.placeholder = "Enter Pet Name"
            row.tag = "name"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
                cell.textField.textColor = .white
                cell.textField.font = UIFont.systemFont(ofSize: 16)
                cell.textField.backgroundColor = .clear
                cell.textField.layer.borderColor = UIColor.white.cgColor
                cell.textField.layer.borderWidth = 1
                cell.textField.layer.cornerRadius = 5 
            }
        }
        
        <<< IntRow() { row in
            row.title = "Pet Age"
            row.placeholder = "Enter Pet Age"
            row.tag = "Age"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
                cell.textField.textColor = .white // Set text color
                cell.textField.font = UIFont.systemFont(ofSize: 16) // Set font
                cell.textField.backgroundColor = .clear // Set background color
                cell.textField.layer.borderColor = UIColor.white.cgColor // Set border color
                cell.textField.layer.borderWidth = 1 // Set border width
                cell.textField.layer.cornerRadius = 5 // Set corner radius
            }
        }
        
        <<< TextRow() { row in
            row.title = "Gender"
            row.placeholder = "Enter Pet Gender"
            row.tag = "Gender"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
                cell.textField.textColor = .white // Set text color
                cell.textField.font = UIFont.systemFont(ofSize: 16) // Set font
                cell.textField.backgroundColor = .clear // Set background color
                cell.textField.layer.borderColor = UIColor.white.cgColor // Set border color
                cell.textField.layer.borderWidth = 1 // Set border width
                cell.textField.layer.cornerRadius = 5 // Set corner radius
            }
        }
        
        <<< SwitchRow() { row in
            row.title = "Adopted"
            row.tag = "adopted"
        }
        
        <<< URLRow() { row in
            row.title = "Pet Image"
            row.placeholder = "Enter Pet Image URL"
            row.tag = "Image"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
                cell.textField.textColor = .white // Set text color
                cell.textField.font = UIFont.systemFont(ofSize: 16) // Set font
                cell.textField.backgroundColor = .clear // Set background color
                cell.textField.layer.borderColor = UIColor.white.cgColor // Set border color
                cell.textField.layer.borderWidth = 1 // Set border width
                cell.textField.layer.cornerRadius = 5 // Set corner radius
            }
        }
        form +++ Section()
        
        <<< ButtonRow(){ row in
            row.title = "Add Pet"
            row.onCellSelection{  cell, row in
                print("Button")
                self.submitTapped()
            }
            row.cell.tintColor = .blue
        }
    }
    
    @objc func submitTapped() {
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        let nameRow: TextRow? = form.rowBy(tag: "name")
        let genderRow: TextRow? = form.rowBy(tag: "Gender")
        let ageRow: IntRow? = form.rowBy(tag: "Age")
        let imageRow: URLRow? = form.rowBy(tag: "Image")
        let adoptedRow : SwitchRow? = form.rowBy(tag: "adopted")
        
        let name = nameRow?.value ?? ""
        let age = ageRow?.value ?? 0
        let imageUrl = imageRow?.value?.absoluteString ?? ""
        let gender = genderRow?.value ?? ""
        let adopted = adoptedRow?.value ?? false
        
        let pet = Pet(id: 0, name: name, adopted: adopted, image: imageUrl, age: age, gender: gender)
        
        print(pet)
        
        NetworkManager.shared.addPet(pet: pet) { success in
            DispatchQueue.main.async{
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("error")
                }
            }
        }
    }
    
    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
