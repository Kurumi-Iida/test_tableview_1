//
//  artistViewController.swift
//  test_tableview_1
//
//  Created by 飯田くるみ on 2018/04/22.
//  Copyright © 2018年 Kurumi Iida. All rights reserved.
//

import UIKit

class artistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table:UITableView!
    
//    // ViewControllerに渡す文字列
//    var selectedText: String?

    var artistNameArray = [String]()
    var artistName: String!

    let userDefaults = UserDefaults.standard
    var saveData: UserDefaults = UserDefaults.standard
    var pickedNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        artistNameArray = ["椎名林檎","東京事変","ゲスの極み乙女。"]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //UserDefaults.standard.integer(forKey: "live")
        return artistNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = artistNameArray[indexPath.row]
        
        return cell!

        
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
            print(artistNameArray[indexPath.row])
            // SubViewController へ遷移するために Segue を呼び出す
        pickedNum = indexPath.row
            performSegue(withIdentifier: "toSubViewController",sender: nil)
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let vc: ViewController = (segue.destination as? ViewController)!
            vc.artistName = self.artistNameArray[pickedNum]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
