abstract class BasePojo {
    public id: string;
    equals(o: Object) {
        if (this == o) return true;
        if (!(o instanceof BasePojo)) return false;
        return this.id == (<BasePojo>o).id;
    }
}
export {BasePojo};