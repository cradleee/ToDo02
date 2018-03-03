//
//  MemoViewController.swift
//  ToDo02
//
//  Created by kamano yurika on 2018/02/19.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!

    var todoArray: [String] = []
//    var editRow: Int = -1
    
    let saveData: UserDefaults = UserDefaults.standard
//  let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //まずsaveDataの中にtodoarrayがあるか確認してなかったら、todoArrayを作成。あったら、todoArrayをsaveDataから取り出す。
        if saveData.object(forKey: "todos") == nil {
            return
        }else{
            todoArray = saveData.object(forKey: "todos") as! [String]
        }
        
        titleTextField.delegate = self
        titleTextField.text = saveData.object(forKey: "todos") as? String
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //#007メモ帳　p.２５
    @IBAction func saveMemo() {
        //UserDefaultsに書き込み
        todoArray.append(titleTextField.text!)
        saveData.set(todoArray, forKey: "todos")
        
        if titleTextField.text == nil {
            return
        }
//
//        if editRow == -1 {
//            print(todoArray)
//            todoArray.append(titleTextField.text!)
//            saveData.set(todoArray, forKey: "todos")
//            editRow = -1
//        }else{ //既存のメモの編集
//            todoArray[editRow] = titleTextField.text!
//            saveData.set(todoArray, forKey: "todos")
//            editRow = -1
//        }
//
//        //前の画面へ遷移
//        editRow = -1
//        saveData.removeObject(forKey: "todos")
//        self.dismiss(animated: true, completion: nil)
//
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message:"メモの保存が完了しました。",
                                                         preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { action in
                            //ボタンが押されましいたときの動作
                            //#007 メモ帳P.31
                            self.navigationController?.popViewController(animated: true)
                            print("OKボタンが押されました！")
                        }
                    )
                )
        present(alert, animated: true, completion: nil)
    }
    
    //画面遷移
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //var MemoViewController:MemoViewController = segue.destinationViewController as
    //MemoViewController.param = self.paramText.text
    //}
    
    //func shouldPerformSegue(withIdentifier: String?, sender: AnyObject?)
    //return true
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
