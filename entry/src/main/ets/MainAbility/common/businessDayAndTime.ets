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

  build(){
    Row(){
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.day).fontSize(this.size)
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor(0x39a2db)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean) => {
            this.business.setWorkingDay(1,isOn);
            this.working[this.dayIndex - 1] = isOn;

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
                  onAccept: (value: TimePickerResult) => {
                    this.fromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                    this.business.setFromTime(this.dayIndex,this.fromTime)
                    console.log(this.business.getFromTime(1))

                  },
                  onCancel: () => {
                    console.info("TimePickerDialog:onCancel()")
                  },
                  onChange: (value: TimePickerResult) => {
                    this.fromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                    this.business.setFromTime(this.dayIndex,this.fromTime)
                  }
                })
              }).fontSize(this.size-5).padding({top:20})
            }

            Column(){
              Text("To").fontSize(this.size-3)
              Text(this.toTime).onClick(() =>{
                TimePickerDialog.show({
                  useMilitaryTime: this.isUseMilitaryTime,
                  onAccept: (value: TimePickerResult) => {
                    this.toTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                    this.business.setToTime(this.dayIndex,this.toTime)
                    //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                  },
                  onCancel: () => {
                    console.info("TimePickerDialog:onCancel()")
                  },
                  onChange: (value: TimePickerResult) => {
                    this.toTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                    this.business.setToTime(this.dayIndex,this.toTime)
                    //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
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