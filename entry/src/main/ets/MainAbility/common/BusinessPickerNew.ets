import prompt from '@system.prompt';
import { Business } from './Business';
import { businessDayAndTime } from './BusinessDayAndTime';
import router from '@system.router';


@Component
export struct BusinessPicker {
  @State business: Business = new Business();
  day: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @Link selectedBusinessModel: Business
  done: boolean
  scroller: Scroller= new Scroller();
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]

  build() {
    Column() {
      ForEach(this.arr,
        item => {
          businessDayAndTime({
            dayIndex: item + 1,
            day: this.day[item],
            business: $business,
          })
        }
      )
    }.padding(20)
  }
}