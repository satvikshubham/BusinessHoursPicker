import { Business } from './Business';
import { BusinessDayAndTime } from './BusinessDayAndTime';

@CustomDialog
export struct BusinessPickerDialog {
  time: string
  where: string
  dayInd: number
  format : number
  callback: (selIndex, where, dayInd) => void
  arr12: string [] = [
    "12h", "12:00 AM", "01:00 AM", "02:00 AM", "03:00 AM",
    "04:00 AM", "05:00 AM", "06:00 AM", "07:00 AM", "08:00 AM",
    "09:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM",
    "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM",
    "07:00 PM", "08:00 PM", "09:00 PM", "10:00 PM", "11:00 PM",
  ]

  arr24: string[]
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
        if (this.format ==24){
          ForEach(this.arr24, (item) => {
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
        else{
          ForEach(this.arr12, (item) => {
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
  day: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @Link selectedBusinessModel: Business
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  bhTextColor: string = '#000000'
  bhTextSize: number = 20
  bhTextStyle: string = 'calibri'
  bhFormat : number = 24
  build() {
    Column() {
      ForEach(this.arr,
        item => {
          BusinessDayAndTime({
            dayIndex: item + 1,
            day: this.day[item],
            business: $selectedBusinessModel,
            bhTextColor : this.bhTextColor,
            bhTextSize : this.bhTextSize,
            bhTextStyle : this.bhTextStyle,
            bhFormat : this.bhFormat
          })
        }
      )
    }.padding(20)
  }
}