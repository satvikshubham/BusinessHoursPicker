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
            selectedBusinessModel: this.finalBusinessModel,
          })
        }
      }
    }
  }
}