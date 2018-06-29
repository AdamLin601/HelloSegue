//
//  ViewController.swift
//  HelloSegue
//
//  Created by 林奕德 on 2018/3/30.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LightRedViewControllerDelegate{

    @IBOutlet weak var myTextInput: UITextField!
    func setColor(colorType: String) {
        if colorType == "red"{
            view.backgroundColor = .red
        }else if colorType == "green"{
            view.backgroundColor = .green
        }else if colorType == "blue"{
            view.backgroundColor = .blue
        }
}

    @IBAction func changedView(_ sender: UIButton) {
        if let inputText = myTextInput.text{
            if inputText == ""{
                //no input,pop up an alert
              let myAlert =  UIAlertController(title: "No input", message: "Please enter something", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
            }else {
                //change View
                performSegue(withIdentifier: "gotoView2", sender: inputText)
                myTextInput.text = ""// clear text
                myTextInput.resignFirstResponder()
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //prepare準備
        if segue.identifier == "gotoView2"{ //確認要傳的頁面名稱
            if let  lightRed = segue.destination as? lightRedViewController{
             lightRed.infoFormViewOne = sender as?String
                lightRed.delegate = self
            }
        }//destination(目的地) sender<- inputText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

