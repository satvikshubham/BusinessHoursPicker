import { BusinessHoursWeekView, Business } from '@ohos/bhlib'
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex {
  finalBusinessModel: Business = <Business> router.getParams().finalBusinessModel;

  build() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      BusinessHoursWeekView({
        showBusinessModel: this.finalBusinessModel,
        bhIcon: $r('app.media.calendar'),
        bhIconPadding: 20,
        bhTextColor: '#000000',
        bhTextSize: 20,
        bhTextStyle: 'calibri',
        bhTodayColor: '#854a3e',
        bhTodayStyle: 'calibri',
        bhTodayTextSize: 22,
        bhTodayIcon: $r('app.media.unlock')
      })
    }.backgroundColor(0xebebeb).width('100%').height('100%')
  }
}