import { Viewer, Business } from '@ohos/bhlib'
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex {
  finalBusinessModel: Business = <Business> router.getParams().finalBusinessModel;

  build() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Viewer({
        finalBusinessModel: this.finalBusinessModel
      })
    }.backgroundColor(0xebebeb).width('100%').height('100%')
  }
}