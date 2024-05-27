import { SpecItem } from './SpecItem'
import { OptionButton} from './OptionButton'
// @Preview
@CustomDialog
export struct FinishDialog {

  controller : CustomDialogController
  rate : number = 0
  count: number
  time : string

  build() {
    Column({space:5}) {

      Text("确认要提交吗？").offset({y : 20})
      .fontWeight(FontWeight.Bold)
      .fontSize(20)
      .margin(10)

      //准确率
      SpecItem({
        label:'准确率'
      }) {
        Text(this.rate+"%")
      }
      //个数
      SpecItem({
        label:'个数'
      }) {
        Text(this.count.toString())
      }
      //用时
      SpecItem({
        label:'用时'
      }) {
        Text(this.time)
      }

      Row({space:50}) {
        OptionButton({
          label:'提交',
          textColor:Color.Black,
          click:()=> {
            this.controller.close()
          }
        })

        OptionButton({
          label:'取消',
          textColor:Color.Black,
          click:()=> {
            this.controller.close()
          }
        })
      }.offset({y:-10})
    }.backgroundColor(Color.White)
    .width('80%')
    .borderRadius(10)
  }
}