import { Business } from './Business';

@Component
export struct BusinessHoursWeekView {
  private showBusinessModel: Business = undefined
  dat = new Date().getDay()
  bhIcon: Resource = $r('app.media.calendar')
  bhIconPadding: number = 10
  bhTextColor: string = '#000000'
  bhTextSize: number = 20
  bhTextStyle: string = 'calibri'
  bhTodayColor: string = '#4e754d'
  bhTodayStyle: string = 'calibri'
  bhTodayTextSize: number = 20
  bhTodayIcon: Resource = $r('app.media.unlock')

  aboutToAppear() {
    this.showBusinessModel = new Business(this.showBusinessModel)
  }

  isWorking = (business: Business, dayInd: number): boolean => {
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
      return false;
    }
    return true;
  }
  getFontStyle = (dayIndex: number): string => {
    if (dayIndex == this.dat) {
      return this.bhTodayStyle
    }
    else {
      return this.bhTextStyle
    }
  }
  getFontSize = (dayIndex: number): number => {
    if (dayIndex == this.dat) {
      return this.bhTodayTextSize
    }
    else {
      return this.bhTextSize
    }
  }
  getText = (business: Business, dayInd: number): string => {
    var a: string = ""
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
    }
    else {
      a = business.getFromTime(dayInd) + " - " + business.getToTime(dayInd)
    }
    return a;
  }
  getFontColor = (dayInd: number): string => {
    if (dayInd == this.dat) {
      return this.bhTodayColor
    }
    else {
      return this.bhTextColor
    }
  }
  getImage = (bus: Business, dI): Resource => {
    if (dI == this.dat) {
      return this.bhTodayIcon
    }
    else {
      return this.bhIcon
    }
  }
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  dayArr: string[] = Business.dayArr

  build() {
    Column({ space: 10 }) {
      ForEach(this.arr,
        item => {
          if (this.isWorking(this.showBusinessModel, item + 1)) {
            Row({ space: 10 }) {
              Image(this.getImage(this.showBusinessModel, item + 1)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text(this.dayArr[item] + ", " + this.getText(this.showBusinessModel, item + 1))
                .fontSize(this.getFontSize(item + 1))
                .fontColor(this.getFontColor(item + 1))
                .fontFamily(this.getFontStyle(item + 1))
                .padding({ left: this.bhIconPadding })
            }.width('100%')
          }
        }
      )
    }.padding(20).backgroundColor(0xFFFFFF)
    .justifyContent(FlexAlign.Center)
  }
}