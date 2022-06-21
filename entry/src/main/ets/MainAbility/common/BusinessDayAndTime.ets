import { Business } from './Business';

@CustomDialog
struct CustomDialogExample {
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

  transfer(index: string) {
    return index
  }

  build() {
    Column() {
      List({ initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .height(30)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xFFFFFF)
              .onClick((time) => {
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
  }
}


@Component
export struct businessDayAndTime {
  private day: string = "";
  private dayIndex: number = 0;
  private size: number = 15;
  working: boolean[]
  @State fTime: string = ""
  @State tTime: string = ""
  @State toggle: boolean = false
  where: string = "from"
  business: Business
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      time: this.fTime,
      where: this.where,
      dayInd: this.dayIndex,
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

  temp: Resource = $r('app.media.drop')

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.day).fontSize(this.size)
        Toggle({ type: ToggleType.Switch, isOn: this.toggle })
          .selectedColor(0x39a2db)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean = this.toggle) => {
            if (isOn) {
              this.toggle = true;
            }
            this.business.setWorkingDay(this.dayIndex, isOn);
            this.working[this.dayIndex - 1] = isOn;
            if (!isOn) {
              this.fTime = ""
              this.tTime = ""
              this.toggle = false
              this.business.setFromTime(this.dayIndex, "")
              this.business.setToTime(this.dayIndex, "")
            }
          })
      }

      if (this.working[this.dayIndex - 1]) {
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            Column() {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Text(this.fTime).fontSize(this.size - 2)
                Image(this.temp).height(20).width(20)
              }.onClick(() => {
                this.where = "from"
                this.dialogController.open()
              })
            }.padding({ right: 5 })

            Column() {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Text(this.tTime).fontSize(this.size - 2).margin({ left: 5 })
                Image(this.temp).height(20).width(20)
              }.onClick(() => {
                this.where = "to"
                this.dialogController.open()
              })
            }
          }
        }.padding({ right: 20 }).visibility(Visibility.Visible)

        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Divider().width(120)
          Divider().width(120).margin({ right: 30 })
        }
      }
    }
  }
}