import {Viewer} from '../common/Viewer'
import {Business} from '../common/Business';

@Component
@Preview
@Entry
struct ViewerIndex{
  business : Business = new Business();
  build(){
    Column(){
      Viewer({
        business : this.business
      })
    }
  }
}