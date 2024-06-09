//
//  AddNewViewController.swift
//  PeopleList
//
//  Created by Андрей Васильев on 05.06.2024.
//

import UIKit


class AddNewViewController: UIViewController {

    weak var deligate: ViewControllerDeligate?

    private let maxNumberCount = 11
    private let genders = ["Male", "Female"]
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: NSRegularExpression.Options.caseInsensitive)
    
    // fields
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var secondNameFld: UITextField!
    @IBOutlet weak var ageFld: UITextField!
    @IBOutlet weak var phoneFld: UITextField!
    @IBOutlet weak var workFld: UITextField!
    @IBOutlet weak var emailFld: UITextField!
    
    
    // btn
    @IBOutlet weak var applyUserBtn: UIButton!
    
    // error labels
    @IBOutlet weak var firstNameErr: UILabel!
    
    @IBOutlet weak var secondNameErr: UILabel!
    
    @IBOutlet weak var ageErr: UILabel!
    
    @IBOutlet weak var phoneErr: UILabel!
    
    @IBOutlet weak var workErr: UILabel!
    
    @IBOutlet weak var emailErr: UILabel!
    
    
    @IBOutlet weak var genderPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneFld.delegate = self
        phoneFld.keyboardType = .numberPad
        genderPicker.delegate = self
        genderPicker.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else {
            return "+"
        }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
        }
        
        
        
        return "+" + number
    }
    
    private func showError(for feild: UITextField, textError: String?){
        var lbl : UILabel?
        switch feild {
        case firstNameFld:
            lbl = firstNameErr
            break
        case secondNameFld:
            lbl = secondNameErr
            break
        case ageFld:
            lbl = ageErr
            break
        case phoneFld:
            lbl = phoneErr
            break
        case workFld:
            lbl = workErr
            break
        case emailFld:
            lbl = emailErr
            break
        default:
            break
        }
        if textError != nil {
            lbl?.text = textError!
        }
        lbl?.isHidden = false
        
    }
    
    private func isInt(a : String) -> Bool {
        guard let _ = Int(a) else {
            return false
        }
        return true
    }
    
    private func check(feild: UITextField) -> Bool {
        if feild == ageFld && feild.text != "" {
            if !isInt(a: feild.text!) {
                showError(for: feild, textError: "Поле должно содержать число.")
            }
            
        }
        else {
            showError(for: feild, textError: "Пустое поле")
        }
        return feild.text != ""
    }
    
    @IBAction func createUser(_ sender: Any) {
        let c1 = check(feild: firstNameFld)
        let c2 = check(feild: secondNameFld)
        let c3 = check(feild: ageFld)
        let c4 = check(feild: phoneFld)
        let c5 = check(feild: workFld)
        let c6 = check(feild: emailFld)
        if c1 && c2 && c3 && c4 && c4 && c5 && c6 {
            let genderSelected = genderPicker.selectedRow(inComponent: 0)
            var gender : Gender
            if genderSelected == 1 {
                gender = .Female
            }
            else {
                gender = .Male
            }
            let user = UserModel(
                firstName: firstNameFld.text!,
                secondName: secondNameFld.text!,
                age: Int(ageFld.text!) ?? 0,
                gender: gender,
                workSpace: workFld.text!,
                phone: phoneFld.text!,
                email: emailFld.text!
            )
            deligate?.didChangeUser(user)
            dismiss(animated: true)
        }
        
    }
    
}

extension AddNewViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
}

extension AddNewViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
}

extension AddNewViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    
}
