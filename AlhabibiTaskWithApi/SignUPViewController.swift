//
//  SignUPViewController.swift
//  AlhabibiTaskWithApi
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import ObjectMapper
class SignUPViewController: UIViewController {

    @IBOutlet weak var txtUserName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtPhoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCountry: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCity: SkyFloatingLabelTextField!
    @IBOutlet weak var txtAddress: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSignUP(_ sender: UIButton) {
        sendData()
    }

    func sendData(){
        let param:[String:Any] = ["username":txtUserName.text,"email" : txtEmail.text, "password":txtPassword.text,"phone" : txtPhoneNumber.text,"country" : txtCountry.text, "city" : txtCity.text , "address" : txtAddress.text, "flag":"1", "birthday" : "1/2/1995" , "country_code" : "0123" , "postal_code" : "454545" , "country_iso3" : "456565" , "state" : "Chandigarh"]
        
        ApiHandler.fetchData(urlStr: "signup", parameters: param) { (jsonData) in
            // print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
