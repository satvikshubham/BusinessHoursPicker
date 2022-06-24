import { Business } from './Business';

@CustomDialog
export struct TimeSelectorDialog {
  time: string
  where: string
  dayInd: number
  format: number
  callback: (selIndex, where, dayInd) => void
  arr12: string [] = [
    "24h", "12:00 AM", "01:00 AM", "02:00 AM", "03:00 AM",
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
        if (this.format == 24) {
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
        else {
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
    }.height('60%').width('50%')
    .borderRadius(20)
  }
}


@Component
export struct BusinessDayAndTime {
  @State fTime: string = ""
  @State tTime: string = ""
  where: string = "from"
  bhFormat: number = 24
  private dayIndex: number = 0;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: TimeSelectorDialog({
      time: this.fTime,
      where: this.where,
      dayInd: this.dayIndex,
      format: this.bhFormat,
      callback: (selIndex) => this.cb(selIndex, this.where, this.dayIndex)
    }),
    autoCancel: true,
    customStyle: true,
    alignment: DialogAlignment.Default
  })

  cb(selIndex: string, what: string, dayInd: number) {
    if (what === "from") {
      this.fTime = selIndex
      this.business.setFromTime(dayInd, this.fTime)
    }
    else {
      this.tTime = selIndex
      this.business.setToTime(dayInd, this.tTime)
    }
  }

  bhTextColor: string = '#000000'
  bhTodayColor : string = '#4e754d'
  bhTextSize: number = 20
  bhTextStyle: string = 'calibri'
  private day: string = "";
  @State toggle: boolean = false
  @Link business: Business
  temp: Resource = $r('app.media.drop')

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.day).fontSize(this.bhTextSize).fontColor(this.bhTextColor).fontFamily(this.bhTextStyle)
        Toggle({ type: ToggleType.Switch, isOn: this.toggle })
          .selectedColor(this.bhTodayColor)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean = this.toggle) => {
            if (isOn) {
              this.toggle = true;
            }
            this.business.setWorkingDay(this.dayIndex, isOn);
            if (!isOn) {
              this.fTime = ""
              this.tTime = ""
              this.toggle = false
              this.business.setFromTime(this.dayIndex, "")
              this.business.setToTime(this.dayIndex, "")
              this.business.setWorkingDay(this.dayIndex, false)
            }
          })
      }.height(40)

      if (this.business.isWorkingDay(this.dayIndex)) {
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text(this.fTime).fontSize(this.bhTextSize).fontColor(this.bhTextColor).fontFamily(this.bhTextStyle)
              Image(this.temp).height(20).width(20)
            }.onClick(() => {
              this.where = "from"
              this.dialogController.open()
            })
          }.padding({ right: 5 })

          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text(this.tTime)
                .fontSize(this.bhTextSize)
                .fontColor(this.bhTextColor)
                .fontFamily(this.bhTextStyle)
                .margin({ left: 5 })
              Image(this.temp).height(20).width(20)
            }.onClick(() => {
              this.where = "to"
              this.dialogController.open()
            })
          }
        }.padding({ top: 20, right: 20 })

        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Divider().width(120).strokeWidth(1.2)
          Divider().width(120).margin({ right: 30 }).strokeWidth(1.2)
        }.padding({ bottom: 20 })
      }
    }
  }
}