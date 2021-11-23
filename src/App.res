@scope("FileReader") @val external random: unit => float = "random"

let handleClick = _e => {
  Js.log(_e)
}

let handleFileChange = e => {
  Js.log(e)

%%raw(`
  const reader = new FileReader()
  reader.onload = () => {
    console.log('load')
  }
  reader.readAsDataURL()
`)
}

@react.component
let make = () => {
  <div className="app">
    {"Hello world" -> React.string}
    <canvas id="j-canvas"></canvas>
    <button onClick=handleClick>{"Upload image" -> React.string}</button>
    <input type_="file" onChange=handleFileChange ></input>
  </div>
}
