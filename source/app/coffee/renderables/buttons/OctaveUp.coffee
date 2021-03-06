# import renderables.buttons.Button
class OctaveUp extends Button

    constructor: ->
        super AppData.ASSETS.sprite.textures['octave.png']

        @overAlpha = 0.11
        @outAlpha = 0.1
        @downAlpha = 1.0

        @texture.alpha = @outAlpha

        @hint = new PIXI.Text 'UP', AppData.TEXTFORMAT.HINT
        @hint.anchor.x = 0.5
        @hint.anchor.y = 0
        @hint.scale.x = @hint.scale.y = 0.5
        @hint.x = @texture.width / 2
        @hint.y = 10 * AppData.RATIO
        @hint.tint = 0x5A5A5A
        @hint.visible = AppData.SHOW_LABELS
        @addChild @hint

        @enable()

    onHelp: =>
        @hint.visible = AppData.SHOW_LABELS
        null

    onDown: =>
        Audio.OCTAVE_STEP++
        if Audio.OCTAVE_STEP > Audio.CUR_OCTAVE.length-1
            Audio.OCTAVE_STEP = Audio.CUR_OCTAVE.length-1
        @select()
        null

    onUp: =>
        @unselect()
        null

    onOutside: =>
        @unselect()
        null
