@CustomDialog
struct CustomDialogExample {
  time: string
  where : string
  callback: (selIndex, where) => void
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
      List({initialIndex: 0 }) {
        ForEach(this.arr, (item) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .textAlign(TextAlign.Center).backgroundColor(0xFFFFFF)
              .onClick((time) =>{
                this.callback(item, this.where)
                this.controller.close()
              })
          }.editable(false)
        }, item => item)
      }
      .listDirection(Axis.Vertical) // Arrangement direction
      .divider({ strokeWidth: 2, color: 0xd5d9de }) // Divider line
      .edgeEffect(EdgeEffect.None) // No effect when sliding to the edge
      .chainAnimation(false)
    }.height('30%').width('50%')
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State fTime : string = "From time"
  @State tTime : string = "To time"
  @State where : string = "from"
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      time:this.fTime,
      where: this.where,
      callback:(selIndex) => this.cb(selIndex,this.where),
    }),
    autoCancel: true,
    customStyle: true,
    alignment: DialogAlignment.Default
  })
  cb(selIndex : string, what : string) {
    console.log("selIndex=" + selIndex)
    if (what === "from"){
      this.fTime = selIndex
    }
    else{
      this.tTime = selIndex
    }
  }
  build() {
    Column() {
      Button(this.fTime)
        .onClick(() => {
          this.where = "from"
          this.dialogController.open()
          console.log(this.fTime)
        }).backgroundColor(0x317aff)
      Button(this.tTime)
        .onClick(() => {
          this.where = "to"
          this.dialogController.open()
          console.log(this.fTime)
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}