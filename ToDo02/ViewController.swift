//
//  ViewController.swift
//  ToDo02
//
//  Created by kamano yurika on 2018/02/19.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    //Storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる　//★ここを変えるのかな！
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }

}
