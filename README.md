# App Architectures

Help understand some mainstream app architectures.

架构模式Architectures是针对特定领域高层次的设计方案，一个架构中可能包含多个设计模式来解决架构中的问题。架构就像是建筑图纸，建房用的钢筋材料是框架，房子建好后室内布置与设计是设计模式。






# MVC



## MVC 最重要的设计模式



“模型－视图－控制器”(Model-View-Controller) 设计模式，通常被称为“MVC”，将以下一种角色分配给应用程序中的对象：“模型”、“视图”或“控制器”。模式不仅定义了对象在应用程序中扮演的角色，还定义了对象之间通信的方式。这三类对象的每一个，都由抽象边界与其他对象分隔，穿过这些边界与其他类型的对象进行通信。



![TraditionalMVC](https://github.com/ApesTalk/iOSArchitectures/blob/master/Images/TraditionalMVC.png)



- 模型对象M
模型对象封装了应用程序的数据，并定义操控和处理该数据的逻辑和运算。例如，模型对象可能是表示游戏中的角色或地址簿中的联系人。有时应用程序的模型层，实际是相关对象的一个或多个图形。数据载入应用程序后，作为应用程序的持续状态（不论该持续状态是储存在文件中，还是在数据库中）一部分的大部分数据，应该驻留在模型对象中。因为模型对象代表了与特定问题领域相关的知识和专长，在相似问题领域，就可以重复使用它们。“纯”模型对象应该和视图对象不发生明确连接（视图对象显示其数据并允许用户编辑数据），它不该管到用户界面和显示的问题。

用户在视图层中所进行的创建或修改数据的操作，通过控制器对象传达出去，最终会创建或更新模型对象。模型对象更改时（例如通过网络连接接收到新数据），它通知控制器对象，控制器对象更新相应的视图对象。

- 视图对象V
视图对象是应用程序中用户可以看见的对象。视图对象知道如何将自己绘制出来，并可能对用户的操作作出响应。视图对象的主要目的，就是显示来自应用程序模型对象的数据，并使该数据可被编辑。尽管如此，在 MVC 应用程序中，视图对象通常与模型对象分离。

因为您通常重新使用并重新配置对象，视图对象保证了应用程序之间的一致性。对于 iOS，UIKit 框架提供了视图类的集合；对于 OS X，AppKit 框架提供了类似的集合。在 UIKit 中，视图对象最终继承自 UIView 类；在 AppKit 中，视图对象最终继承自 NSView 类。

视图对象通过应用程序的控制器对象，了解模型数据的更改，并通过控制器对象，将用户发动的修改（例如，在文本栏输入的文本），传达到应用程序的模型对象。

- 控制器对象C
在应用程序的一个或多个视图对象和一个或多个模型对象之间，控制器对象充当媒介。控制器对象因此是同步管道程序，通过它，视图对象了解模型对象的更改，反之亦然。控制器对象还可以为应用程序执行设置和协调任务，并管理其他对象的生命周期。

控制器对象解释在视图对象中进行的用户操作，并将新的或更改过的数据传达给模型对象。模型对象更改时，一个控制器对象会将新的模型数据传达给视图对象，以便视图对象可以显示它。



以上内容来自苹果官方文档：[Start Developing iOS Apps Today](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/RoadMapiOSCh-Legacy/chapters/StreamlineYourAppswithDesignPatterns/StreamlineYourApps/StreamlineYourApps.html)



## iOS MVC存在的问题

MVC设计模式是Cocoa应用程序最基本最重要的设计模式，很多系统框架和系统APP都是基于MVC设计模式的。Cocoa的MVC架构在开发速度上面占有足够的优势，同时也很容易引导大家制造出臃肿的控制器，Controller扮演了Model和View的中间人角色（Mediator），因为ViewController几乎管理了View的生命周期。尽管你有能力卸下一些业务逻辑和数据转换给Model，但你没有什么选择可以卸下一些工作给View，大多时候View的职责都发送事件给了ViewController。 ViewController最终变成了所有事物的代理和数据源并且经常担负着发起和取消网络请求的职责。由于View和ViewController紧紧地绑在一起，虽然非常好用，但是导致View和Model没法分离，难做View的单元测试。



真正的Cocoa MVC架构：




![CocoaMVC](https://github.com/ApesTalk/iOSArchitectures/blob/master/Images/CocoaMVC.png)



## 如何避免臃肿的控制器？

避免造成臃肿的视图控制器，有以下方式：

- 代理方法分散：不要直接用控制器实现代理方法，交给其他对象去实现。

- 拆分控制器：将一个复杂的控制器变成一个容器控制器，按需将每个模块用单独的控制去实现。

- 控制器子视图的创建代码抽离：将控制器的子视图的创建都抽离出来放到self.view（实现自定义view，在其中创建子视图和约束，然后赋给控制器的self.view）中去，避免直接在控制器中创建子视图并添加约束。

- 主持者模式（Presenter Pattern）：类似ViewModel的作用，持有模型数据，担当展示数据的转换的责任。

- 绑定模式（Binding pattern）：通过KVO和KVC来绑定数据模型和视图。





# MVP



MVP（Model View Presenter）是从MVC演变而来的，Presenter成为Model和View的中间人（Mediator），它只根据Model更新View，它不干涉ViewControlelr的生命周期，而且View层很容易被模拟出来（can be mocked easily），所以在Presenter层中没有任何布局代码。



** 在MVP模式下，UIViewController的子类实际上被当成View层而非Presenter层，这种区别提供了出色的可测试性，但它是牺牲开发速度为代价换来的，因为你必须手动创建数据并做好事件绑定。**



iOS的MVP架构，是基于协议（Protocol）来实现的，协议要求了中间人（Presenter）须具备的职责。iOS的MVP架构意味着出色的可测试性和大量的代码。




![MVP](https://github.com/ApesTalk/iOSArchitectures/blob/master/Images/MVP.png)




# MVVM



MVVM（Model View ViewModel）类似MVP，只是用ViewModel来做中间人（Mediator）。MVVM把ViewController当作View，没有了View和Model的紧密耦合。在iOS中，ViewModel基本是代表你的View和View状态的独立的UIKit。ViewModel激发Model的改变并根据改变的Model更新自身，因为View和ViewModel之间有个绑定关系，所以View会相应地更新。


![MVVM](https://github.com/ApesTalk/iOSArchitectures/blob/master/Images/MVVM.png)


# VIPER



![VIPER](https://github.com/ApesTalk/iOSArchitectures/blob/master/Images/VIPER.png)



- View：包含View和ViewController

- Interactor：包含数据或网络相关的业务逻辑，比如创建新的实体或从服务器获取实体数据。这里或许你会用到一些依赖的服务或Managers。

- Presenter：包含UI相关业务逻辑，调用Interactor中的方法。

- Entities：你的普通数据对象，不是访问数据层，因为访问数据时Interactor的职责。

- Router：负责VIPER模块之间的关联。



VIPER与MV(X)在职责分配上的区别：

- 把Model的数据交互逻辑放到了Interactor层，Entities作为哑的（dumb）数据结构。

- 只把Controller/Presenter/ViewModel的UI展示职责放到了Presenter层，而不是数据修改功能。

- VIPER是第一个明确了地址导航职责（应该由Router负责解决）的模式。



适当的路由方式是iOS应用程序的一个挑战，MV(X)模式根本解决不了这个问题。



VIPER模式具有良好的分层和易测性，然而它是以牺牲可维护性为代价的，因为你必须编写大量的功能很少的接口类。








参考：

[Start Developing iOS Apps Today](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/RoadMapiOSCh-Legacy/chapters/StreamlineYourAppswithDesignPatterns/StreamlineYourApps/StreamlineYourApps.html)

[8 Patterns to Help You Destroy  Massive View Controller](http://khanlou.com/2014/09/8-patterns-to-help-you-destroy-massive-view-controller/)

[iOS Architecture Patterns Demystifying MVC, MVP, MVVM and VIPER](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52)

[MVC，MVP和MVVM的图示](http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html)

[objc.io的Architecture专题](https://www.objc.io/issues/13-architecture/)

