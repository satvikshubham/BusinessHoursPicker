import { Business } from './Business';
import { BusinessDayAndTime } from './BusinessDayAndTime';

@Component
export struct BusinessPicker {
  @Link selectedBusinessModel: Business
  day: string [] = Business.dayArr
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  bhTextColor: string = '#000000'
  bhTextSize: number = 20
  bhTextStyle: string = 'calibri'
  bhFormat: number = 24
  bhTodayColor : string = '#4e754d'

  build() {
    Column() {
      ForEach(this.arr,
        item => {
          BusinessDayAndTime({
            dayIndex: item + 1,
            day: this.day[item],
            business: $selectedBusinessModel,
            bhTextColor: this.bhTextColor,
            bhTextSize: this.bhTextSize,
            bhTextStyle: this.bhTextStyle,
            bhFormat: this.bhFormat,
            bhTodayColor : this.bhTodayColor
          })
        }
      )
    }.padding(20)
  }
}