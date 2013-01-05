body = document.getElementsByTagName('body')[0]
body.style.backgroundColor = 'hotpink'


createSounds = ->
  sounds = {}

  createSoundPlayer = (file)->
    AudioFX("sounds/#{file}", pool:10)
  
  {
    register: (name,file)->
      sounds[name] = createSoundPlayer(file)

    play: (name)->
      sounds[name].play()
    stopAll: ->
      v.stop for k,v of sounds
  }

sounds = createSounds()
sounds.register('tarzan','tarzan.ogg')

body.addEventListener 'keyup', (e)->
  e.preventDefault()
  ascii = e.keyCode
  console.log("pressed #{ascii}")
  
  body.style.backgroundColor = Colors.rand()

  sounds.stopAll()
  sounds.play('tarzan')
  
