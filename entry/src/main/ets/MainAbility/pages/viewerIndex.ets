import {Viewer} from '../common/Viewer';
import {Business} from '../common/Business';
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex{
   finalBusinessModel :Business = new Business();
//   s1  = router.getParams().s1;
  build(){
    Column(){
      Viewer({
        finalBusinessModel : this.finalBusinessModel
      })

      Button("Check").onClick(() =>{
        console.log(JSON.stringify(this.finalBusinessModel))
//        console.log(this.s1.toString())
      })
    }
  }
}