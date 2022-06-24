/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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