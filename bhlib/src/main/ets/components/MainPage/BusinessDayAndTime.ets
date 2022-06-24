import { Business } from './Business';
import { BusinessPickerDialog } from './BusinessPicker'


@Component
export struct BusinessDayAndTime {
  @State fTime: string = ""
  @State tTime: string = ""
  where: string = "from"
  bhFormat: number = 24
  private dayIndex: number = 0;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: BusinessPickerDialog({
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
              Text(this.fTime).fontSize(this.bhTextSize - 2).fontColor(this.bhTextColor).fontFamily(this.bhTextStyle)
              Image(this.temp).height(20).width(20)
            }.onClick(() => {
              this.where = "from"
              this.dialogController.open()
            })
          }.padding({ right: 5 })

          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text(this.tTime)
                .fontSize(this.bhTextSize - 2)
                .fontColor(this.bhTextColor)
                .fontFamily(this.bhTextStyle)
                .margin({ left: 5 })
              Image(this.temp).height(20).width(20)
            }.onClick(() => {
              this.where = "to"
              this.dialogController.open()
            })
          }
        }.padding({ top: 20, right: 20 }).visibility(Visibility.Visible)

        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Divider().width(120).strokeWidth(1.2)
          Divider().width(120).margin({ right: 30 }).strokeWidth(1.2)
        }.padding({ bottom: 20 })
      }
    }
  }
}