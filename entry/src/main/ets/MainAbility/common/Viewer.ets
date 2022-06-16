import {Business} from './Business';


@Component

export struct Viewer{
  scroller :Scroller = new Scroller()
  private finalBusinessModel : Business = undefined
  days : string [] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
  size : number = 20
  aboutToAppear(){
    this.finalBusinessModel = new Business(this.finalBusinessModel)
  }
  willCome (business : Business, dayInd : number){
    if (business.getFromTime(dayInd) == "Set Time" || business.getToTime(dayInd) == "Set Time" || !business.isWorkingDay(dayInd)){
      return false;
    }
    else{ return true;}
  }
  getText (business:Business, dayInd :number){
    var a : string = "NA"
    if (business.getFromTime(dayInd) == "Set Time" || business.getToTime(dayInd) == "Set Time" || !business.isWorkingDay(dayInd)){

    }
    else{
      a = business.getFromTime(dayInd) + " to " + business.getToTime(dayInd)
    }
    return a;
  }
  build(){
    Scroll(this.scroller) {
      Column() {
        Flex({justifyContent:FlexAlign.SpaceBetween}) {
          Column({ space: 10 }) {
            Text("Monday").fontSize(this.size)
            Text("Tuesday").fontSize(this.size)
            Text("Wednesday").fontSize(this.size)
            Text("Thursday").fontSize(this.size)
            Text("Friday").fontSize(this.size)
            Text("Saturday").fontSize(this.size)
            Text("Sunday").fontSize(this.size)
          }.alignItems(HorizontalAlign.Start)

          Column({ space: 10 }) {
            Text(this.getText(this.finalBusinessModel,1)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,2)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,3)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,4)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,5)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,6)).fontSize(20)
            Text(this.getText(this.finalBusinessModel,7)).fontSize(20)
          }.alignItems(HorizontalAlign.End)
        }
      }.padding(20).alignItems(HorizontalAlign.Center)
    }
  }
}
