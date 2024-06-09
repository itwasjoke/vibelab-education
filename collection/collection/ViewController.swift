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
        return cell
    }
    
    func configureLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width

        let cellWidth = (screenWidth - layout.minimumInteritemSpacing * 2) / 3

        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    
    
    @IBAction func addPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "Выберите источник", message: nil, preferredStyle: .actionSheet)
                
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Камера", style: .default) { _ in
                self.showImagePicker(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }

        let libraryAction = UIAlertAction(title: "Галерея", style: .default) { _ in
            self.showImagePicker(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }
    
    func showImagePicker(sourceType: UIImagePickerController.SourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
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

