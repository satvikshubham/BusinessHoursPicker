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

  build() {
    Scroll(this.scroller) {
      Column() {
        Flex({ direction: FlexDirection.Column, alignContent: FlexAlign.SpaceBetween }) {
          BusinessPicker({
            selectedBusinessModel: $finalBusinessModel,
            bhTextColor: '#000000',
            bhTextSize: 20,
            bhTextStyle: 'calibri',
            bhFormat: 12,
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
        }.padding({ left: 20, right: 20, bottom:40 })
      }
    }
  }
}