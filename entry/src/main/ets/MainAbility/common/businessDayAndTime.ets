import {Business} from './Business';


@Component
export struct businessDayAndTime {
  private day : string = "";
  private dayIndex : number = 0;
  private size : number = 20;
  working : boolean[]
  @State private fromTime : string = "Set Time";
  @State private toTime : string = "Set Time";
  @State private isUseMilitaryTime: boolean = true;
  business : Business
  getTime(t : string){
    if (t.length==1){
      return "0"+t;
    }
    else{
      return t;
    }
  }
  build(){
    Column(){
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.day).fontSize(this.size)
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor(0x39a2db)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean) => {
            this.business.setWorkingDay(this.dayIndex,isOn);
            this.working[this.dayIndex - 1] = isOn;
            if (!isOn){
              this.fromTime = "Set Time"
              this.toTime = "Set Time"
            }
          })
      }

      if (this.working[this.dayIndex - 1]){
        Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
            Column(){
              Text("From").fontSize(this.size-3)
              Text(this.fromTime).onClick(() =>{
                TimePickerDialog.show({
                  useMilitaryTime: this.isUseMilitaryTime,
                  selected: new Date('09-00'),

                  onAccept: (value: TimePickerResult) => {
                    this.fromTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
                    this.business.setFromTime(this.dayIndex,this.fromTime)

                  },
                  onCancel: () => {
                    this.fromTime = "Set Time"
                    this.toTime = "Set Time"
                  },
                  onChange: (value: TimePickerResult) => {
                    this.fromTime = this.getTime(value.hour.toString()) + ":" + this.getTime(value.minute.toString())
                    this.business.setFromTime(this.dayIndex,this.fromTime)
                  },
                })
              }).fontSize(this.size-5).padding({top:20})
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
        }.padding(20).visibility(Visibility.Visible)
      }
    }
  }
}