import { Business, BusinessPicker } from '@ohos/bhlib'
import prompt from '@system.prompt';
import router from '@system.router';

@Entry
@Component
struct Index {
  @State finalBusinessModel: Business  = new Business()
  scroller: Scroller = new Scroller();
  done: boolean

  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            selectedBusinessModel: $finalBusinessModel,
            bhTextColor: '#000000',
            bhTextSize: 20,
            bhTextStyle: 'calibri',
            bhFormat : 12
          })
        }

        Row() {
          Button("Apply", { type: ButtonType.Normal }).onClick(() => {
            var er = this.finalBusinessModel.isValid(this.finalBusinessModel.getWorkingDays())
            this.done = er.done
            prompt.showToast({
              message: er.message
            })
          }).width('50%').backgroundColor(0x7aa150)
          Button('View', { type: ButtonType.Normal })
            .onClick(() => {
              var er = this.finalBusinessModel.isValid(this.finalBusinessModel.getWorkingDays())
              this.done = er.done
              if (this.done) {
                router.push({
                  uri: 'pages/viewerIndex',
                  params: {
                    finalBusinessModel: this.finalBusinessModel,
                  } });
              }
              else {
                prompt.showToast({
                  message: er.message
                })
              }
            }).width('50%')
        }.padding({ left: 20, right: 20 })
      }
    }
  }
}