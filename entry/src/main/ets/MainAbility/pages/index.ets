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

import { Business, BusinessPicker } from '@ohos/bhlib'
import prompt from '@system.prompt';
import router from '@system.router';

@Entry
@Component
struct Index {
  @State finalBusinessModel: Business  = new Business()
  scroller: Scroller = new Scroller();
  dayArr: string [] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  workingDays: boolean [] = [false, false, false, false, false, false, false]
  arr12: string [] = [
    "24h", "12:00 AM", "01:00 AM", "02:00 AM", "03:00 AM",
    "04:00 AM", "05:00 AM", "06:00 AM", "07:00 AM", "08:00 AM",
    "09:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM",
    "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM",
    "07:00 PM", "08:00 PM", "09:00 PM", "10:00 PM", "11:00 PM",
  ]
  arr24: string[]
    = [
    "24h", "00:00", "01:00", "02:00", "03:00",
    "04:00", "05:00", "06:00", "07:00", "08:00",
    "09:00", "10:00", "11:00", "12:00", "13:00",
    "14:00", "15:00", "16:00", "17:00", "18:00",
    "19:00", "20:00", "21:00", "22:00", "23:00",
  ]

  aboutToAppear() {
    this.finalBusinessModel.setFromArray()
    this.finalBusinessModel.setToArray()
    this.finalBusinessModel.setDayArr(this.dayArr)
    this.finalBusinessModel.setWorkingDays(this.workingDays)
    Business.setArr12(this.arr12)
    Business.setArr24(this.arr24)
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            selectedBusinessModel: $finalBusinessModel,
            bhTextColor: '#000000',
            bhTextSize: 20,
            bhTextStyle: 'calibri',
            bhFormat: 24,
            bhTodayColor: '#2c3a4f'
          })
        }

        Row() {
          Button("Apply", { type: ButtonType.Normal }).onClick(() => {
            var er = this.finalBusinessModel.isValid(this.finalBusinessModel.getWorkingDays())
            prompt.showToast({
              message: er.message
            })
          }).width('50%').backgroundColor(0x7aa150)
          Button('View', { type: ButtonType.Normal })
            .onClick(() => {
              var er = this.finalBusinessModel.isValid(this.finalBusinessModel.getWorkingDays())
              var done = er.done
              if (done) {
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
        }.padding({ left: 20, right: 20, bottom: 40 })
      }
    }
  }
}