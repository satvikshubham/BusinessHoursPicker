import { BusinessPicker } from '../common/BusinessPickerNew';
import { Business } from '../common/Business';

@Entry
@Component
struct indexAtr {
  finalBusinessModel: Business  = new Business()
  scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            tempModel: this.finalBusinessModel,
          })
        }
//        Row(){
//          Button('Apply', {type:ButtonType.Normal}).width('50%').backgroundColor(0x7aa150)
//          .onClick(()=>{
//            console.log(JSON.stringify(this.finalBusinessModel))
//          })
//        }.margin({ top: 20 }).alignSelf(ItemAlign.Center)
      }
    }
  }
}