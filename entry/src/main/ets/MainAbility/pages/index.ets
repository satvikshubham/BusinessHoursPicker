import {Business,BusinessPicker} from '@ohos/bhlib'
import prompt from '@system.prompt';
import router from '@system.router';

@Entry
@Component
struct indexAtr {
  @State finalBusinessModel: Business  = new Business()
  scroller: Scroller = new Scroller();
  tempBusiness : Business = new Business
  done : boolean
  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            selectedBusinessModel: $finalBusinessModel,
            business: this.tempBusiness
          })
        }
        Row(){
          Button("Apply", { type: ButtonType.Normal }).onClick(()=>{
            this.done = this.tempBusiness.isValid(this.tempBusiness.getWorkingDays())
            this.finalBusinessModel.reset()
            if (this.done) {
              for (var i: number = 0;i < 7; i++) {
                if (this.tempBusiness.isWorkingDay(i+1) == true) {
                  this.finalBusinessModel.setWorkingDay(i + 1, true)
                  this.finalBusinessModel.setFromTime(i + 1, this.tempBusiness.getFromTime(i + 1))
                  this.finalBusinessModel.setToTime(i + 1, this.tempBusiness.getToTime(i + 1))
                }
              }
              prompt.showToast({
                message: "Saved"
              })
            }
          }).width('50%').backgroundColor(0x7aa150)
          Button('View', { type: ButtonType.Normal })
            .onClick(() => {
              if (this.done) {
                router.push({
                  uri: 'pages/viewerIndex',
                  params: {
                    finalBusinessModel: this.finalBusinessModel,
                  } });
              }
              else {
                prompt.showToast({
                  message: "Correct changes"
                })
              }
            }).width('50%')
        }.padding({left:20, right:20})
      }
    }
  }
}