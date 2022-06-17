import {BusinessPicker} from '../common/BusinessPickerNew';
import {Business} from '../common/Business';
import router from '@system.router';
import prompt from '@system.prompt';

@Entry
@Component
struct indexAtr {
  finalBusinessModel : Business  = new Business()
  day : string [] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
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
          Row() {
            Button('Apply', { type: ButtonType.Normal })
              .onClick((event: ClickEvent) => {
                var done : boolean = true
                this.finalBusinessModel.reset()
                console.log(this.working.toString())
                for(var i :number = 0;i <7;i++){
                  if (this.working[i] == true){
                    console.log(this.finalBusinessModel.getFromTime(i+1))
                    if (this.business.getFromTime(i+1) === "Set Time"||this.business.getToTime(i+1) === "Set Time"){
                      prompt.showToast({
                        message: "Set the from and to time properly for the date: " + this.day[i].toString()
                      })
                      done = false
                      break
                    }
                    this.finalBusinessModel.setWorkingDay(i+1, true)
                    this.finalBusinessModel.setFromTime(i+1,this.business.getFromTime(i+1))
                    this.finalBusinessModel.setToTime(i+1,this.business.getToTime(i+1))
                  }
                }
                if (done){
                  this.tempModel = this.finalBusinessModel
                  prompt.showToast({
                    message: "Saved"
                  })
                }
              }).width('50%').backgroundColor(0x7aa150)
            Button('View', { type: ButtonType.Normal })
              .onClick(() => {
                console.log(JSON.stringify(this.finalBusinessModel))
                router.push({
                  uri : 'pages/viewerIndex',
                  params:{
                    finalBusinessModel : this.tempModel,
                  }});
              }).width('50%')
          }.padding({left:20, right: 20}).alignSelf(ItemAlign.Center)
        }
      }
    }
  }
}