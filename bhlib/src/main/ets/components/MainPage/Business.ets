import prompt from '@system.prompt';

export class Business {
  private workingDays: boolean[] = [false, false, false, false, false, false, false];
  private from: string[] = ["", "", "", "", "", "", ""]
  private to: string[] = ["", "", "", "", "", "", ""]
  private dayArr: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  constructor(business?: Business) {
    if (business) {
      this.workingDays = business.workingDays
      this.from = business.from
      this.to = business.to
    }
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
  reset = (): void => {
    this.workingDays = [false, false, false, false, false, false, false]
    this.from = ["", "", "", "", "", "", ""]
    this.to = ["", "", "", "", "", "", ""]
  }
  isValid = (working: boolean[]): any[] => {
    var done = true;
    var arr: any [] = [];
    var message: string = ""
    for (var i: number = 0;i < 7; i++) {
      if (working[i] == true) {
        if (this.getFromTime(i + 1) === "") {
          message = "Set the from and to time properly for the day: " + this.dayArr[i]
          done = false
          break
        }
      }
    }
    if (done) {
      message = "Saved"
    }
    arr.push(done)
    arr.push(message)
    return arr
  }
}
