@Component
export struct SpecItem {
  label : string
  @BuilderParam view:() => void

  build() {
    Row(){
      Text(this.label)
      Blank().layoutWeight(1)
      this.view()
    }.height(30)
    .margin(10)
  }
}