import {Viewer} from '../common/Viewer';
import {Business} from '../common/Business';

@Component
@Preview
@Entry
struct ViewerIndex{
  finalBusinessModel : Business = new Business();
  @State s : number = 22
  build(){
    Column(){
      Viewer({
        finalBusinessModel : this.finalBusinessModel
      })

      Button("Check").onClick(() =>{
        console.log(JSON.stringify(this.finalBusinessModel))
        console.log(this.s.toString())
      })
    }
  }
}