//
//  lightRedViewController.swift
//  HelloSegue
//
//  Created by 林奕德 on 2018/3/30.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit
protocol LightRedViewControllerDelegate {
    func setColor(colorType:String)
}
class lightRedViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    var infoFormViewOne:String?
    let colorArrae = ["red","green","blue"]
    var delegate:LightRedViewControllerDelegate?
    
    @IBOutlet weak var myPickView: UIPickerView!
    @IBAction func backToView1(_ sender: UIButton) {
        
        let colorNumber = myPickView.selectedRow(inComponent:0)//做索引值
       let color = colorArrae[colorNumber]
        delegate?.setColor(colorType: color)
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var myLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myLable.text = infoFormViewOne
        myPickView.dataSource = self
        myPickView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArrae.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return colorArrae[row]
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
