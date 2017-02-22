//
//  ViewController.swift
//  AlhabibiTaskWithApi
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import M13Checkbox
import SkyFloatingLabelTextField
import Alamofire
import ObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var checkboxRememberMe: M13Checkbox!
    @IBOutlet weak var btnSignIN: UIButton!
    @IBOutlet weak var txtUserName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorBlue = UIColor(red: 0, green: 173/255, blue: 234/255, alpha: 1.0)
        let colorLightGrey = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1.0)
        checkboxRememberMe._IBBoxType = "Square"
        btnSignIN.layer.cornerRadius = 10
        txtUserName.selectedLineColor = colorLightGrey
        txtUserName.titleColor = colorBlue
    }

    
    @IBAction func btnSignIn(_ sender: UIButton) {
        fetchData()
        performSegue(withIdentifier: "successfull", sender: self)
    }
    
    func fetchData()
    {
         var param:[String:Any] = ["email" : txtUserName.text, "password" :txtPassword.text, "flag":"1"]
        ApiHandler.fetchData(urlStr: "login", parameters: param) { (jsonData) in
            //print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
           // print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "successfull"){
            let loginViewController = (segue.destination as! FinalViewController)
            
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

