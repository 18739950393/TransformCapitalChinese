# TransformCapitalChinese
To convert the number into Chinese capital, for financial related.把数字转换成中文大写数字，用于财务相关

# 文件描述
  此项目用于将阿拉伯数字转换为中文大写字，例如，将580.63转换后："伍佰捌拾元零陆角叁分"，常用于财务相关需求的应用,支持十亿以内的转换。
  
# 使用指南
  直接下载项目并解压，将TransformCapitalChinese.swift文件拖入到自己的项目主目录下，就可以使用了
  
# API指南

    /*  阿拉伯数字 转 中文大写数字
     *  numFloat : 要转换的float型,两位小数点有效
     *  return ： 返回的大写字符串
     */
    public class func getCapitalChinaString(numFloat:Float) -> String    
