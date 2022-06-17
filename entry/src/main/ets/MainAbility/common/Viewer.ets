import {Business} from './Business';


@Component

export struct Viewer{
  scroller :Scroller = new Scroller()
  private finalBusinessModel : Business = undefined
  days : string [] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
  size : number = 20
  dat = new Date().getDay()
  color : string = 'black'
  aboutToAppear(){
    this.finalBusinessModel = new Business(this.finalBusinessModel)
  }
  isWorking(business: Business,dayInd: number){
    if (business.getFromTime(dayInd) == "Set Time" || business.getToTime(dayInd) == "Set Time" || !business.isWorkingDay(dayInd)){
      return false;
    }
    return true;
  }
  getText (business:Business, dayInd :number){
    var a : string = ""
    if (business.getFromTime(dayInd) == "Set Time" || business.getToTime(dayInd) == "Set Time" || !business.isWorkingDay(dayInd)){

    }
    else{
      a = business.getFromTime(dayInd) + " to " + business.getToTime(dayInd)
    }
    return a;
  }
  getColor(dayInd:number) {
    if (dayInd == this.dat){
      return 'green'
    }
    else{
      return 'black'
    }
  }
  build(){
    Scroll(this.scroller) {
      Column() {
          Column({ space: 10 }) {
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,1)){
                Text("Monday").fontSize(this.size).fontColor(this.getColor(1))
                Text(this.getText(this.finalBusinessModel,1)).fontSize(this.size).fontColor(this.getColor(1))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,2)){
                Text("Tuesday").fontSize(this.size).fontColor(this.getColor(2))
                Text(this.getText(this.finalBusinessModel,2)).fontSize(this.size).fontColor(this.getColor(2))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,3)) {
                Text("Wednesday").fontSize(this.size).fontColor(this.getColor(3))
                Text(this.getText(this.finalBusinessModel,3)).fontSize(this.size).fontColor(this.getColor(3))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,4)) {
                Text("Thursday").fontSize(this.size).fontColor(this.getColor(4))
                Text(this.getText(this.finalBusinessModel,4)).fontSize(this.size).fontColor(this.getColor(4))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,5)) {
                Text("Friday").fontSize(this.size).fontColor(this.getColor(5))
                Text(this.getText(this.finalBusinessModel,5)).fontSize(this.size).fontColor(this.getColor(5))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,6)) {
                Text("Saturday").fontSize(this.size).fontColor(this.getColor(6))
                Text(this.getText(this.finalBusinessModel,6)).fontSize(this.size).fontColor(this.getColor(6))
              }
            }
            Flex({justifyContent:FlexAlign.SpaceBetween}) {
              if (this.isWorking(this.finalBusinessModel,7)) {
                Text("Sunday").fontSize(this.size).fontColor(this.getColor(7))
                Text(this.getText(this.finalBusinessModel,7)).fontSize(this.size).fontColor(this.getColor(7))
              }
            }

          }.alignItems(HorizontalAlign.Start)
      }.padding(20).alignItems(HorizontalAlign.Center)
    }
  }
}
