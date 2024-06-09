//
//  ViewController.swift
//  collection
//
//  Created by Андрей Васильев on 08.06.2024.
//

import UIKit
import PhotosUI

class ViewController: UIViewController,
                      UICollectionViewDataSource, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
    }
    

    @IBOutlet weak var addImageBtn: UIButton!
    var selectedImage: UIImage?
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureLayout()

        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell", for: indexPath) as! NumberCell
        cell.imageView.image = images[indexPath.row]
//        if indexPath.row < images.count - 1 {
//                    cell.imageView.image = UIImage(named: images[indexPath.row])
//                } else if selectedImage != nil {
//                    cell.imageView.image = selectedImage
//                }
        return cell
    }
    
    func configureLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width

            // Вычисляем ширину ячейки
        let cellWidth = (screenWidth - layout.minimumInteritemSpacing * 2) / 3

            // Настраиваем layout
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = 0 // Измените значение по необходимости
        layout.minimumLineSpacing = 0    // Измените значение по необходимости
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Измените значение по необходимости
        return layout
    }
    
    
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
            images.append(image)
            collectionView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

