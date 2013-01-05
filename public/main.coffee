body = document.getElementsByTagName('body')[0]
body.style.backgroundColor = 'hotpink'


body.addEventListener 'keyup', (e)->
  e.preventDefault()
  ascii = e.keyCode
  console.log("pressed #{ascii}")
  
  body.style.backgroundColor = Colors.rand()
  
