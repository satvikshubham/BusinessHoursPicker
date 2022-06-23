# Business Hour Picker
****
Business hour picker helps you to pick day and time corresponding to a set of working days and show them separately.  
## Dependencies
****
For using bhlib in your app, add the below dependency in the entry/package.json  
```
"dependencies": {
    "@ohos/bhlib": "file:../bhlib"
  }
```
## Usage instructions
****
Import all components at once
```
import { Business,BusinessPicker, Viewer }  from '@ohos/bhlib'
```
## Screenshots
****
![MainScreen](./Images/Mainscreen.png) ![MainScreen2](./Images/Mainscreen2.png)
![MainScreen3](./Images/Mainscreen3.png) ![ViewerScreen1](./Images/ViewerScreen1.png)

## Usage examples
***
### Main page
```
import {Business,BusinessPicker} from '@ohos/bhlib'
import prompt from '@system.prompt';
import router from '@system.router';

@Entry
@Component
struct indexAtr {
  @State finalBusinessModel: Business  = new Business()
  scroller: Scroller = new Scroller();
  tempBusiness : Business = new Business
  done : boolean
  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            selectedBusinessModel: $finalBusinessModel,
            business: this.tempBusiness
          })
        }
        Row(){
          Button("Apply", { type: ButtonType.Normal }).onClick(()=>{
            this.done = this.tempBusiness.isValid(this.tempBusiness.getWorkingDays())
            this.finalBusinessModel.reset()
            if (this.done) {
              for (var i: number = 0;i < 7; i++) {
                if (this.tempBusiness.isWorkingDay(i+1) == true) {
                  this.finalBusinessModel.setWorkingDay(i + 1, true)
                  this.finalBusinessModel.setFromTime(i + 1, this.tempBusiness.getFromTime(i + 1))
                  this.finalBusinessModel.setToTime(i + 1, this.tempBusiness.getToTime(i + 1))
                }
              }
              prompt.showToast({
                message: "Saved"
              })
            }
          }).width('50%').backgroundColor(0x7aa150)
          Button('View', { type: ButtonType.Normal })
            .onClick(() => {
              if (this.done) {
                router.push({
                  uri: 'pages/viewerIndex',
                  params: {
                    finalBusinessModel: this.finalBusinessModel,
                  } });
              }
              else {
                prompt.showToast({
                  message: "Correct changes"
                })
              }
            }).width('50%')
        }.padding({left:20, right:20})
      }
    }
  }
}
```
![](./Images/Mainscreen.png)

### Viewer page
```
import {Viewer, Business} from '@ohos/bhlib'
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex {
  finalBusinessModel: Business = <Business> router.getParams().finalBusinessModel;

  build() {
    Flex({ justifyContent:FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Viewer({
        finalBusinessModel: this.finalBusinessModel
      })
    }.backgroundColor(0xebebeb).width('100%').height('100%')
  }
}
```
![](./Images/ViewerScreen1.png)
## Compatibility
****
Supports OpenHarmony API version 8
## Code Contribution
****
If you find any problems during usage, you can submit an [issue](https://github.com/satvikshubham/BusinessHoursPicker/issues/new/choose) to us. Of course, we also welcome you to send us PR.
## Open source License
****
This project is based on [Apache License 2.0](), please enjoy and participate in open source freely.

