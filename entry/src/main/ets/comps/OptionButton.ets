@Component
export struct OptionButton {

  label:string
  stokeColor:Color
  bgColor:Color
  textColor:Color
  click:()=>void

  build() {
    Button(this.label,{
      stateEffect:true
    }).type(ButtonType.Capsule)
      .fontColor(this.textColor)
      .backgroundColor(this.bgColor)
      .borderWidth(2)
      .borderColor(this.stokeColor)
      .onClick(this.click)
  }
}