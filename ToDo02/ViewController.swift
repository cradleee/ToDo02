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
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    var todos: [String] = []
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        tableView.dataSource = self
        
        if let aaa = userDefaults.object(forKey: "todos") {
            todos = aaa as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの内容を決める。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo
        
        return cell
    }
    //returnキーを押した時の処理？
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if let text = self.textField.text {
            todos.append(text)
            userDefaults.set(todos, forKey: "todos")
            userDefaults.synchronize()
            
            todos = userDefaults.object(forKey: "todos") as! [String]
        }
        
        self.textField.text = ""
        
        self.tableView.reloadData() //データをリロードする
        return true
    }

}
