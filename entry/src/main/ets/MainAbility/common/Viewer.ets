import { Business } from './Business';

@Component
export struct Viewer {
  private finalBusinessModel: Business = undefined
  days: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  size: number = 20
  dat = new Date().getDay()
  color: string = 'black'

  aboutToAppear() {
    this.finalBusinessModel = new Business(this.finalBusinessModel)
  }

  isWorking(business: Business, dayInd: number) {
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
      return false;
    }
    return true;
  }

  getText(business: Business, dayInd: number) {
    var a: string = ""
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
    }
    else if (business.getToTime(dayInd) == "" && business.isWorkingDay(dayInd))  {
      a = business.getFromTime(dayInd)
    }
    else {
      a = business.getFromTime(dayInd) + " to " + business.getToTime(dayInd)
    }
    return a;
  }

  getColor(dayInd: number) {
    if (dayInd == this.dat) {
      return 'green'
    }
    else {
      return 'black'
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

  build() {
      Column() {
        Column({ space: 10 }) {

          if (this.isWorking(this.finalBusinessModel, 1)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 1)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Monday").fontSize(this.size).fontColor(this.getColor(1))
              Text(this.getText(this.finalBusinessModel, 1)).fontSize(this.size).fontColor(this.getColor(1))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 2)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 2)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Tuesday").fontSize(this.size).fontColor(this.getColor(2))
              Text(this.getText(this.finalBusinessModel, 2)).fontSize(this.size).fontColor(this.getColor(2))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 3)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 3)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Wednesday").fontSize(this.size).fontColor(this.getColor(3))
              Text(this.getText(this.finalBusinessModel, 3)).fontSize(this.size).fontColor(this.getColor(3))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 4)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 4)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Thursday").fontSize(this.size).fontColor(this.getColor(4))
              Text(this.getText(this.finalBusinessModel, 4)).fontSize(this.size).fontColor(this.getColor(4))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 5)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 5)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Friday").fontSize(this.size).fontColor(this.getColor(5))
              Text(this.getText(this.finalBusinessModel, 5)).fontSize(this.size).fontColor(this.getColor(5))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 6)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 6)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Saturday").fontSize(this.size).fontColor(this.getColor(6))
              Text(this.getText(this.finalBusinessModel, 6)).fontSize(this.size).fontColor(this.getColor(6))
            }
          }

          if (this.isWorking(this.finalBusinessModel, 7)) {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Image(this.getImage(this.finalBusinessModel, 7)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text("Sunday").fontSize(this.size).fontColor(this.getColor(7))
              Text(this.getText(this.finalBusinessModel, 7)).fontSize(this.size).fontColor(this.getColor(7))
            }
          }
        }.alignItems(HorizontalAlign.Start)
      }.padding(20)
    }
}
