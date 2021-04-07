# MyCodeApp
## Code Block

### Block

### ENUM

### UITableView

### UICollectionView

### UIButton

### UILabel

### UIImageView

## Functhion Code

## Macro 

## Pod
> 查看ruby版本 ruby -v

~~~
ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin20]
~~~ 

> 升级ruby环境 需要安装rvm

~~~
curl -L get.rvm.io | bash -s stable 

source ~/.bashrc

source ~/.bash_profile
~~~

> 更换源
 
~~~
sudo gem update --system

gem sources --remove https://rubygems.org/

gem sources --add https://gems.ruby-china.com/
~~~



> CocoaPods具体使用
新建一个Xcode工程，使用终端cd到工程目录下

> 创建Podfile文件：

~~~
pod init
~~~

> Podfile文件中添加

~~~
target 'MyCodeAppTests' do
    inherit! :search_paths
    pod 'AFNetworking'
    pod 'MJExtension'
    pod 'Masonry'
    pod 'SDWebImage'
  end
~~~

> 保存文件

~~~
pod install
~~~


## ThirdParty
> pch文件
Command + N  创建PCH文件
在build setting 里面搜索   Prefix Header
对应位置填写 Demo/PrefixHeader.pch   前面是工程名，后面是PCH文件名
Precompile Prefix Header 预编译文件选项改为YES

> 第三方库 import 不提示
User Header Search Paths -> 添加 $(PODS_ROOT) 选择 recursive

**待解决 使用第三方库方法未找到崩溃问题**
### Masonry
### AFNetWorking
### SDWebImage

