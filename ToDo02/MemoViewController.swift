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
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard
    var memoArray = [String] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //#007メモ帳　p.２５
    @IBAction func saveMemo() {
        //UserDefaultsに書き込み
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
        
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
