// xxx.ets
@CustomDialog
struct CustomDialogExample {
  time: string
  arr :string[]
    =[
    "24h","00:00", "01:00", "02:00", "03:00",
    "04:00", "05:00", "06:00", "07:00", "08:00",
    "09:00", "10:00", "11:00", "12:00", "13:00",
    "14:00", "15:00", "16:00", "17:00", "18:00",
    "19:00", "20:00", "21:00", "22:00", "23:00",
  ]
  controller: CustomDialogController
  transfer(index : string){
    return index
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              .onClick((time) =>{
                this.time = item
                console.log(this.time)
                this.controller.close()
              })
          }
        }, item => item)
      }
      .listDirection(Axis.Vertical) // Arrangement direction
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // Divider line
      .edgeEffect(EdgeEffect.None) // No effect when sliding to the edge
      .chainAnimation(false)
    }.borderRadius(10)
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State fTime : string = "Ftime"
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      time:this.fTime
    }),
    autoCancel: true
  })
  build() {
    Column() {
      Button(this.fTime)
        .onClick(() => {
          this.dialogController.open()
          console.log(this.fTime)
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}