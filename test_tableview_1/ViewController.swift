//
//  ViewController.swift
//  test_tableview_1
//
//  Created by 飯田くるみ on 2018/04/22.
//  Copyright © 2018年 Kurumi Iida. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet var table:UITableView!
    @IBOutlet weak var label: UILabel!
    
    var liveNameArray = [String]()
    var liveName = String()
    var liveNameArray2 = [String]()
    var artistName: String!
    
    let userDefaults = UserDefaults.standard
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if artistName == nil{
            artistName = userDefaults.object(forKey: "pickedArtist") as! String
        }
        // Do any additional setup after loading the view, typically from a nib.
        table.dataSource = self
        
        table.delegate = self
        
        //ディクショナリ形式で初期値を指定できる
        userDefaults.register(defaults: ["椎名林檎": ["なんばハッチ"],
                                         "東京事変": ["梅田Quattro:"],
                                         "ゲスの極み乙女。": ["梅田シャングリラ"],
                                         "pickedArtist": artistName])
        print(artistName)
        userDefaults.set(artistName, forKey: "pickedArtist")
        liveNameArray = userDefaults.array(forKey: artistName) as! [String]
        print(userDefaults.object(forKey: "pickedArtist"))
        //saveData.set(liveNameArray, forKey: "live")
        //liveNameArray = [saveData.object(forKey: "live") as! String]
        //UserDefaults.standard.integer(forKey: "live")
        
      //  liveNameArray2 = [liveName]
        label.text = String(artistName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //UserDefaults.standard.integer(forKey: "live")
        return liveNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = liveNameArray[indexPath.row]
        
        return cell!
        
    }
    
    
    @IBAction func tap(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Show Log", message: "Input text", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Done", style: .default) { (action:UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            self.liveNameArray.append(textField.text!)
            self.saveData.set(self.liveNameArray, forKey: self.artistName)
            self.table.reloadData()
            
            // SubViewController へ遷移するために Segue を呼び出す
           // pickedNum = indexPath.row
            self.performSegue(withIdentifier: "tolivedetailscreateViewController",sender: nil)
            

//            // 入力したテキストをコンソールに表示
//            let textField = alert.textFields![0] as UITextField
//            self.liveNameArray = [textField.text!]
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction!) -> Void in
        }

        // UIAlertControllerにtextFieldを追加
        alert.addTextField { (textField:UITextField!) -> Void in

        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        
        present(alert, animated: true, completion: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "tolivedetailscreateViewController") {
            let ldcvc: live_details_createViewController = (segue.destination as? live_details_createViewController)!
            //vc.artistName = self.artistNameArray[pickedNum]
        }
    }

}

