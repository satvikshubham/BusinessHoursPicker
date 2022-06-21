import prompt from '@system.prompt';
import { Business } from './Business';
import { businessDayAndTime } from './BusinessDayAndTime';
import router from '@system.router';

@Entry
@Preview
@Component
export struct BusinessPicker {
  @State business: Business = new Business();
  @State working: boolean[] = [false, false, false, false, false, false, false];
  day: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @State tempModel: Business = new Business()
  @State selectedBusinessModel: Business = new Business()
  done : boolean
  scroller: Scroller= new Scroller();

  build() {
    Column() {
      businessDayAndTime({
        dayIndex: 1,
        day: "Monday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 2,
        day: "Tuesday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 3,
        day: "Wednesday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 4,
        day: "Thursday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 5,
        day: "Friday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 6,
        day: "Saturday",
        business: this.business,
        working: this.working
      })
      businessDayAndTime({
        dayIndex: 7,
        day: "Sunday",
        business: this.business,
        working: this.working
      })
      Row() {
        Button('Apply', { type: ButtonType.Normal })
          .onClick((event: ClickEvent) => {
            this.done = this.business.isValid(this.working)
            this.tempModel.reset()
            if (this.done) {
              for (var i: number = 0;i < 7; i++) {
                if (this.working[i] == true) {
                  this.tempModel.setWorkingDay(i + 1, true)
                  this.tempModel.setFromTime(i + 1, this.business.getFromTime(i + 1))
                  this.tempModel.setToTime(i + 1, this.business.getToTime(i + 1))
                }
              }
              this.selectedBusinessModel = this.tempModel
              prompt.showToast({
                message: "Saved"
              })
            }
          }).width('50%').backgroundColor(0x7aa150)
        Button('View', { type: ButtonType.Normal })
          .onClick(() => {
            if (this.done){
              router.push({
                uri: 'pages/viewerIndex',
                params: {
                  finalBusinessModel: this.selectedBusinessModel,
                } });
            }
            else{
              prompt.showToast({
                message: "Correct changes"
              })
            }
          }).width('50%')
      }.margin({ top: 20 }).alignSelf(ItemAlign.Center)
    }.padding(20)
  }
}