//
//  GUOLoginViewController.swift
//  Take_the_find
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 郭磊. All rights reserved.
//

import UIKit

class GUOLoginViewController: UIViewController {

    @IBOutlet weak var loginBtnC: UIButton!
    @IBOutlet weak var passWL: UITextField!
    @IBOutlet weak var nameL: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "loginBackgroundImage")!)
    }
    @IBAction func loginBtn(sender: AnyObject) {
        if passWL.text == nil || nameL.text == nil {
            SVProgressHUD.showErrorWithStatus("账号或密码为空")
        }else{
            UserModel.checkRequestData(nameL.text!, password: passWL.text!, callBack: { (dict, error) in
                if error == nil{
                    //清空单例
                    self.deleTheUserModel()
                    //登录成功
                    SVProgressHUD.showSuccessWithStatus("登录成功")
                    self.addUserModelShare(dict as! [String:String])
                    isLogin = true
                    self.navigationController?.popViewControllerAnimated(true)
                }else{
                    SVProgressHUD.showErrorWithStatus("网络请求失败")
                }
            })
        }

    }
    @IBAction func PopBtnClick(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    ///清空单例
    func deleTheUserModel(){
        UserModel.shareUser.email = ""
        UserModel.shareUser.id = ""
        UserModel.shareUser.address = ""
        UserModel.shareUser.sex = ""
        UserModel.shareUser.birth = ""
        UserModel.shareUser.uname = ""
         UserModel.shareUser.iconStr = ""
         UserModel.shareUser.headpic = ""
         UserModel.shareUser.info = ""
        UserModel.shareUser.ulevel = ""
    }
     ///为单例赋值
    func addUserModelShare(dict:[String:String]){
        UserModel.shareUser.email = dict["email"]
        UserModel.shareUser.id = dict["id"]
        UserModel.shareUser.address = dict["address"]
        UserModel.shareUser.sex = dict["sex"]
        UserModel.shareUser.birth = dict["birth"]
        UserModel.shareUser.uname = dict["uname"]
        UserModel.shareUser.iconStr = dict["iconStr"]
        UserModel.shareUser.headpic = dict["headpic"]
        UserModel.shareUser.info = dict["info"]
        UserModel.shareUser.ulevel = dict["ulevel"]
    }
}
