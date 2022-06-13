import { BasePojo } from './BasePojo';

export class BusinessHours extends BasePojo {
    static week_days_int: number[] = [1, 2, 3, 4, 5, 6, 7];
    private dayIndex: number;
    private dayOfWeek: string;
    private from: string;
    private to: string;
    private isOpenDay: boolean;

    constructor(...args) {
        super();
        if (args.length == 0) {

        }
        else if (args.length == 3) {
            this.dayIndex = args[0];
            this.from = args[1];
            this.to = args[2];
        }
    }

    static getWeek_days_int = (): number[] => { return BusinessHours.week_days_int };

    public isOpenWorkDay = (): boolean => {
        return this.isOpenDay;
    }

    public setOpenDay = (openDay: boolean): void => {
        this.isOpenDay = openDay;
    }

    public getDayIndex = (): number => {
        return this.dayIndex;
    }

    public setDayIndex = (dayIndex: number): void => {
        this.dayIndex = dayIndex;
    }

    public getDayOfWeek = (): string => {
        return this.dayOfWeek;
    }

    public setDayOfWeek = (dayOfWeek: string): void =>{
        this.dayOfWeek = dayOfWeek;
    }

    public getFrom = (): string => {
        return this.from;
    }

    public setFrom = (from: string): void => {
        this.from = from;
    }

    public getTo = (): string => {
        return this.to;
    }

    public setTo(to: string): void {
        this.to = to;
    }


    public toString = (): string => {
        return this.dayOfWeek + ", " + this.from + " - " + this.to;
    }

    public compareTo = (businessHours: BusinessHours) => {
        return 0;
    }
}