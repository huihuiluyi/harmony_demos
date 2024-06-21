
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct TabDemo {

  @State currentIndex : number = 0

  tabController = new TabsController()

  build() {
    Tabs({
      barPosition:BarPosition.End,
      index: this.currentIndex,
      controller: this.tabController
    }) {
        TabContent() {
          Text('page1').width('100%').height('100%')
            .textAlign(TextAlign.Center)
        }.tabBar(this.TabItem(0,'首页',$r('app.media.home_selected'),$r('app.media.home_default')))
        TabContent() {
          Text('page2')
        }.tabBar(this.TabItem(1,'发现',$r("app.media.found_selected"),$r("app.media.found_default")))
        TabContent() {
          Text('page3')
        }.tabBar(this.TabItem(2,'圈子',$r('app.media.circle_selected'),$r('app.media.circle_default')))
        TabContent() {
          Text('page4')
        }.tabBar(this.TabItem(3,'我的',$r('app.media.mine_selected'),$r('app.media.mine_default')))
    }.vertical(false)
    .barMode(BarMode.Fixed)
    .onChange((index)=> {
      this.currentIndex = index
    })
  }


  @Builder TabItem(index:number,text:string
  ,selectedImg : Resource,defaultImg : Resource) {
    Column({space:5}){
      Image(this.currentIndex === index ? selectedImg: defaultImg)
        .width(25)
        .height(25)
        .margin({top:5})
      Text(text).fontColor(this.currentIndex === index ? Color.Blue:Color.Black)
    }.width('100%')
    .backgroundColor('#8EEE')
    .height(100)
    .justifyContent(FlexAlign.Start)
    .onClick(()=> {
      this.currentIndex = index
      this.tabController.changeIndex(this.currentIndex)
      promptAction.showToast({message:'点击了'+this.currentIndex,duration:3000})
    })
  }
}