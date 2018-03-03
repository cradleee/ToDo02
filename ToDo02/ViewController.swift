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
    //@IBOutlet var textField: UITextField!
    
    var todos: [String] = []
    var editRow: Int = -1
    
    let userDefaults = UserDefaults.standard

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        tableView.dataSource = self
        
        if let aaa = userDefaults.object(forKey: "todos") {
            todos = aaa as! [String]
        }
        
        self.tableView.reloadData() //データをリロードする
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
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
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            userDefaults.set(todos, forKey: "todos")
            }
        
    //既存のテキストの内容を編集機能
        func tableView(_tableView:UITableView, didSelectRowAt indexpath: IndexPath) {
            editRow = indexPath.row
            UserDefaults.set(editRow, forkey :"todos")
        }
    
        

    }
//
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//
//        let deleteButton: UITableViewRowAction = UITableViewRowAction(style:.normal, title: "削除") { (action,index) -> Void in
//            self.todos.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//        deleteButton.backgroundColor = UIColor.red
//
//        return [deleteButton]
//    }
  

}
