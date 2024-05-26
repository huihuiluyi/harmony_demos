import { SpecItem } from '../comps/SpecItem'
import { StateItem } from '../comps/StateItem'
import { getQuestions, Question } from '../data/data'
import { TestStatus } from '../enums/TestStatus'
@Entry
@Component
struct PracticePage {

  @State totalCount : number = 3
  @State data : Question[] = getQuestions(this.totalCount)
  @State rightCount : number = 0
  @State selectedCount : number = 0
  @State currentQuestionIndex:number = 0
  @State answer: string = ''
  @State currentItemSelected : boolean = false
  @State selectedItemStr : string = ''
  @State testState : TestStatus = TestStatus.DEFAULT

  textTimerController : TextTimerController

  build() {
    Column(){
      Column()
      {

        //准确率
        SpecItem({
          label:'准确率'
        }) {
          Text(this.rightCount === 0 ? '0%': (this.rightCount/this.selectedCount * 100).toFixed(1) + '%').width('30%')
              .textAlign(TextAlign.Center)
        }

        //进度
        SpecItem({
          label:'进度'
        }) {
          Progress({
            value:this.selectedCount,
            total:this.totalCount,
            type:ProgressType.Linear
          }).width(100)
        }

        //个数
        SpecItem({
          label:'个数'
        }) {
          Button(this.totalCount.toString())
            .width(100)
            .backgroundColor(Color.Gray)
            .onClick(()=>{
              TextPickerDialog.show({
                range:['3','5','10'],
                value:this.totalCount.toString(),
                onAccept:(count:TextPickerResult)=> {
                  this.totalCount = parseInt(count.value)
                  this.data = getQuestions(this.totalCount)
                }
              })
            })
        }


        //用时
        SpecItem({
          label:'用时'
        }) {
          TextTimer({isCountDown:false,
            count:0,
          controller: this.textTimerController
          })
        }

      }.backgroundColor(Color.White)
        .width('95%')
        .margin(10)
      .borderRadius(10)

      Text(this.data[this.currentQuestionIndex].word)
        .fontWeight(FontWeight.Bold)
        .fontSize(40)

      Text(this.data[this.currentQuestionIndex].sentence)
        .fontColor(Color.White).margin(10).fontSize(20)

      Column({space:5}){
        ForEach(this.data[this.currentQuestionIndex].options,(option:string)=> {
          StateItem({
            itemStr: option,
            hasSelected: this.currentItemSelected,
            answer: this.data[this.currentQuestionIndex].answer,
            selectedItemStr: this.selectedItemStr,
            click:()=> {
              this.selectedItemStr = option
              this.currentItemSelected = true
              if (this.selectedItemStr === this.data[this.currentQuestionIndex].answer) {
                this.rightCount++
              }
              this.selectedCount++
              setTimeout(()=> {
                this.resetState()
              },500)
            }
          })
        })
      }

      Row({space:50}){
        Button('结束测试')
          .type(ButtonType.Capsule)
          .btnStyle({bg:Color.White,font:Color.Black,border:Color.Black})
          .enabled(this.testState == TestStatus.RUNNING)
          .onClick(()=> {
            this.stopTest()
          })

        Button(this.testState === TestStatus.RUNNING?'暂停测试':'开始测试')
          .type(ButtonType.Capsule)
          .btnStyle({bg:Color.Black,font:Color.White,border:Color.White})
          .onClick(()=> {
            if (this.testState === TestStatus.RUNNING) {
              this.pauseTest()
            } else {
              this.startTest()
            }
          })

      }


    }.backgroundColor(Color.Gray)
      .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)



  }

  resetState() {
    if (this.currentQuestionIndex >= this.totalCount - 1) {
      return
    }
    this.currentQuestionIndex++
    this.currentItemSelected = false
  }

  startTest() {
    this.testState = TestStatus.RUNNING
    this.textTimerController.start()
  }

  pauseTest() {
    this.testState = TestStatus.PAUSE
    this.textTimerController.pause()
  }

  stopTest() {
    this.testState = TestStatus.DEFAULT
    this.textTimerController.pause()
  }
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