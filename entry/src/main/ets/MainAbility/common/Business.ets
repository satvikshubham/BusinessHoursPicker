class Business {
    daysOfWeek: number[] = [1, 2, 3, 4, 5, 6, 7];
    private workingDays: boolean[] = [false, false, false, false, false, false, false];
    private from: string[] = ["", "", "", "", "", "", ""]
    private to: string[] = ["", "", "", "", "", "", ""]
    constructor(business? : Business) {
        if (business) {
            this.daysOfWeek = business.daysOfWeek
            this.workingDays = business.workingDays
            this.from = business.from
            this.to = business.to
        }
    }
    setWorkingDay = (day: number,v : boolean): void => {
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
    getWorkingDays = (): boolean[]=> {
        return this.workingDays;
    }
    getFromTime = (day: number): string => {
        return this.from[day - 1];
    }
    getToTime = (day: number): string => {
        return this.to[day - 1];
    }
    reset = () :void =>{
        this.workingDays = [false, false, false, false, false, false, false]
        this.from = ["", "", "", "", "", "", ""]
        this.to = ["", "", "", "", "", "", ""]
    }
}
export {Business};