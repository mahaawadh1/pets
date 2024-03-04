//
//  ViewController.swift
//  pets
//
//  Created by maha on 04/03/2024.
//
import UIKit
import Alamofire

class PetTableViewController: UITableViewController {
    private let networkManager = NetworkManager.shared
     var pets: [Pet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchPets()
    }
    
    private func fetchPets() {
        networkManager.fetchPets { [weak self] fetchedPets, error in
            if let error = error {
                print("Error fetching pets: \(error.localizedDescription)")
            } else if let fetchedPets = fetchedPets {
                self?.pets = fetchedPets
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailPetController = DetailPetController()
            detailPetController.pet = pets[indexPath.row]
            navigationController?.pushViewController(detailPetController, animated: true)
        }

}
