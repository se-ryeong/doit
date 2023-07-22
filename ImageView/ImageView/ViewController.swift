//
//  ViewController.swift
//  ImageView
//
//  Created by t2023-m0062 on 2023/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false     //확대 여부
    var imgOn: UIImage?    //켜진 전구
    var imgOff: UIImage?   //꺼진 전구
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn  //imgView에 imgOn이미지를 지정한다
    }
    
    @IBAction func btnResizeimage(_ sender: UIButton) {
        let scale:CGFloat = 2.0       //확대 버튼 클릭시 이미지 2배 확대
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {  //true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale    //이미지 프레임의 가로,세로에 scale값을 나누어 할당
            btnResize.setTitle("확대", for: .normal)   //버튼의 텍스트를 확대로 변경
        }
        else {  //false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale  //이미지 프레임의 가로,세로에 scale값을 곱해서 할당
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)   //이미지 뷰의 프레임 크기 변경
        isZoom = !isZoom   //반전
    }
    
    @IBAction func switchimageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
}
