local process = Process("image")

process.onStart(function(this)

    local img = Image("ReplaceableTextures\\Selection\\SelectionCircleLarge.blp", 128, 128)
    img.show(true)
    print(img.handle())

    time.setTimeout(5, function(curTimer)
        img.destroy()
    end)

end)
