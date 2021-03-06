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

@Component
export struct BusinessHoursWeekView {
  private showBusinessModel: Business = undefined
  isToday = new Date().getDay()
  bhIcon: Resource = $r('app.media.calendar')
  bhIconPadding: number = 10
  bhTextColor: string = '#000000'
  bhTextSize: number = 20
  bhTextStyle: string = 'calibri'
  bhTodayColor: string = '#4e754d'
  bhTodayStyle: string = 'calibri'
  bhTodayTextSize: number = 20
  bhTodayIcon: Resource = $r('app.media.unlock')

  aboutToAppear() {
    this.showBusinessModel = new Business(this.showBusinessModel)
  }

  isWorking = (business: Business, dayInd: number): boolean => {
    if (business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd)) {
      return false;
    }
    return true;
  }
  getFontStyle = (dayIndex: number): string => {
    if (dayIndex != this.isToday) {
      return this.bhTextStyle
    }
    else {
      return this.bhTodayStyle
    }
  }
  getFontSize = (dayIndex: number): number => {
    if (dayIndex != this.isToday) {
      return this.bhTextSize
    }
    else {
      return this.bhTodayTextSize
    }
  }
  getText = (business: Business, dayInd: number): string => {
    var a: string = ""
    if (!(business.getFromTime(dayInd) == "" && !business.isWorkingDay(dayInd))) {
      a = business.getFromTime(dayInd) + " - " + business.getToTime(dayInd)
    }
    return a;
  }
  getFontColor = (dayInd: number): string => {
    if (dayInd != this.isToday) {
      return this.bhTextColor
    }
    else {
      return this.bhTodayColor
    }
  }
  getImage = (bus: Business, dayInd :number): Resource => {
    if (dayInd != this.isToday) {
      return this.bhIcon
    }
    else {
      return this.bhTodayIcon
    }
  }
  arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  dayArr: string[] = Business.dayArr

  build() {
    Column({ space: 10 }) {
      ForEach(this.arr,
        item => {
          if (this.isWorking(this.showBusinessModel, item + 1)) {
            Row({ space: 10 }) {
              Image(this.getImage(this.showBusinessModel, item + 1)).width(20).height(20).objectFit(ImageFit.ScaleDown)
              Text(this.dayArr[item] + ", " + this.getText(this.showBusinessModel, item + 1))
                .fontSize(this.getFontSize(item + 1))
                .fontColor(this.getFontColor(item + 1))
                .fontFamily(this.getFontStyle(item + 1))
                .padding({ left: this.bhIconPadding })
            }.width('100%')
          }
        }
      )
    }.padding(20).backgroundColor(0xFFFFFF)
    .justifyContent(FlexAlign.Center)
  }
}