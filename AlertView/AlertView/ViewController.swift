//
//  ViewController.swift
//  AlertView
//
//  Created by 皇家少爷齐熠 on 2017/6/12.
//  Copyright © 2017年 NetWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    
    var BottomView:UIView!
    var BottomViewTime:UIView!
    var flag = true
    var datePicker:UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view.backgroundColor = UIColor.cyan
        
        let btn = UIButton.init()
        btn.frame = CGRect.init(x: 100, y: 40, width: 100, height: 30)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(bottom), for: .touchUpInside)
        self.view.addSubview(btn)
        
        BottomView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.size.height * 1.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.75))
        
        BottomView.backgroundColor = UIColor.white;
        
        //创建取消确定按钮
        
        let array = ["取消","确认"]
        
        for index in 0..<array.count
        {
            let wint:Int = (Int)(UIScreen.main.bounds.size.width - 120) * index
            
            let button = UIButton.init()
            button.frame = CGRect.init(x: Int(20 + wint), y: 10, width: 80, height: 30)
            button.backgroundColor = UIColor.cyan
            button.addTarget(self, action: #selector(bottom), for: .touchUpInside)
            button.tag = 1000 + index
            button.setTitle(array[index], for: .normal)
            button.backgroundColor = UIColor.orange
            BottomView.addSubview(button)
            
            if index == 1 {
                
                let  line:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 10 + 40, width: UIScreen.main.bounds.size.width, height: 0.5))
                line.backgroundColor = UIColor.gray;
                BottomView.addSubview(line)
                
            }
            
        }
        
        
        
        
        //
        self.view.addSubview(BottomView)
        
        //
        BottomViewTime = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.size.height * 1.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.35))
        
        BottomViewTime.backgroundColor = UIColor.white;
        BottomView.addSubview(BottomViewTime)
        
        
        //创建日期选择器
        datePicker = UIDatePicker(frame: CGRect(x:0, y: 0, width:UIScreen.main.bounds.size.width, height:0.35 * UIScreen.main.bounds.size.height))
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = Locale(identifier: "zh_CN")
        
       
        //注意：action里面的方法名后面需要加个冒号“：”
        datePicker.addTarget(self, action: #selector(dateChanged),
                             for: .valueChanged)
        BottomViewTime.addSubview(datePicker)
        
        
        //
        
        let tap = UITapGestureRecognizer.init()
        tap.addTarget(self, action: #selector(tapping))
        
        self.view.addGestureRecognizer(tap)
        
        //
        BottomTextFeild()
    }

    //创建
    func BottomTextFeild(){
    
        let ary = ["备注信息","确认时间","确认人员"]
        
        for index in 0..<ary.count
        {
        
            let backGround:UIView = UIView.init(frame: CGRect.init(x: 0, y: 50 + (Int)(0.35 * UIScreen.main.bounds.size.height - 50) / 3 * index, width: Int(BottomView.frame.size.width), height: (Int)(0.35 * UIScreen.main.bounds.size.height - 70) / 3))
            
          //  backGround.backgroundColor = UIColor.brown
            
            BottomView.addSubview(backGround)
            
            //
            
            let label:UILabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: 0.2 * UIScreen.main.bounds.size.width, height: backGround.frame.size.height - 10))
            
            label.text = String(ary[index] + ":")
            label.textAlignment = .center
            label.textColor = UIColor.gray
            backGround.addSubview(label)
            
            //
            let textInput:UITextField = UITextField.init(frame: CGRect.init(x: label.frame.origin.x + label.frame.size.width + 10, y: label.frame.origin.y + 5, width: 0.8 * UIScreen.main.bounds.size.width - 30, height: label.frame.size.height - 10))
            
            textInput.borderStyle = .roundedRect
            textInput.tag = 130 + index
            textInput.delegate = self
            textInput.placeholder = String(ary[index])
            backGround.addSubview(textInput)
            
       
            
        }
    
    }
    
    
    
    func tapping(){
    
        UIView.animate(withDuration:0.5, animations: {
            
            var rect:CGRect = self.BottomView.frame
            
            rect.origin.y = UIScreen.main.bounds.size.height * 1
            
            self.BottomView.frame = rect
            
            
        }, completion: nil)
        
        flag = !flag
    }
    
    
    func bottom(){
    
        let StringText1:UITextField = self.view.viewWithTag(130) as! UITextField
        let StringText2:UITextField = self.view.viewWithTag(132) as! UITextField
        let StringText3:UITextField = self.view.viewWithTag(132) as! UITextField
        
        StringText1.resignFirstResponder()
        StringText2.resignFirstResponder()
        StringText3.resignFirstResponder()
        
        if flag {
           
            UIView.animate(withDuration: 0.5, animations: {
                
                var rect:CGRect = self.BottomView.frame
                
                rect.origin.y = UIScreen.main.bounds.size.height * 0.25
                
                self.BottomView.frame = rect
                
                
            }, completion: nil)
            
        }else{
        
            UIView.animate(withDuration:0.5, animations: {
                
                var rect:CGRect = self.BottomView.frame
                
                rect.origin.y = UIScreen.main.bounds.size.height * 1
                
                self.BottomView.frame = rect
                
                
            }, completion: nil)
        
        }
        
        UIView.animate(withDuration:0.5, animations: {
            
            var rect:CGRect = self.BottomViewTime.frame
            
            rect.origin.y = UIScreen.main.bounds.size.height * 1
            
            self.BottomViewTime.frame = rect
            
            
        }, completion: nil)
        
        flag = !flag

    
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //弹出时间选择器
        if textField.tag == 131 {
            
            let StringText1:UITextField = self.view.viewWithTag(130) as! UITextField
            
            let StringText3:UITextField = self.view.viewWithTag(132) as! UITextField
            
            
            StringText1.resignFirstResponder()
            StringText3.resignFirstResponder()
            
            UIView.animate(withDuration: 0.5, animations: {
                
                var rect:CGRect = self.BottomViewTime.frame
                
                rect.origin.y = UIScreen.main.bounds.size.height * 0.4
                
                self.BottomViewTime.frame = rect
                
                
            }, completion: nil)
            
            
        }
        
        
        return true;
    }

    //日期选择器响应方法
    func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日"
        print(formatter.string(from: datePicker.date))
        
        let StringText:UITextField = self.view.viewWithTag(131) as! UITextField
        
        StringText.text = String(formatter.string(from: datePicker.date))
        
    }
    

    
}

