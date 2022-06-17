import {Business} from './Business';

@CustomDialog
struct CustomDialogExample {
  time: string
  arr :string[]
    =[
    "24h","00:00", "01:00", "02:00", "03:00",
    "04:00", "05:00", "06:00", "07:00", "08:00",
    "09:00", "10:00", "11:00", "12:00", "13:00",
    "14:00", "15:00", "16:00", "17:00", "18:00",
    "19:00", "20:00", "21:00", "22:00", "23:00",
  ]
  controller: CustomDialogController
  transfer(index : string){
    return index
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              .onClick((time) =>{
                this.time = item
                console.log(this.time)
                this.controller.close()
              })
          }
        }, item => item)
      }
      .listDirection(Axis.Vertical) // Arrangement direction
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // Divider line
      .edgeEffect(EdgeEffect.None) // No effect when sliding to the edge
      .chainAnimation(false)
    }.borderRadius(10)
  }
}


@Component
export struct businessDayAndTime {
  private day : string = "";
  private dayIndex : number = 0;
  private size : number = 15;
  working : boolean[]
  @State private fromTime : string = "Set Time";
  @State private toTime : string = "Set Time";
  @State private isUseMilitaryTime: boolean = true;
  @State fTime : string = "Ftime"
  business : Business
  getTime(t : string){
    if (t.length==1){
      return "0"+t;
    }
    else{
      return t;
    }
  }
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      time:this.fTime
    }),
    autoCancel: true,
  })

  build(){
    Column(){
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.day).fontSize(this.size)
        Toggle({ type: ToggleType.Switch})
          .selectedColor(0x39a2db)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean) => {
            this.business.setWorkingDay(this.dayIndex,isOn);
            this.working[this.dayIndex - 1] = isOn;
            if (!isOn){
              this.fromTime = "Set Time"
              this.toTime = "Set Time"
              this.business.reset()
            }
          })
      }

      if (this.working[this.dayIndex - 1]){
        Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
            Column(){
              Text(this.fTime).fontSize(this.size-2)
              .onClick(() =>{
                this.dialogController.open()
                console.log(this.fTime)
              })
//              Text(this.fromTime).onClick(() =>{
//                TimePickerDialog.show({
//                  useMilitaryTime: this.isUseMilitaryTime,
//                  selected: new Date('09-00'),
//
//                  onAccept: (value: TimePickerResult) => {
//                    this.fromTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
//                    this.business.setFromTime(this.dayIndex,this.fromTime)
//
//                  },
//                  onCancel: () => {
//                    this.fromTime = "Set Time"
//                    this.toTime = "Set Time"
//                  },
//                  onChange: (value: TimePickerResult) => {
//                    this.fromTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
//                    this.business.setFromTime(this.dayIndex,this.fromTime)
//                  },
//                })
//              }).fontSize(this.size-5).padding({top:20})
            }

            Column(){
              Text("To").fontSize(this.size-3)
              Text(this.toTime).onClick(() =>{
                TimePickerDialog.show({
                  useMilitaryTime: this.isUseMilitaryTime,
                  selected: new Date('17-00'),
                  onAccept: (value: TimePickerResult) => {
                    this.toTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
                    this.business.setToTime(this.dayIndex,this.toTime)
                  },
                  onCancel: () => {
                    this.fromTime = "Set Time"
                    this.toTime = "Set Time"
                  },
                  onChange: (value: TimePickerResult) => {
                    this.toTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
                    this.business.setToTime(this.dayIndex,this.toTime)
                  }
                })
              }).fontSize(this.size-5).padding({top:20})
            }
          }
        }.padding({left:20, right: 20}).visibility(Visibility.Visible)
      }
    }
  }
}