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

    registerOggs: (names)->
      @register(name,"#{name}.ogg") for name in names

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
sounds.registerOggs(['quack','ribbit','moo'])

body.addEventListener 'keyup', (e)->
  e.preventDefault()
  ascii = e.keyCode
  console.log("pressed #{ascii}")
  
  body.style.backgroundColor = Colors.rand()

  sounds.stopAll()
  sounds.playRandom()
  
