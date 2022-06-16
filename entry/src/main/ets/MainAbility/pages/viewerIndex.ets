import {Viewer} from '../common/Viewer';
import {Business} from '../common/Business';
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex{
  finalBusinessModel : Business = <Business> router.getParams().finalBusinessModel;

  aboutToAppear(){
    console.log(JSON.stringify(this.finalBusinessModel))
  }
  build(){
    Column(){
      Flex({justifyContent:FlexAlign.Center}){
        Viewer({
          finalBusinessModel : this.finalBusinessModel
        })
      }
      Button("Back").onClick(()=>{
        router.back()
      })
    }
  }
}