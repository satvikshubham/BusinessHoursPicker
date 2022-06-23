import { Business } from './Business';
import { BusinessDayAndTime } from './BusinessDayAndTime';

@CustomDialog
export struct BusinessPickerDialog {
  time: string
  where: string
  dayInd: number
  callback: (selIndex, where, dayInd) => void
  arr: string[]
    = [
    "24h", "00:00", "01:00", "02:00", "03:00",
    "04:00", "05:00", "06:00", "07:00", "08:00",
    "09:00", "10:00", "11:00", "12:00", "13:00",
    "14:00", "15:00", "16:00", "17:00", "18:00",
    "19:00", "20:00", "21:00", "22:00", "23:00",
  ]
  controller: CustomDialogController

  build() {
    Column() {
      List({ initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .padding(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xFFFFFF)
              .onClick(() => {
                this.callback(item, this.where, this.dayInd)
                this.controller.close()
              })
          }
        }, item => item)
      }
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: 2, color: 0xd5d9de })
      .edgeEffect(EdgeEffect.Spring)
    }.height('30%').width('50%')
    .borderRadius(20)
  }
}

@Component
export struct BusinessPicker {
  @State business: Business = new Business();
  day: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @Link selectedBusinessModel: Business
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]

  build() {
    Column() {
      ForEach(this.arr,
        item => {
          BusinessDayAndTime({
            dayIndex: item + 1,
            day: this.day[item],
            business: $business,
          })
        }
      )
    }.padding(20)
  }
}