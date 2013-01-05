body = document.getElementsByTagName('body')[0]
body.style.backgroundColor = 'hotpink'


createSounds = ->
  sounds = {}

  createSoundPlayer = (file)->
    AudioFX("sounds/#{file}", pool:10)

  allSounds = -> _.values(sounds)

  numberOfSounds = -> _.size(sounds)
  
  {
    register: (name,file)->
      sounds[name] = createSoundPlayer(file)

    registerMp3s: (names)->
      @register(name,"#{name}.mp3") for name in names

    play: (name)->
      sounds[name].play()

    playRandom: ->
      index = Math.floor( Math.random() * numberOfSounds() ) 
      sound = allSounds()[index]
      sound.play()

    stopAll: ->
      v.stop for k,v of sounds
  }

sounds = createSounds()
# sounds.register('tarzan','tarzan.ogg')
sounds.registerMp3s(['quack','ribbit','moo'])

doSomethingRandom = ->
  body.style.backgroundColor = Colors.rand()

  sounds.stopAll()
  sounds.playRandom()

body.addEventListener 'keyup', (e)->
  e.preventDefault()
  ascii = e.keyCode
  console.log("pressed #{ascii}")

  doSomethingRandom()

body.addEventListener 'click', (e)->
  doSomethingRandom()

body.addEventListener 'touchend', (e)->
  doSomethingRandom()
  
