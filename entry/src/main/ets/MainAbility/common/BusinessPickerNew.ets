import prompt from '@system.prompt';
import { Business } from './Business';
import { businessDayAndTime } from './BusinessDayAndTime';
import router from '@system.router';


@Component
export struct BusinessPicker {
  @State business: Business = new Business();
  day: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @State selectedBusinessModel: Business = new Business()
  done: boolean
  scroller: Scroller= new Scroller();
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]

  build() {
    Column() {
      ForEach(this.arr,
        item => {
          businessDayAndTime({
            dayIndex: item + 1,
            day: this.day[item],
            business: this.business,
          })
        }
      )
      Row() {
        Button('Apply', { type: ButtonType.Normal })
          .onClick((event: ClickEvent) => {
            this.done = this.business.isValid(this.business.getWorkingDays())
            this.selectedBusinessModel.reset()
            if (this.done) {
              for (var i: number = 0;i < 7; i++) {
                if (this.business.isWorkingDay(i+1) == true) {
                  this.selectedBusinessModel.setWorkingDay(i + 1, true)
                  this.selectedBusinessModel.setFromTime(i + 1, this.business.getFromTime(i + 1))
                  this.selectedBusinessModel.setToTime(i + 1, this.business.getToTime(i + 1))
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
                  finalBusinessModel: this.selectedBusinessModel,
                } });
            }
            else {
              prompt.showToast({
                message: "Correct changes"
              })
            }
          }).width('50%')
      }.margin({ top: 20 }).alignSelf(ItemAlign.Center)
    }.padding(20)
  }
}