@Component
export struct StateItem {

  itemStr:string
  @Prop hasSelected : boolean
  answer : string
  @Prop selectedItemStr : string
  click : ()=>void

  build() {
    Stack() {
      Text(this.itemStr)
        .padding(10)
        .width('100%')
        .borderRadius(5)
        .fontColor(this.getFontColor())
        .backgroundColor(this.getBgColor())
        .textAlign(TextAlign.Center)


    }.onClick(this.click)
    .width('80%')
    .alignContent(Alignment.Start)
  }

  getBgColor() {
    if (!this.hasSelected) {
      return Color.White
    }
    if (this.itemStr === this.answer) {
      return Color.Green
    }
    if (this.itemStr === this.selectedItemStr) {
      return Color.Red
    }
    return Color.White
  }

  getFontColor() {
    if (!this.hasSelected) {
      return Color.Black
    }
    if (this.itemStr === this.answer) {
      return Color.White
    }
    if (this.itemStr === this.selectedItemStr) {
      return Color.White
    }
    return Color.Black
  }
}