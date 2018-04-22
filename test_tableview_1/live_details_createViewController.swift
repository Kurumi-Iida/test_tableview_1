//
//  live_details_createViewController.swift
//  test_tableview_1
//
//  Created by 飯田くるみ on 2018/04/22.
//  Copyright © 2018年 Kurumi Iida. All rights reserved.
//

import UIKit

class live_details_createViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var testLabel: UILabel!
    //日時の設定
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        testLabel.text = formatter.string(from: sender.date)
    }
    
    @IBOutlet var titleTextField: UITextField!
    
    let userDefaults = UserDefaults.standard
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        testLabel.text = saveData.object(forKey: "date") as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savedetails(){
        saveData.set(titleTextField, forKey: "title")
        saveData.set(titleTextField, forKey: "date")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
