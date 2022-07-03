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

export class Business {
  private workingDays: boolean[]
  private from: string[]
  private to: string[]
  static dayArr: string[]
  private static arr12: string []
  private static arr24: string []
  constructor(business?: Business) {
    if (business) {
      this.workingDays = business.workingDays
      this.from = business.from
      this.to = business.to
    }
  }

  static setArr12 = (arr: string[]): void => {
    Business.arr12 = arr
  }

  static setArr24 = (arr: string[]): void => {
    Business.arr24 = arr
  }

  static getArr12 = (): string[] => {
    return Business.arr12
  }
  static getArr24 = (): string [] => {
    return Business.arr24
  }

  setFromArray = (arr: string []): Business => {
    this.from = arr
    return this
  }

  setToArray = (arr: string []): Business => {
    this.to = arr
    return this
  }

  setDayArr = (arr: string[]): Business => {
    Business.dayArr = arr
    return this
  }

  setWorkingDays = (arr: boolean[]): Business => {
    this.workingDays = arr
    return this
  }

  setWorkingDay = (day: number, v: boolean): void => {
    this.workingDays[day - 1] = v;
  }
  setFromTime = (day: number, fromTime: string): void => {
    this.from[day - 1] = fromTime;
  }
  setToTime = (day: number, toTime: string): void => {
    this.to[day - 1] = toTime;
  }
  isWorkingDay = (day: number): boolean => {
    return this.workingDays[day - 1];
  }
  getWorkingDays = (): boolean[] => {
    return this.workingDays;
  }
  getFromTime = (day: number): string => {
    return this.from[day - 1];
  }
  getToTime = (day: number): string => {
    return this.to[day - 1];
  }

  isValid = (working: boolean[]): any => {
    var done = true;
    var message: string = ""
    for (var i: number = 0;i < 7; i++) {
      if (working[i] == true) {
        if (this.getFromTime(i + 1) === "") {
          message = "Set the from and to time properly for the day: " + Business.dayArr[i]
          done = false
          break
        }
      }
    }
    if (done) {
      message = "Saved"
    }
    return { done, message }
  }
}
