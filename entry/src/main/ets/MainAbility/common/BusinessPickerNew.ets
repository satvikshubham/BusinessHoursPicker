import prompt from '@system.prompt';
import {Business} from './Business';
import {businessDayAndTime} from './businessDayAndTime';
import {Viewer} from './Viewer'

@Entry
@Preview
@Component
export struct BusinessPicker{
  @State business : Business = new Business();
  @State working : boolean[] = [false,false,false,false,false,false,false];
  @State finalBusinessModel : Business = new Business()
  scroller:Scroller=new Scroller();
  build() {
//    Scroll(this.scroller){
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
      }.padding(20)
  }
}