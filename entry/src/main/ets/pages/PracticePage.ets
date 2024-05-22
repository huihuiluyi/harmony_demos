@Preview
@Entry
@Component
struct PracticePage {

  choose :Array<string> = ['公园','商店','医院','学校']

  build() {
    Column(){
      Column()
      {
        Row(){
          Text('准确率')
          Blank().layoutWeight(1)
          Text('0%').width('30%')
            .textAlign(TextAlign.Center)
        }.rowStyle()

        Row(){
          Text('进度')
          Blank().layoutWeight(1)
          Progress({
            value:0,
            total:100,
            type:ProgressType.Linear
          }).width('30%')
        }.rowStyle()

        Row(){
          Text('个数')
          Blank().layoutWeight(1)
          Text('0')
            .width('30%')
            .height('120%')
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Gray);
        }.rowStyle()


        Row(){
          Text('用时')
          Blank().layoutWeight(1)
          TextTimer({isCountDown:false})
        }.rowStyle()

      }.backgroundColor(Color.White)
        .width('95%')
        .margin(10)
      .borderRadius(10)


      Text('School')
        .fontWeight(700)
        .fontSize(40)

      Text('Students go to school to learn and grow.')
        .fontColor(Color.White)

      List(){
        ForEach(this.choose,(item:string)=> {
          ListItem() {
            Text(item).width('100%')
              .padding(10)
              .backgroundColor(Color.White)
              .textAlign(TextAlign.Center)
              .borderRadius(5)
          }
        })
      }.width('80%')
      .divider({strokeWidth:5,color:Color.Gray})


      Row({space:50}){
        Button('结束测试')
          .type(ButtonType.Capsule)
          .btnStyle({bg:Color.White,font:Color.Black,border:Color.Black})

        Button('开始测试').type(ButtonType.Capsule)
          .btnStyle({bg:Color.Black,font:Color.White,border:Color.White})
      }


    }.backgroundColor(Color.Gray)
      .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)



  }
}


@Extend(Row) function rowStyle() {
  .height(30)
  .margin(10)
}

@Extend(Button) function btnStyle(color:{
  bg:ResourceColor,
  font:ResourceColor,
  border:ResourceColor
}) {
  .borderWidth(2)
  .borderColor(color.border)
  .backgroundColor(color.bg)
  .fontColor(color.font)
}