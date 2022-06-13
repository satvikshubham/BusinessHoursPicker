import {BasePojo}from './BasePojo';
import {BusinessHours}from './BusinessHours';
import {Business} from './Business';
@Entry
@Preview
@Component
export struct BusinessPicker{
  @State weekDaysIndex : number [] = [1,2,3,4,5,6,7];
  @State working : boolean[] = [false,false,false,false,false,false,false];
  @State BusinessTime : BusinessHours[] = [];
  private selectedTime: Date = new Date('08-00')
  @State business: Business = new Business();
  @State isUseMilitaryTime: boolean = true
  @State time : string = "Hello";
//  business = new Business();
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text("Monday").fontSize(25)
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor(0x39a2db)
          .switchPointColor(0xe5ffffff)
          .onChange((isOn: boolean) => {
            this.business.setWorkingDay(1,isOn);
            this.working[0] = isOn;
          })
      }

      if (this.working[0]){
        Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
            Column(){
              Text("From").fontSize(22)
              Text(this.business.getFromTime(1)).onClick(() =>{
                TimePickerDialog.show({
                  useMilitaryTime: this.isUseMilitaryTime,
                  onAccept: (value: TimePickerResult) => {
                    this.business.setFromTime(1,JSON.stringify(value))
//                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                  },
                  onCancel: () => {
                    console.info("TimePickerDialog:onCancel()")
                  },
                  onChange: (value: TimePickerResult) => {
                    this.business.setFromTime(1,JSON.stringify(value))
//                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                  }
                })
              }).fontSize(20).padding({top:20})
            }
            Column(){
              Text("To").fontSize(22)
              Text(this.time).onClick(() =>{
                TimePickerDialog.show({
                  useMilitaryTime: this.isUseMilitaryTime,
                  onAccept: (value: TimePickerResult) => {
                    this.time = JSON.stringify(value)
                    //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                  },
                  onCancel: () => {
                    console.info("TimePickerDialog:onCancel()")
                  },
                  onChange: (value: TimePickerResult) => {
                    this.business.setFromTime(1,JSON.stringify(value))
                    //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                  }
                })
              }).fontSize(20).padding({top:20})
            }
          }
        }.padding(20).visibility(Visibility.Visible)
      }
      Divider().height(20).width('95%')

    }.padding(20)
  }
}