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
            if (this.finalBusinessModel.getFromTime(1) == "Set Time" || this.finalBusinessModel.getToTime(1) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(1) + " to " + this.finalBusinessModel.getToTime(1))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(2) == "Set Time" || this.finalBusinessModel.getToTime(2) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(2) + " to " + this.finalBusinessModel.getToTime(2))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(3) == "Set Time" || this.finalBusinessModel.getToTime(3) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(3) + " to " + this.finalBusinessModel.getToTime(3))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(4) == "Set Time" || this.finalBusinessModel.getToTime(4) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(4) + " to " + this.finalBusinessModel.getToTime(4))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(5) == "Set Time" || this.finalBusinessModel.getToTime(5) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(5) + " to " + this.finalBusinessModel.getToTime(5))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(6) == "Set Time" || this.finalBusinessModel.getToTime(6) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(6) + " to " + this.finalBusinessModel.getToTime(6))
                .fontSize(this.size)
            }
            if (this.finalBusinessModel.getFromTime(7) == "Set Time" || this.finalBusinessModel.getToTime(7) == "Set Time"){
              Text("NA").fontSize(this.size)
            }
            else{
              Text(this.finalBusinessModel.getFromTime(7) + " to " + this.finalBusinessModel.getToTime(7))
                .fontSize(this.size)
            }
//            Text(this.finalBusinessModel.getFromTime(2) + " to " + this.finalBusinessModel.getToTime(2))
//              .fontSize(this.size)
//            Text(this.finalBusinessModel.getFromTime(3) + " to " + this.finalBusinessModel.getToTime(3))
//              .fontSize(this.size)
//            Text(this.finalBusinessModel.getFromTime(4) + " to " + this.finalBusinessModel.getToTime(4))
//              .fontSize(this.size)
//            Text(this.finalBusinessModel.getFromTime(5) + " to " + this.finalBusinessModel.getToTime(5))
//              .fontSize(this.size)
//            Text(this.finalBusinessModel.getFromTime(6) + " to " + this.finalBusinessModel.getToTime(6))
//              .fontSize(this.size)
//            Text(this.finalBusinessModel.getFromTime(7) + " to " + this.finalBusinessModel.getToTime(7))
//              .fontSize(this.size)
          }.alignItems(HorizontalAlign.End)
        }
      }.padding(20).alignItems(HorizontalAlign.Center)
    }
  }
}
