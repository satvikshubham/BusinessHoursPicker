import {Viewer} from '../common/Viewer';
import {Business} from '../common/Business';
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex{
  finalBusinessModel : Business = <Business> router.getParams().finalBusinessModel;
  build(){
    Column({space:10}){
        Viewer({
          finalBusinessModel : this.finalBusinessModel
        })
      Button("Back").onClick(()=>{
        router.back()
      })
    }
  }
}