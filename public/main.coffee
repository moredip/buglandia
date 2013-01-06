body = document.getElementsByTagName('body')[0]
body.style.backgroundColor = 'hotpink'

chooseRandomElementFrom = (array)->
  index = Math.floor( Math.random() * array.length ) 
  array[index]

createSounds = ->
  sounds = {}

  createSoundPlayer = (file)->
    AudioFX("sounds/#{file}", pool:10)

  allSounds = -> _.values(sounds)

  {
    register: (name,file)->
      sounds[name] = createSoundPlayer(file)

    registerMp3s: (names)->
      @register(name,"#{name}.mp3") for name in names

    play: (name)->
      sounds[name].play()

    playRandom: ->
      chooseRandomElementFrom( allSounds() ).play()

    stopAll: ->
      v.stop for k,v of sounds
  }


createShapes = ->
  shapeEls = -> 
    document.getElementsByClassName('shape')

  hideAll = ->
    shapeEl.classList.remove('show') for shapeEl in shapeEls()

  showShape = (shapeEl)->
    hideAll()
    shapeEl.classList.add('show')

  {
    showRandom: ->
      showShape( chooseRandomElementFrom(shapeEls()) )
  }



do setup = ->
  doSomethingRandom = ->
    body.style.backgroundColor = Colors.rand()

    sounds.stopAll()
    sounds.playRandom()

    shapes.showRandom()

  sounds = createSounds()
  sounds.registerMp3s(['quack','ribbit','moo'])

  shapes = createShapes()


  body.addEventListener 'keyup', (e)->
    e.preventDefault()
    ascii = e.keyCode
    console.log("pressed #{ascii}")

    doSomethingRandom()

  body.addEventListener 'click', (e)->
    doSomethingRandom()

  body.addEventListener 'touchend', (e)->
    doSomethingRandom()
    
