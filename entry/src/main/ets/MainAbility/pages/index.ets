import {BusinessPicker} from '../common/BusinessPickerNew';
import {businessDayAndTime} from '../common/businessDayAndTime';
import {Business} from '../common/Business';
import router from '@system.router';
import {Viewer} from '../common/Viewer'
import prompt from '@system.prompt';

@Entry
@Component
export struct indexAtr {
  finalBusinessModel : Business  = new Business();
  business : Business  = new Business();
  working : boolean[] = [false,false,false,false,false,false,false];
  scroller : Scroller = new Scroller()

  build(){
    Scroll(this.scroller){
      Column(){
        Flex({direction:FlexDirection.Column, alignContent: FlexAlign.SpaceBetween}){
          BusinessPicker({
            finalBusinessModel : this.finalBusinessModel,
            working : this.working,
            business: this.business
          })
          Flex ({justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Row}) {
            Button('Apply', { type: ButtonType.Capsule })
              .onClick((event: ClickEvent) => {
                this.finalBusinessModel.reset()
                for(var i :number = 0;i <7;i++){
                  if (this.working[i] == true){
                    this.finalBusinessModel.setWorkingDay(i+1, true)
                    this.finalBusinessModel.setFromTime(i+1,this.business.getFromTime(i+1))
                    this.finalBusinessModel.setToTime(i+1,this.business.getToTime(i+1))
                  }
                }
                prompt.showToast({
                  message: "Saved"
                })
              })
            Button('View', { type: ButtonType.Capsule })
              .onClick((event: ClickEvent) => {
                router.push({ uri : './viewerIndex'})
              })
          }.padding({left:20, right: 20})
        }
      }
    }
  }
}


//