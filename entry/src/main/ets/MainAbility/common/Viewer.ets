import {Business} from './Business';

@Preview
@Component
@Entry

export struct Viewer{
  scroller:Scroller=new Scroller();
  business : Business = new Business();
  build(){
    Scroll(this.scroller) {

      Column() {
        Flex({  justifyContent:FlexAlign.Center}){
          Row(){
            Column(){
              Text("Monday").fontSize(14)
              Text("Tuesday").fontSize(14)
              Text("Wednesday").fontSize(14)
              Text("Thursday").fontSize(14)
              Text("Friday").fontSize(14)
              Text("Saturday").fontSize(14)
              Text("Sunday").fontSize(14)
            }
            Column(){
              Text(this.business.getFromTime[0]+ " to "+ this.business.getToTime[0]).fontSize(14)
              Text(this.business.getFromTime[1]+ " to "+ this.business.getToTime[1]).fontSize(14)
              Text(this.business.getFromTime[2]+ " to "+ this.business.getToTime[2]).fontSize(14)
              Text(this.business.getFromTime[3]+ " to "+ this.business.getToTime[3]).fontSize(14)
              Text(this.business.getFromTime[4]+ " to "+ this.business.getToTime[4]).fontSize(14)
              Text(this.business.getFromTime[5]+ " to "+ this.business.getToTime[5]).fontSize(14)
              Text(this.business.getFromTime[6]+ " to "+ this.business.getToTime[6]).fontSize(14)
            }
          }
        }
      }.padding(20)
    }
  }
}
