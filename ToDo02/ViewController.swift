//
//  ViewController.swift
//  ToDo02
//
//  Created by kamano yurika on 2018/02/19.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource{
    
    //Storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    @IBOutlet var textField: UITextField!
    


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
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの内容を決める。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    //returnキーを押した時の処理？
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        self.textField.text = ""
        return true
    }

}
