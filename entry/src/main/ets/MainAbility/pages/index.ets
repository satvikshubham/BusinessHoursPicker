import {BusinessPicker} from '../common/BusinessPickerNew';
import {Business} from '../common/Business';
import router from '@system.router';
import prompt from '@system.prompt';

@Entry
@Component
struct indexAtr {
  finalBusinessModel : Business  = new Business()
  @State tempModel : Business = new Business()
  business : Business  = new Business();
  working : boolean[] = [false,false,false,false,false,false,false];
  scroller : Scroller = new Scroller();

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
                this.tempModel = this.finalBusinessModel
                prompt.showToast({
                  message: "Saved"
                })
              })
            Button('View', { type: ButtonType.Capsule })
              .onClick(() => {
                console.log(JSON.stringify(this.finalBusinessModel))
                router.push({
                  uri : 'pages/viewerIndex',
                  params:{
                    finalBusinessModel : this.tempModel,
                  }});
              })
          }.padding({left:20, right: 20})
        }
      }
    }
  }
}