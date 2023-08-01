def codeToField(field) -> str:
    if field == "g":
        return 'groups'
    elif field == "x":
        return 'reference'
    elif field == "t":
        return 'title'
    elif field == "c":
        return 'composer'
    elif field == "q":
        return 'tempo'
    elif field == "k":
        return 'key'
    elif field == "r":
        return 'rhythm'
    elif field == "m":
        return 'meter'
    elif field == "l":
        return 'length'
    elif field == "p":
        return 'parts'
    elif field == "w":
        return 'lyrics'
    elif field == "n":
        return 'notes'
    elif field == "s":
        return 'source'
    elif field == "o":
        return 'origin'
    elif field == "h":
        return 'history'
    elif field == "b":
        return 'book'
    elif field == "d":
        return 'discography'
    elif field == "f":
        return 'url'
    elif field == "z":
        return 'transcription'
    elif field == "i":
        return 'instruction'
    elif field == "%":
        return 'comment'
    else:
        return ''
