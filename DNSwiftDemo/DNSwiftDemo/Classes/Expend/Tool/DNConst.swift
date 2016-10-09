
import UIKit


// MARK: URL

let BASE_URL = ""

// MARK: String

//首次启动
let G_FirstLauch = "firstLaunch"

// MARK: Value

//屏幕宽高
let G_SCREEN_W = UIScreen.main.bounds.size.width
let G_SCREEN_H = UIScreen.main.bounds.size.height
//code值, 200代表操作成功
let RETURN_OK = 200

// 引导图数量
let kGuidePageCount = 4



// MARK: Color
func DNColor(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}


// 页面默认背景色
func DNVCBackViewColor() -> UIColor {
    return DNColor(240.0, g: 240.0, b: 240.0, a: 1.0)
}
