from dataclasses import dataclass
from util import codeToField

@dataclass
class Tune:
    filename: str           #
    contents: str           # Whole file
    group: str = ''         # G:

    reference: str = ''     # X:
    title: str = ''         # T:
    composer: str = ''      # C:
    tempo: str = ''         # Q:
    key: str = ''           # K:
    rhythm: str = ''        # R:
    meter: str = ''         # M:
    length: str = ''        # L:
    parts: str = ''         # P:

    lyrics: str = ''        # W: w:
    notes: str = ''         # N:
    source: str = ''        # S:
    origin: str = ''        # O:
    history: str = ''       # H:
    book: str = ''          # B:
    discography: str = ''   # D:
    url: str = ''           # F:
    transcription: str = '' # Z:

    instruction: str = ''   # I: %%
    comment: str = ''       # %

    def fromContents(self, verbose):
        for line in self.contents.splitlines():
            for field in ["G:", "X:", "Q:", "K:", "R:", "M:", "L:", "P:"]:
                if line.startswith(field):
                    fieldname = codeToField(field[0].lower())
                    if getattr(self, fieldname) == '':
                        setattr(self, fieldname, line[2:])

            if line.startswith("%%"):
                if self.instruction == '':
                    self.instruction = line[2:]
                elif verbose:
                    self.instruction += '\n' + line[2:]

            for field in ["T:", "C:", "W:", "w:", "N:", "S:", "O:", "H:", "B:", "D:", "F:", "Z:", "I:", "%"]:
                if line.startswith(field):
                    fieldname = codeToField(field[0].lower())
                    current = getattr(self, fieldname)
                    if current == '':
                        setattr(self, fieldname, line[2:])
                    elif verbose:
                        setattr(self, fieldname, current + '\n' + line[2:])
