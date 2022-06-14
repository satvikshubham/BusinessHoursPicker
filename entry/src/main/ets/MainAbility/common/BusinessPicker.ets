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
  @State business: Business = new Business();
  @State isUseMilitaryTime: boolean = true
  @State time : string = "Hello";
  @State monFromTime : string = "Set Time";
  @State monToTime : string = "Set Time";
  @State tueFromTime : string = "Set Time";
  @State tueToTime : string = "Set Time";
  @State wedFromTime : string = "Set Time";
  @State wedToTime : string = "Set Time";
  @State thuFromTime : string = "Set Time";
  @State thuToTime : string = "Set Time";
  @State friFromTime : string = "Set Time";
  @State friToTime : string = "Set Time";
  @State satFromTime : string = "Set Time";
  @State satToTime : string = "Set Time";
  @State sunFromTime : string = "Set Time";
  @State sunToTime : string = "Set Time";
  scroller:Scroller=new Scroller();
  size : number = 20;
//  business = new Business();
  build() {
    Scroll(this.scroller){
      Column() {
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Monday").fontSize(this.size)
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
                Text("From").fontSize(this.size-3)
                Text(this.monFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.monFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.monFromTime = value.hour.toString()
                      this.business.setFromTime(1,this.monFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.monFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())

                      this.business.setFromTime(1,this.monFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.monToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.monToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.monToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.monToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.monToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Tuesday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[1] = isOn;
            })
        }

        if (this.working[1]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.tueFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.tueFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(2,this.tueFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.tueFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(2,this.tueFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.tueToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.tueToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(2,this.tueToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.tueToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.tueToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Wednesday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[2] = isOn;
            })
        }

        if (this.working[2]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.wedFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.wedFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.wedFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.wedFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.wedFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.wedToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.wedToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.wedToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.wedToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.wedToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Thursday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[3] = isOn;
            })
        }

        if (this.working[3]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.thuFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.thuFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.thuFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.thuFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.thuFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.thuToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.thuToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.thuToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.thuToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.thuToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Friday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[4] = isOn;
            })
        }

        if (this.working[4]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.friFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.friFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.friFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.friFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.friFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.friToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.friToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.friToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.friToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.friToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Saturday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[5] = isOn;
            })
        }

        if (this.working[5]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.satFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.satFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.satFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.satFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.satFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.satToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.satToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.satToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.satToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.satToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text("Sunday").fontSize(this.size)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(0x39a2db)
            .switchPointColor(0xe5ffffff)
            .onChange((isOn: boolean) => {
              this.business.setWorkingDay(1,isOn);
              this.working[6] = isOn;
            })
        }

        if (this.working[6]){
          Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}){
            Flex({justifyContent:FlexAlign.SpaceBetween,  alignItems: ItemAlign.Center}) {
              Column(){
                Text("From").fontSize(this.size-3)
                Text(this.sunFromTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.sunFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.sunFromTime)
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.sunFromTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setFromTime(1,this.sunFromTime)
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
              Column(){
                Text("To").fontSize(this.size-3)
                Text(this.sunToTime).onClick(() =>{
                  TimePickerDialog.show({
                    useMilitaryTime: this.isUseMilitaryTime,
                    onAccept: (value: TimePickerResult) => {
                      this.sunToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.sunToTime)
                      //                    console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TimePickerDialog:onCancel()")
                    },
                    onChange: (value: TimePickerResult) => {
                      this.sunToTime = JSON.stringify(value.hour.toString() + ":" + value.minute.toString())
                      this.business.setToTime(1,this.sunToTime)
                      //                    console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                }).fontSize(this.size-5).padding({top:20})
              }
            }
          }.padding(20).visibility(Visibility.Visible)
        }
      }.padding(20)
    }
  }
}