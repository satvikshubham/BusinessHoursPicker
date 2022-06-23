import { Business } from './Business';

@Component
export struct BusinessHoursWeekView {
  private showBusinessModel: Business = undefined
  size: number = 20
  dat = new Date().getDay()

  aboutToAppear() {
    this.showBusinessModel = new Business(this.showBusinessModel)
  }

  isWorking = (business: Business, dayInd: number): boolean => {
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
      return false;
    }
    return true;
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
  getColor = (dayInd: number): string => {
    if (dayInd == this.dat) {
      return '#4e754d                     '
    }
    else {
      return '#000000'
    }
  }
  getImage = (bus: Business, dI): Resource => {
    if (dI == this.dat) {
      return $r('app.media.unlock')
    }
    else {
      return $r('app.media.calendar')
    }
  }
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  dayArr: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  build() {
    Column({ space: 10 }) {
      ForEach(this.arr,
        item => {
          if (this.isWorking(this.showBusinessModel, item + 1)) {
            Row({ space: 10 }) {
              Image(this.getImage(this.showBusinessModel, item + 1)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text(this.dayArr[item] + ", " + this.getText(this.showBusinessModel, item + 1))
                .fontSize(this.size)
                .fontColor(this.getColor(item + 1))
            }.width('100%')
          }
        }
      )
    }.padding(20).backgroundColor(0xFFFFFF)
    .justifyContent(FlexAlign.Center)
  }
}
