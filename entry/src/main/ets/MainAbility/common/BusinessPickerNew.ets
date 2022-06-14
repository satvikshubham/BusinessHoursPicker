//import {BasePojo}from './BasePojo';
//import {BusinessHours}from './BusinessHours';
import {Business} from './Business';
import prompt from '@system.prompt';
import {businessDayAndTime} from './businessDayAndTime';

@Entry
@Preview
@Component
export struct BusinessPicker{
  @State business : Business = new Business();
  @State working : boolean[] = [false,false,false,false,false,false,false];
  @State finalBusinessModel : Business = new Business()
  scroller:Scroller=new Scroller();
  build() {
    Scroll(this.scroller){
      Column(){
        businessDayAndTime({
          dayIndex : 1,
          day : "Monday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex : 2,
          day : "Tuesday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex : 3,
          day : "Wednesday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex : 4,
          day : "Thursday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex : 5,
          day : "Friday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex : 6,
          day : "Saturday",
          business : this.business,
          working : this.working
        })
        businessDayAndTime({
          dayIndex :7 ,
          day : "Sunday",
          business : this.business,
          working : this.working
        })
        Flex ({justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Row}) {
          Button('Apply', { type: ButtonType.Capsule })
            .onClick((event: ClickEvent) => {
              this.finalBusinessModel.reset()
              console.log(JSON.stringify(this.business))
              console.log(this.working.toString())
              for(var i :number = 0;i <7;i++){
                if (this.working[i] == true){
                  console.log(i.toString())
                  this.finalBusinessModel.setWorkingDay(i+1, true)
                  this.finalBusinessModel.setFromTime(i+1,this.business.getFromTime(i+1))
                  this.finalBusinessModel.setToTime(i+1,this.business.getToTime(i+1))
                }
              }
              console.log(JSON.stringify(this.finalBusinessModel))
              console.log("Apply Button Pressed")

            })
          Button('View', { type: ButtonType.Capsule })
            .onClick((event: ClickEvent) => {
              console.log("View Button Pressed")
            })
        }
      }.padding(20)
    }
  }
}